package service

import (
	"dilu/common/codes"
	"dilu/common/consts"
	"dilu/common/utils"
	"dilu/modules/dental/enums"
	"dilu/modules/dental/models"
	"dilu/modules/dental/service/dto"
	smodels "dilu/modules/sys/models"

	senums "dilu/modules/sys/enums"
	"dilu/modules/sys/service"
	"fmt"
	"strconv"
	"strings"
	"time"

	"github.com/baowk/dilu-core/core"
	"github.com/baowk/dilu-core/core/base"
	"github.com/baowk/dilu-core/core/errs"
	"github.com/jinzhu/copier"
	"github.com/shopspring/decimal"

	"github.com/xuri/excelize/v2"
)

type BillService struct {
	*base.BaseService
}

var SerBill = BillService{
	base.NewService(consts.DB_CRM),
}

func (s *BillService) Page(teamId int, userId int, req dto.BillGetPageReq, list *[]dto.BillDto, total *int64) error {
	var tu smodels.SysMember
	service.SerSysMember.GetMember(teamId, userId, &tu)
	uid := 0
	var deptPath string
	if tu.PostId == senums.Staff.Id {
		uid = userId
	} else if tu.PostId > senums.Admin.Id {
		deptPath = tu.DeptPath
	}

	db := s.DB().Offset(req.GetOffset()).Limit(req.GetSize()).Order("id desc")
	if teamId > 0 {
		db.Where("team_id = ?", teamId)
	}
	if req.TradeType != 0 {
		db.Where("trade_type = ?", req.TradeType)
	}
	if !req.Begin.IsZero() {
		db.Where("trade_at > ?", req.Begin)
	}
	if !req.End.IsZero() {
		db.Where("trade_at < ?", req.End)
	}
	if req.UserId > 0 {
		db.Where("user_id = ?", req.UserId)
	}
	if uid > 0 {
		db.Where("user_id =?", uid)
	} else if deptPath != "" {
		db.Where("dept_path like?", deptPath+"%")
	}
	var ds []models.Bill
	db.Find(&ds).Offset(-1).Limit(-1).Count(total)
	var cids []int
	for _, b := range ds {
		cids = append(cids, b.CustomerId)

	}
	var cs []models.Customer
	if len(cids) > 0 {
		if err := SerCustomer.GetByIds(teamId, cids, &cs); err != nil {
			return err
		}
	}
	for _, b := range ds {
		for _, c := range cs {
			if c.Id == b.CustomerId {
				var bt dto.BillDto

				copier.Copy(&bt, b)
				fmt.Println(b, bt)
				bt.CustomerName = c.Name
				*list = append(*list, bt)
				break
			}
		}
	}
	return nil
}

func (s *BillService) CreateBill(reqId string, bill dto.IdentifyBillDto, dbill *models.Bill, createBy int) errs.IError {
	if bill.TeamId < 1 {
		return codes.ErrInvalidParameter(reqId, "teamId is nil")
	}
	if bill.UserId < 1 {
		return codes.ErrInvalidParameter(reqId, "userId is nil")
	}
	var team smodels.SysTeam
	if err := service.SerSysTeam.Get(bill.TeamId, &team); err != nil {
		return codes.ErrNotFound(strconv.Itoa(bill.TeamId), "team", reqId, err)
	}
	var teamM smodels.SysMember
	if err := service.SerSysMember.GetMember(bill.TeamId, bill.UserId, &teamM); err != nil {
		return codes.ErrNotFound(fmt.Sprintf("%d-%d", bill.TeamId, bill.UserId), "teamMember", reqId, err)
	}
	if bill.CustomerId < 1 {
		var customers []models.Customer
		if err := SerCustomer.GetByUserIdAndName(bill.UserId, 0, bill.CustomerName, &customers); err != nil {
			core.Log.Error("获取客户错误", err)
		}
		if len(customers) > 0 {
			bill.CustomerId = customers[0].Id
		} else {
			customer := models.Customer{
				Name:        bill.CustomerName,
				UserId:      bill.UserId,
				TeamId:      bill.TeamId,
				InviterName: bill.InviterName,
				Inviter:     bill.Inviter,
				CreateBy:    createBy,
				DeptPath:    teamM.DeptPath,
			}
			if err := SerCustomer.Create(&customer); err != nil {
				return codes.ErrSys(err)
			}
			bill.CustomerId = customer.Id
		}
	} else {
		var customer models.Customer
		if err := SerCustomer.Get(bill.CustomerId, &customer); err != nil {
			return codes.ErrNotFound(strconv.Itoa(bill.CustomerId), "customer", reqId, err)
		}
	}
	if err := copier.Copy(dbill, bill); err != nil {
		return codes.ErrSys(err)
	}

	dbill.DeptPath = teamM.DeptPath

	if dbill.TradeType == int(enums.TradeDebt) {
		dbill.DebtAmount = dbill.PaidAmount
		dbill.PaidAmount = decimal.Zero
		dbill.RefundAmount = decimal.Zero
	} else if dbill.TradeType == int(enums.TradeRefund) {
		dbill.RefundAmount = dbill.PaidAmount
		dbill.PaidAmount = decimal.Zero
	}
	dbill.CreatedAt = time.Now()
	dbill.UpdatedAt = dbill.CreatedAt

	if bill.TradeAt != "" {
		if d, err := time.Parse("2006-01-02", bill.TradeAt); err != nil {
			dbill.TradeAt = dbill.CreatedAt
		} else {
			dbill.TradeAt = d
		}
	}

	// if bill.ImplantedCount < 1 {
	// 	dbill.Implant = 1
	// } else {
	// 	if bill.ImplantDate != "" {
	// 		if d, err := time.Parse("2006-01-02", bill.ImplantDate); err == nil {
	// 			dbill.ImplantDate = d
	// 		}
	// 	} else {
	// 		dbill.ImplantDate = dbill.TradeAt
	// 	}
	// 	if bill.ImplantedCount < bill.DentalCount {
	// 		dbill.Implant = 2
	// 	} else {
	// 		dbill.Implant = 3
	// 	}
	// }

	if bill.PaybackDate != "" {
		if d, err := time.Parse("2006-01-02", bill.PaybackDate); err == nil {
			dbill.PaybackDate = d
		}
	}

	dbill.No = strings.Replace(dbill.CreatedAt.Format("20060102150405.000000"), ".", "", -1)
	dbill.CreateBy = createBy

	if dbill.Pack == 0 {
		if dbill.Brand1 == 0 && dbill.Brand2 == 0 && dbill.Brand3 == 0 && dbill.Brand4 == 0 && dbill.Brand5 == 0 {
			dbill.Pack = int(enums.General)
		}
		// if dbill.TradeType == int(enums.TradeDeal) && dbill.DentalCount == 0 {
		// 	dbill.Pack = int(enums.General)
		// }
	}

	if err := s.Create(dbill); err != nil {
		return codes.ErrSys(err)
	}
	return nil
}

func (s *BillService) UpdateBill(reqId string, bill dto.IdentifyBillDto, dbill *models.Bill, createBy int) errs.IError {
	if bill.TeamId < 1 {
		return codes.ErrInvalidParameter(reqId, "teamId is nil")
	}
	if bill.UserId < 1 {
		return codes.ErrInvalidParameter(reqId, "userId is nil")
	}
	var team smodels.SysTeam
	if err := service.SerSysTeam.Get(bill.TeamId, &team); err != nil {
		return codes.ErrNotFound(strconv.Itoa(bill.TeamId), "team", reqId, err)
	}
	var teamM smodels.SysMember
	if err := service.SerSysMember.GetMember(bill.TeamId, bill.UserId, &teamM); err != nil {
		return codes.ErrNotFound(fmt.Sprintf("%d-%d", bill.TeamId, bill.UserId), "teamMember", reqId, err)
	}
	if bill.CustomerId < 1 {
		var customers []models.Customer
		if err := SerCustomer.GetByUserIdAndName(bill.UserId, 0, bill.CustomerName, &customers); err != nil {
			core.Log.Error("获取客户错误", err)
		}
		if len(customers) > 0 {
			bill.CustomerId = customers[0].Id
		} else {
			customer := models.Customer{
				Name:        bill.CustomerName,
				UserId:      bill.UserId,
				TeamId:      bill.TeamId,
				InviterName: bill.InviterName,
				Inviter:     bill.Inviter,
				CreateBy:    createBy,
				DeptPath:    teamM.DeptPath,
			}
			if err := SerCustomer.Create(&customer); err != nil {
				return codes.ErrSys(err)
			}
			bill.CustomerId = customer.Id
		}
	} else {
		var customer models.Customer
		if err := SerCustomer.Get(bill.CustomerId, &customer); err != nil {
			return codes.ErrNotFound(strconv.Itoa(bill.CustomerId), "customer", reqId, err)
		}
	}
	if err := copier.Copy(dbill, bill); err != nil {
		return codes.ErrSys(err)
	}

	dbill.DeptPath = teamM.DeptPath

	if dbill.TradeType == int(enums.TradeDebt) {
		dbill.DebtAmount = dbill.PaidAmount
		dbill.PaidAmount = decimal.Zero
		dbill.RefundAmount = decimal.Zero
	} else if dbill.TradeType == int(enums.TradeRefund) {
		dbill.RefundAmount = dbill.PaidAmount
		dbill.PaidAmount = decimal.Zero
	}
	dbill.UpdatedAt = time.Now()

	if bill.TradeAt != "" {
		if d, err := time.Parse("2006-01-02", bill.TradeAt); err != nil {
			dbill.TradeAt = dbill.CreatedAt
		} else {
			dbill.TradeAt = d
		}
	}

	// if bill.ImplantedCount < 1 {
	// 	dbill.Implant = 1
	// } else {
	// 	if bill.ImplantDate != "" {
	// 		if d, err := time.Parse("2006-01-02", bill.ImplantDate); err == nil {
	// 			dbill.ImplantDate = d
	// 		}
	// 	} else {
	// 		dbill.ImplantDate = dbill.TradeAt
	// 	}
	// 	if bill.ImplantedCount < bill.DentalCount {
	// 		dbill.Implant = 2
	// 	} else {
	// 		dbill.Implant = 3
	// 	}
	// }

	if bill.PaybackDate != "" {
		if d, err := time.Parse("2006-01-02", bill.PaybackDate); err == nil {
			dbill.PaybackDate = d
		}
	}

	//dbill.No = strings.Replace(dbill.CreatedAt.Format("20060102150405.000000"), ".", "", -1)
	dbill.UpdateBy = createBy

	if err := s.UpdateById(dbill); err != nil {
		return codes.ErrSys(err)
	}
	return nil
}

// func (s *BillService) LinkBill(reqId string, bill dto.LinkBillDto) errs.IError {
// 	var old models.Bill
// 	if err := s.Get(bill.LinkId, &old); err != nil {
// 		return codes.ErrSys(err)
// 	}

// 	curBill := models.Bill{
// 		LinkId:         bill.LinkId,
// 		TeamId:         old.TeamId,
// 		CustomerId:     old.CustomerId,
// 		UserId:         old.UserId,
// 		DeptPath:       old.DeptPath,
// 		Amount:         decimal.Zero,
// 		TradeType:      bill.TradeType,
// 		DentalCount:    0,
// 		Brand1:         old.Brand1,
// 		Brand2:         old.Brand2,
// 		Brand3:         old.Brand3,
// 		Brand4:         old.Brand4,
// 		Brand5:         old.Brand5,
// 		Brand6:         old.Brand6,
// 		Source:         old.Source,
// 		DiagnosisType:  old.DiagnosisType,
// 		ImplantedCount: old.ImplantedCount,
// 		Doctor:         old.Doctor,
// 		Pack:           old.Pack,
// 		PaybackDate:    old.PaybackDate,
// 		Tags:           old.Tags,
// 		PrjName:        old.PrjName,
// 		OtherPrj:       old.OtherPrj,
// 		Remark:         bill.Remark,
// 	}

// 	if bill.TradeType == int(enums.TradeDeal) {
// 		return errs.ErrWithCode(codes.InvalidParameter)
// 	} else if bill.TradeType == int(enums.TradeBalance) {
// 		d, err := decimal.NewFromString(bill.PaidAmount)
// 		if err != nil {
// 			return codes.ErrSys(err)
// 		}
// 		curBill.PaidAmount = d

// 		d, err = decimal.NewFromString(bill.RealAmount)
// 		if err != nil {
// 			return codes.ErrSys(err)
// 		}
// 		curBill.RealAmount = d
// 	} else if bill.TradeType == int(enums.TradeDebt) {
// 		d, err := decimal.NewFromString(bill.PaidAmount)
// 		if err != nil {
// 			return codes.ErrSys(err)
// 		}
// 		curBill.DebtAmount = d

// 		d2, err := decimal.NewFromString(bill.RealAmount)
// 		if err != nil {
// 			return codes.ErrSys(err)
// 		}
// 		if d2.Cmp(decimal.Zero) > 0 {
// 			curBill.RealAmount = d2
// 			curBill.DebtAmount = curBill.DebtAmount.Sub(d2)
// 			curBill.PaidAmount = d2
// 		}

// 	} else if bill.TradeType == int(enums.TradeRefund) {
// 		d, err := decimal.NewFromString(bill.PaidAmount)
// 		if err != nil {
// 			return codes.ErrSys(err)
// 		}
// 		curBill.RefundAmount = d
// 	}

// 	if bill.TradeAt != "" {
// 		if d, err := time.Parse("2006-01-02", bill.TradeAt); err != nil {
// 			curBill.TradeAt = curBill.CreatedAt
// 		} else {
// 			curBill.TradeAt = d
// 		}
// 	}

// 	if bill.ImplantedCount < 1 {
// 		curBill.Implant = old.Implant
// 	} else {
// 		if bill.ImplantDate != "" {
// 			if d, err := time.Parse("2006-01-02", bill.ImplantDate); err == nil {
// 				curBill.ImplantDate = d
// 			}
// 		} else {
// 			curBill.ImplantDate = curBill.TradeAt
// 		}
// 		if bill.ImplantedCount+old.ImplantedCount < old.DentalCount {
// 			curBill.Implant = 2
// 		} else {
// 			curBill.Implant = 3
// 		}
// 	}
// 	curBill.No = strings.Replace(curBill.CreatedAt.Format("20060102150405.000000"), ".", "", -1)
// 	if err := s.Create(curBill); err != nil {
// 		return codes.ErrSys(err)
// 	}
// 	return nil
// }

func (s *BillService) Identify(req dto.BillTmplReq, bill *dto.IdentifyBillDto) errs.IError {
	(*bill).TeamId = req.TeamId
	arr := strings.Split(req.Text, "\n")
	var custName string
	for _, v := range arr {
		if strings.Trim(v, " ") == "" {
			continue
		}
		for _, key := range enums.Counselor {
			if strings.Contains(v, key) {
				(*bill).Name = getVal(v)
				break
			}
		}
		for _, key := range enums.TradeAt {
			if strings.Contains(v, key) {
				tmpD := getVal(v)
				if tmpD != "" {
					(*bill).TradeAt = getDate(tmpD)
				}
				break
			}
		}

		for _, key := range enums.CustomerName {
			if strings.Contains(v, key) {
				custName = getVal(v)
				break
			}
		}
		for _, key := range enums.Doctor {
			if strings.Contains(v, key) {
				(*bill).Doctor = getVal(v)
				break
			}
		}
		for _, key := range enums.Project {
			if strings.Contains(v, key) {
				(*bill).PrjName = getVal(v)
				break
			}
		}

		for _, key := range enums.Cnt {
			if strings.Contains(v, key) {
				cntStr := getVal(v)
				if cnt, err := strconv.Atoi(cntStr); err == nil {
					(*bill).DentalCount = cnt
				}
				break
			}
		}
		for _, key := range enums.Others {
			if strings.Contains(v, key) {
				(*bill).OtherPrj = getVal(v)
				break
			}
		}
		for _, key := range enums.Total {
			if strings.Contains(v, key) {
				(*bill).RealAmount = getVal(v)
				break
			}
		}
		for _, key := range enums.Paid {
			if strings.Contains(v, key) {
				(*bill).PaidAmount = getVal(v)
				break
			}
		}
		for _, key := range enums.Debts {
			if strings.Contains(v, key) {
				(*bill).Debts = getVal(v)
				break
			}
		}
		for _, key := range enums.PaybackDate {
			if strings.Contains(v, key) {
				tmpD := getVal(v)
				if tmpD != "" {
					(*bill).PaybackDate = getDate(tmpD)
				}
				break
			}
		}
		for _, key := range enums.Implant {
			if strings.Contains(v, key) {
				imp := getVal(v)
				var flag bool
				for _, iv := range enums.ImplantVals {
					if imp == iv {
						(*bill).Implant = int(enums.ImplantFull)
						flag = true
						break
					}
				}
				if !flag {
					(*bill).Implant = int(enums.ImplantHalf)
				}
				break
			}
		}
		for _, key := range enums.Extensions {
			if strings.Contains(v, key) {
				(*bill).Extensions = getVal(v)
				break
			}
		}
		for _, key := range enums.Remark {
			if strings.Contains(v, key) {
				(*bill).Remark = getVal(v)
				break
			}
		}
		if bill.Implant == 3 {
			(*bill).ImplantedCount = bill.DentalCount
			(*bill).ImplantDate = bill.TradeAt
		}
	}
	if strings.Contains(req.Text, "奥齿泰") {
		bill.Brand1 = bill.DentalCount
		bill.Brand1Impl = bill.ImplantedCount
	} else if strings.Contains(req.Text, "皓圣") {
		bill.Brand2 = bill.DentalCount
		bill.Brand2Impl = bill.ImplantedCount
	} else if strings.Contains(req.Text, "雅定") {
		bill.Brand3 = bill.DentalCount
		bill.Brand3Impl = bill.ImplantedCount
	} else if strings.Contains(req.Text, "ITI") {
		bill.Brand4 = bill.DentalCount
		bill.Brand4Impl = bill.ImplantedCount
	} else if strings.Contains(req.Text, "诺贝尔") {
		bill.Brand1 = bill.DentalCount
		bill.Brand1Impl = bill.ImplantedCount
	}

	if strings.Contains(req.Text, "转介绍") {
		bill.Source = 2
	} else {
		bill.Source = 1
	}

	if strings.Contains(req.Text, "复诊") {
		bill.DiagnosisType = 2
	} else if strings.Contains(req.Text, "新诊") {
		bill.DiagnosisType = 3
	} else {
		bill.DiagnosisType = 1
	}

	if bill.PrjName == "半口" {
		bill.Pack = int(enums.PackHalf)
	} else if bill.PrjName == "全口" {
		bill.Pack = int(enums.PackFull)
		// } else if bill.DentalCount > 0 {
		// 	bill.Pack = int(enums.PackCnt)
	} else {
		bill.Pack = int(enums.General)
	}

	var members []smodels.SysMember
	if err := service.SerSysMember.GetMembers(req.TeamId, 0, "", bill.Name, 0, &members); err != nil {
		core.Log.Error("获取咨询师错误", err)
		return errs.Err(codes.FAILURE, "", err)
	}
	if len(members) > 0 {
		(*bill).UserId = members[0].UserId
	}

	var customers []models.Customer
	if err := SerCustomer.GetByUserIdAndName(bill.UserId, 0, custName, &customers); err != nil {
		core.Log.Error("获取客户错误", err)
	}
	for _, c := range customers {
		op := dto.Option{
			Value: c.Id,
			Label: c.Name,
		}
		(*bill).Customers = append((*bill).Customers, op)
	}
	if len(customers) > 0 {
		(*bill).CustomerId = customers[0].Id
		(*bill).CustomerName = customers[0].Name
	} else {
		(*bill).CustomerName = custName
	}
	// if bill.Implant == 3 {
	// 	(*bill).ImplantedCount = bill.DentalCount
	// 	(*bill).ImplantDate = bill.TradeAt
	// }
	// if bill.BrandName != "" {
	// 	bn := strings.ToUpper(bill.BrandName)
	// 	for _, v := range enums.DentalBrands {
	// 		if strings.Contains(bn, v.Name) {
	// 			bill.Brand = v.Id
	// 			break
	// 		}
	// 		for _, a := range v.Alias {
	// 			if strings.Contains(bn, a) {
	// 				bill.Brand = v.Id
	// 				break
	// 			}
	// 		}
	// 		if bill.Brand > 0 {
	// 			break
	// 		}
	// 	}
	// }
	(*bill).TradeType = int(enums.TradeDeal)
	if bill.RealAmount == "" && bill.PaidAmount != "" {
		(*bill).TradeType = int(enums.TradeBalance)
	}
	if bill.PaidAmount == "" && bill.RealAmount != "" {
		(*bill).PaidAmount = bill.RealAmount
	}
	return nil
}

func getVal(data string) string {
	data = strings.ReplaceAll(data, "：", ":")
	arr := strings.Split(data, ":")
	if len(arr) == 2 {
		return strings.Trim(arr[1], " ")
	}
	return ""
}

func getDate(tmpD string) string {
	var sep string
	if strings.Contains(tmpD, ".") {
		sep = "."
	} else if strings.Contains(tmpD, "-") {
		sep = "-"
	} else if strings.Contains(tmpD, "/") {
		sep = "/"
	} else if strings.Contains(tmpD, ":") {
		sep = ":"
	} else if strings.Contains(tmpD, ",") {
		sep = ","
	} else if strings.Contains(tmpD, "。") {
		sep = "。"
	}
	arr := strings.Split(tmpD, sep)
	if len(arr) == 3 {
		for idx, d := range arr {
			d = strings.Trim(d, " ")
			if len(d) == 1 {
				d = "0" + d
			}
			arr[idx] = d
		}
		return strings.Join(arr, "-")
	}
	return ""
}

// /*
// *	日统计文字版
//  */
// func (s *BillService) StDay(teamId, userId int, deptPath string, day time.Time, reqId string) (string, error) {

// 	if teamId < 1 {
// 		return "", codes.ErrInvalidParameter(reqId, "teamId is nil")
// 	}
// 	today := utils.GetZoreTimeLocal(day)
// 	end := today.Add(24 * time.Hour)
// 	begin := utils.GetMonthFirstDayLocal(day)
// 	unixToday := today.Unix()

// 	var curM smodels.SysMember
// 	if deptPath == "" {
// 		service.SerSysMember.GetMember(teamId, userId, &curM)
// 		deptPath = curM.DeptPath
// 	}

// 	db := s.DB().Where("team_id = ?", teamId).Where("trade_at >=?", begin).
// 		Where("trade_at < ?", end).Where("dept_path like ?", deptPath+"%")
// 	var list []models.Bill
// 	if err := db.Find(&list).Error; err != nil {
// 		return "", err
// 	}
// 	var totalDeal, totalPaid, totalDebt, totalrRefund, deal, paid, debt, refund, arrear decimal.Decimal
// 	var firstCnt, dealCnt int
// 	for _, b := range list {
// 		totalDeal = totalDeal.Add(b.RealAmount)
// 		totalPaid = totalPaid.Add(b.PaidAmount)
// 		totalDebt = totalDebt.Add(b.DebtAmount)
// 		totalrRefund = totalrRefund.Add(b.RefundAmount)
// 		if b.TradeAt.Unix() >= unixToday {
// 			deal = deal.Add(b.RealAmount)
// 			paid = paid.Add(b.PaidAmount)
// 			debt = debt.Add(b.DebtAmount)
// 			refund = refund.Add(b.RefundAmount)
// 			if b.TradeType == int(enums.TradeDeal) {
// 				arrear = arrear.Add(b.RealAmount.Sub(b.PaidAmount))
// 				//dealCnt += 1
// 			}
// 		}
// 	}

// 	var edList []models.EventDaySt
// 	if err := SerEventDaySt.GetList(teamId, 0, deptPath, today, end, &edList); err != nil {
// 		return "", err
// 	}
// 	for _, ed := range edList {
// 		firstCnt += ed.FirstDiagnosis
// 		dealCnt += ed.Deal
// 	}
// 	todayPaid := paid.Add(debt)
// 	tPaid := totalPaid.Add(totalDebt).Sub(totalrRefund)
// 	var texts utils.StringBuilder
// 	texts.Append(fmt.Sprintf("今日初诊数：%d\n", firstCnt))
// 	texts.Append(fmt.Sprintf("今日成交患者：%d\n", dealCnt))
// 	texts.Append(fmt.Sprintf("今日成交流水：%s\n", deal.StringFixedBank(0)))
// 	texts.Append(fmt.Sprintf("今日实收流水：%s\n", todayPaid.StringFixedBank(0)))
// 	texts.Append(fmt.Sprintf("今日欠款：%s\n", arrear.StringFixedBank(0)))
// 	texts.Append(fmt.Sprintf("总成交：%s\n", totalDeal.StringFixedBank(0)))
// 	texts.Append(fmt.Sprintf("总实收：%s\n", tPaid.StringFixedBank(0)))
// 	return texts.String(), nil
// }

var chinaWeekNames = []string{
	"日",
	"一",
	"二",
	"三",
	"四",
	"五",
	"六",
}

/*
*	日统计文字版
 */
func (s *BillService) StDayV2(teamId, userId int, deptPath string, day time.Time, reqId string) (string, error) {
	if teamId < 1 {
		return "", codes.ErrInvalidParameter(reqId, "teamId is nil")
	}
	today := utils.GetZoreTimeLocal(day)
	end := today.Add(24 * time.Hour)
	begin := utils.GetMonthFirstDayLocal(day)
	unixToday := today.Unix()

	var curM smodels.SysMember
	if deptPath == "" {
		service.SerSysMember.GetMember(teamId, userId, &curM)
		deptPath = curM.DeptPath
	}

	db := s.DB().Where("team_id = ?", teamId).Where("trade_at >=?", begin).
		Where("trade_at < ?", end).Where("dept_path like ?", deptPath+"%")
	var list []models.Bill
	if err := db.Find(&list).Error; err != nil {
		return "", err
	}
	var totalDeal, totalPaid, totalDebt, totalrRefund, deal, paid, debt, refund, arrear decimal.Decimal
	var firstCnt, dealCnt int

	var actHCnt, actCnt int
	dentalArr := [5][2]int{}

	for _, b := range list {
		if b.TradeType != int(enums.TradeFail) {
			totalDeal = totalDeal.Add(b.RealAmount)
			totalPaid = totalPaid.Add(b.PaidAmount)
			totalDebt = totalDebt.Add(b.DebtAmount)
			totalrRefund = totalrRefund.Add(b.RefundAmount)
			if b.TradeAt.Unix() >= unixToday {
				deal = deal.Add(b.RealAmount)
				paid = paid.Add(b.PaidAmount)
				debt = debt.Add(b.DebtAmount)
				refund = refund.Add(b.RefundAmount)
				if b.TradeType == int(enums.TradeDeal) {
					arrear = arrear.Add(b.RealAmount.Sub(b.PaidAmount))
					dealCnt++
					if b.DiagnosisType == int(enums.DiagnosisFirst) {
						firstCnt++
					}
				}

			}
			if b.Pack == int(enums.PackHalf) || b.Pack == int(enums.PackFull) {
				if b.Brand1 > 0 {
					actCnt += b.Brand1
					actHCnt++
				}
			}
			if b.Brand1 > 0 {
				dentalArr[0][0] = dentalArr[0][0] + b.Brand1
				dentalArr[0][1] = dentalArr[0][1] + b.Brand1Impl
			} else if b.Brand2 > 0 {
				dentalArr[1][0] = dentalArr[1][0] + b.Brand2
				dentalArr[1][1] = dentalArr[1][1] + b.Brand2Impl
			} else if b.Brand3 > 0 {
				dentalArr[2][0] = dentalArr[2][0] + b.Brand3
				dentalArr[2][1] = dentalArr[2][1] + b.Brand3Impl
			} else if b.Brand4 > 0 {
				dentalArr[3][0] = dentalArr[3][0] + b.Brand4
				dentalArr[3][1] = dentalArr[3][1] + b.Brand4Impl
			} else if b.Brand5 > 0 {
				dentalArr[4][0] = dentalArr[4][0] + b.Brand5
				dentalArr[4][1] = dentalArr[4][1] + b.Brand5Impl
			}
		} else {
			if b.DiagnosisType == int(enums.DiagnosisFirst) {
				if b.TradeAt.Unix() >= unixToday {
					firstCnt++
				}
			}
		}
	}

	// var edList []models.EventDaySt
	// if err := SerEventDaySt.GetList(teamId, 0, deptPath, today, end, &edList); err != nil {
	// 	return "", err
	// }
	// for _, ed := range edList {
	// 	firstCnt += ed.FirstDiagnosis + ed.FirstDiagnosisReferred
	// 	dealCnt += ed.Deal
	// }
	todayPaid := paid.Add(debt)
	tPaid := totalPaid.Add(totalDebt).Sub(totalrRefund)
	var texts utils.StringBuilder

	var taskList []models.TargetTask
	if err := SerTargetTask.GetTasks(enums.Month, today.Year()*100+int(today.Month()), teamId, 0, deptPath, &taskList); err != nil {
		return "", err
	}
	var tmpLen int
	var memberLen int
	var targetTotalDeal int
	for _, task := range taskList {
		if task.Deal > 0 {
			targetTotalDeal += task.Deal
			memberLen++
		} else {
			tmpLen++
		}
	}

	curT := time.Now()
	curday := curT.Format("01月02日")
	w := curT.Weekday()
	texts.Append(fmt.Sprintf("唐敦霞组%s（周%s）\n", curday, chinaWeekNames[w]))
	texts.Append(fmt.Sprintf("本月团队任务%s\n", utils.MoneyFmt(float64(targetTotalDeal))))
	texts.Append(fmt.Sprintf("今日初诊数：%d\n", firstCnt))
	texts.Append(fmt.Sprintf("今日成交数：%d\n", dealCnt))
	texts.Append(fmt.Sprintf("今日成交：%s\n", deal.StringFixedBank(0)))
	texts.Append(fmt.Sprintf("今日实收：%s\n", todayPaid.StringFixedBank(0)))
	texts.Append(fmt.Sprintf("今日欠款：%s\n", arrear.StringFixedBank(0)))
	texts.Append(fmt.Sprintf("本月成交：%s\n", totalDeal.StringFixedBank(0)))
	texts.Append(fmt.Sprintf("本月实收：%s\n", tPaid.StringFixedBank(0)))
	dp := fmt.Sprintf("%d%%", today.Day()*100/utils.GetMonthLen(today))
	texts.Append(fmt.Sprintf("本月时间进度：%s\n", dp))
	texts.Append(fmt.Sprintf("本月完成：%s%%\n", tPaid.Div(decimal.NewFromInt(int64(targetTotalDeal/100))).StringFixedBank(0)))
	texts.Append("本月成交种植延期\n")
	texts.Append(fmt.Sprintf("奥:%d-%d-%d\n", dentalArr[0][0], dentalArr[0][1], dentalArr[0][0]-dentalArr[0][1]))
	texts.Append(fmt.Sprintf("皓:%d-%d-%d\n", dentalArr[1][0], dentalArr[1][1], dentalArr[1][0]-dentalArr[1][1]))
	texts.Append(fmt.Sprintf("雅:%d-%d-%d\n", dentalArr[2][0], dentalArr[2][1], dentalArr[2][0]-dentalArr[2][1]))
	texts.Append(fmt.Sprintf("N:%d-%d-%d\n", dentalArr[4][0], dentalArr[4][1], dentalArr[4][0]-dentalArr[4][1]))
	texts.Append(fmt.Sprintf("I:%d-%d-%d\n", dentalArr[3][0], dentalArr[3][1], dentalArr[3][0]-dentalArr[3][1]))
	texts.Append(fmt.Sprintf("奥齿泰全半口%d例%d颗\n", actHCnt, actCnt))
	return texts.String(), nil
}

/*
* 时间段内每人统计
 */
func (s *BillService) StQuery(teamId, userId int, deptPath string, begin, end *time.Time, reqId string) ([]dto.BillUserStDto, error) {
	if teamId < 1 {
		return nil, codes.ErrInvalidParameter(reqId, "teamId is nil")
	}

	// var curM smodels.SysMember
	// if deptPath == "" {
	// 	service.SerSysMember.GetMember(teamId, userId, &curM)
	// 	deptPath = curM.DeptPath
	// }

	var members []smodels.SysMember

	if err := service.SerSysMember.GetMembers(teamId, 0, deptPath, "", 0, &members); err != nil {
		return nil, err
	}
	if end.IsZero() {
		*end = time.Now()
	}
	if begin.IsZero() {
		*begin = utils.GetMonthFirstDayLocal(*end)
	}

	bt := utils.GetZoreTimeLocal(*begin)
	et := utils.GetZoreTimeLocal(*end).Add(24 * time.Hour)

	var taskList []models.TargetTask
	if err := SerTargetTask.GetTasks(enums.Month, bt.Year()*100+int(bt.Month()), teamId, 0, deptPath, &taskList); err != nil {
		return nil, err
	}
	m := make(map[int]dto.BillUserStDto, len(taskList))
	for _, task := range taskList {
		br, ok := m[task.UserId]
		if !ok {
			br = dto.BillUserStDto{
				UserId:      task.UserId,
				Target:      decimal.NewFromInt(int64(task.Deal)),
				TargetNew:   task.NewCustomerCnt,
				TargetFirst: task.FirstDiagnosis,
				//TargetDealCnt: task.De
			}
		}
		for _, member := range members {
			if member.UserId == task.UserId {
				br.Name = member.Name
			}
		}
		m[br.UserId] = br
	}

	db := s.DB().Where("team_id = ?", teamId).Where("trade_at >=?", bt).
		Where("trade_at < ?", et)
	if userId > 0 {
		db.Where("user_id = ?", userId)
	} else if deptPath != "" {
		db.Where("dept_path like ?", deptPath+"%")
	}
	var list []models.Bill
	if err := db.Find(&list).Error; err != nil {
		return nil, err
	}

	for _, b := range list {
		br, ok := m[b.UserId]
		if !ok {
			br = dto.BillUserStDto{
				UserId: userId,
			}
		}
		if b.TradeType == int(enums.TradeFail) {
			if b.DiagnosisType == int(enums.DiagnosisFirst) {
				br.FirstDiagnosis = br.FirstDiagnosis + 1
			} else if b.DiagnosisType == int(enums.DiagnosisFurther) {
				br.FurtherDiagnosis = br.FurtherDiagnosis + 1
			} else if b.DiagnosisType == int(enums.DiagnosisSecend) {
				br.SecondDiagnosis = br.SecondDiagnosis + 1
			}
		} else {
			br.Deal = br.Deal.Add(b.RealAmount)
			br.Paid = br.Paid.Add(b.PaidAmount)
			br.Debt = br.Debt.Add(b.DebtAmount)
			br.Refund = br.Refund.Add(b.RefundAmount)
			if b.TradeType == int(enums.TradeDeal) {
				if b.DiagnosisType == int(enums.DiagnosisFirst) {
					br.FirstDiagnosis = br.FirstDiagnosis + 1
				} else if b.DiagnosisType == int(enums.DiagnosisFurther) {
					br.FurtherDiagnosis = br.FurtherDiagnosis + 1
				} else if b.DiagnosisType == int(enums.DiagnosisSecend) {
					br.SecondDiagnosis = br.SecondDiagnosis + 1
				}
				br.DealCnt = br.DealCnt + 1
			}
		}
		m[b.UserId] = br
	}

	var edList []models.EventDaySt
	if err := SerEventDaySt.GetList(teamId, 0, deptPath, bt, et, &edList); err != nil {
		return nil, err
	}

	for _, ed := range edList {
		br, ok := m[ed.UserId]
		if !ok {
			br = dto.BillUserStDto{
				UserId: userId,
			}
		}
		//br.FirstDiagnosis += ed.FirstDiagnosis + ed.FirstDiagnosisReferred
		br.NewCustomerCnt += ed.NewCustomerCnt
		//br.FurtherDiagnosis += ed.FurtherDiagnosis
		//br.DealCnt += ed.Deal
		m[ed.UserId] = br
	}

	res := make([]dto.BillUserStDto, 0)
	for _, v := range m {
		v.CurDebt = v.Deal.Sub(v.Paid)
		v.Total = v.Paid.Add(v.Debt).Sub(v.Refund)
		res = append(res, v)
	}
	res = sortArray(res)
	return res, nil
}

func sortArray(arr []dto.BillUserStDto) []dto.BillUserStDto {
	for i := 0; i < len(arr)-1; i++ {
		for j := 0; j < len(arr)-1-i; j++ {
			if arr[j].UserId > arr[j+1].UserId {
				arr[j], arr[j+1] = arr[j+1], arr[j]
			}
		}
	}
	return arr
}

func (s *BillService) ExportBill(teamId, userId int, name string, deptPath string, begin, end *time.Time, reqId string) (*excelize.File, string, error) {
	db := s.DB().Order("user_id asc,trade_at asc,id asc")
	if teamId > 0 {
		db.Where("team_id = ?", teamId)
	}

	if end.IsZero() {
		*end = time.Now()
	}
	if begin.IsZero() {
		*begin = utils.GetMonthFirstDayLocal(*end)
	}

	bt := utils.GetZoreTimeLocal(*begin)
	et := utils.GetZoreTimeLocal(*end).Add(24 * time.Hour)

	db.Where("trade_at > ?", bt).Where("trade_at < ?", et).Where("trade_type > 0")

	if userId > 0 {
		db.Where("user_id =?", userId)
	} else if deptPath != "" {
		db.Where("dept_path like?", deptPath+"%")
	}
	var ds []models.Bill
	db.Find(&ds)

	var mids []int
	var cids []int
	for _, v := range ds {
		mids = append(mids, v.UserId)
		cids = append(cids, v.CustomerId)
	}

	var members []smodels.SysMember
	if err := service.SerSysMember.GetMembersByUids(teamId, mids, &members); err != nil {
		return nil, "", err
	}

	var customers []models.Customer
	if err := SerCustomer.GetByIds(teamId, cids, &customers); err != nil {
		return nil, "", err
	}

	month := begin.Month()
	return s.BillExcel(int(month), name, ds, members, customers)
}

var billTitleClolumns = []string{"咨询师", "成交日期", "患者", "成交金额", "实收金额", "欠款金额", "奥齿泰", "皓圣", "雅定", "ITI", "诺贝尔", "延期", "来源", "出诊", "备注"}

func (s *BillService) BillExcel(month int, name string, list []models.Bill, members []smodels.SysMember, customers []models.Customer) (*excelize.File, string, error) {
	f := excelize.NewFile()
	defer func() {
		if err := f.Close(); err != nil {
			fmt.Println(err)
		}
	}()

	borderColor := "696969"
	fontColor := "696969"

	err := f.SetColWidth("Sheet1", "A", "A", 12)
	if err != nil {
		fmt.Println(err)
	}
	err = f.SetColWidth("Sheet1", "B", "F", 13)
	if err != nil {
		fmt.Println(err)
	}
	err = f.SetColWidth("Sheet1", "G", "N", 10)
	if err != nil {
		fmt.Println(err)
	}
	err = f.SetColWidth("Sheet1", "O", "O", 15)
	if err != nil {
		fmt.Println(err)
	}

	err = f.MergeCell("Sheet1", "A1", "O1")
	if err != nil {
		fmt.Println(err)
	}
	title := fmt.Sprintf("%s组%d月份小组成交明细", name, month)
	f.SetCellValue("Sheet1", "A1", title)

	f.SetSheetRow("Sheet1", "A2", &billTitleClolumns)
	//f.SetCellStyle("Sheet1", "A2", fmt.Sprintf("A%d", len(titleClolumns)+1), style)

	for i, v := range list {
		f.SetCellValue("Sheet1", fmt.Sprintf("A%d", i+3), v.UserId)
		for _, m := range members {
			if v.UserId == m.UserId {
				f.SetCellValue("Sheet1", fmt.Sprintf("A%d", i+3), m.Name)
				break
			}
		}
		f.SetCellValue("Sheet1", fmt.Sprintf("B%d", i+3), v.TradeAt.Format("01月02日"))
		f.SetCellValue("Sheet1", fmt.Sprintf("C%d", i+3), v.CustomerId)
		for _, c := range customers {
			if v.CustomerId == c.Id {
				f.SetCellValue("Sheet1", fmt.Sprintf("C%d", i+3), c.Name)
				break
			}
		}
		ar, _ := v.RealAmount.Float64()
		f.SetCellFloat("Sheet1", fmt.Sprintf("D%d", i+3), ar, 2, 32)
		pa, _ := v.PaidAmount.Float64()
		f.SetCellFloat("Sheet1", fmt.Sprintf("E%d", i+3), pa, 2, 32)
		var remark string
		if v.TradeType == 1 {
			d, _ := v.RealAmount.Sub(v.PaidAmount).Float64()
			f.SetCellFloat("Sheet1", fmt.Sprintf("F%d", i+3), d, 2, 32)
		} else if v.TradeType == 2 {
			d, _ := v.PaidAmount.Mul(decimal.NewFromInt(-1)).Float64()
			f.SetCellFloat("Sheet1", fmt.Sprintf("F%d", i+3), d, 2, 32)
			remark = "补当月款;"
		} else if v.TradeType == 3 {
			d, _ := v.DebtAmount.Float64()
			f.SetCellFloat("Sheet1", fmt.Sprintf("E%d", i+3), d, 2, 32)
			remark = "补上月款;"
		} else {
			d, _ := v.RefundAmount.Mul(decimal.NewFromInt(-1)).Float64()
			f.SetCellFloat("Sheet1", fmt.Sprintf("E%d", i+3), d, 2, 32)
			remark = "退款;"
		}

		f.SetCellValue("Sheet1", fmt.Sprintf("G%d", i+3), v.Brand1)
		f.SetCellValue("Sheet1", fmt.Sprintf("H%d", i+3), v.Brand2)
		f.SetCellValue("Sheet1", fmt.Sprintf("I%d", i+3), v.Brand3)
		f.SetCellValue("Sheet1", fmt.Sprintf("J%d", i+3), v.Brand4)
		f.SetCellValue("Sheet1", fmt.Sprintf("K%d", i+3), v.Brand5)

		if v.Pack == int(enums.PackHalf) {
			remark += "半口;"
		} else if v.Pack == int(enums.PackFull) {
			remark += "全口;"
		}
		extension := v.Brand1 + v.Brand2 + v.Brand3 + v.Brand4 + v.Brand5 - v.Brand1Impl - v.Brand2Impl - v.Brand3Impl - v.Brand4Impl - v.Brand5Impl
		if extension < 0 {
			extension = 0
		}

		f.SetCellValue("Sheet1", fmt.Sprintf("L%d", i+3), extension)
		source := "转介绍"
		if v.Source == 1 {
			source = "场地"
		}
		f.SetCellValue("Sheet1", fmt.Sprintf("M%d", i+3), source)
		diagnosisType := ""
		if v.DiagnosisType == 1 {
			diagnosisType = "出诊"
		} else if v.DiagnosisType == 2 {
			diagnosisType = "复诊"
		} else if v.DiagnosisType == 3 {
			diagnosisType = "新诊"
		}
		f.SetCellValue("Sheet1", fmt.Sprintf("N%d", i+3), diagnosisType)
		f.SetCellValue("Sheet1", fmt.Sprintf("O%d", i+3), remark+v.OtherPrj+" "+v.Remark)
	}

	last := len(list) + 3
	f.SetCellValue("Sheet1", fmt.Sprintf("A%d", last), "合计")
	for i := 4; i < len(billTitleClolumns)-3; i++ {
		cell, err := excelize.CoordinatesToCellName(i, last)
		if err != nil {
			fmt.Println(err)
			return nil, "", err
		}
		f.SetCellFormula("Sheet1", cell, fmt.Sprintf("=SUM(%s%d:%s%d)", BASE_CLOUMN[i-1], 3, BASE_CLOUMN[i-1], last-1))
	}
	f.SetCellFormula("Sheet1", fmt.Sprintf("O%d", last), fmt.Sprintf("=SUM(G%d:K%d)", last, last))

	titleS, err2 := f.NewStyle(&excelize.Style{
		Border: []excelize.Border{
			{Type: "left", Color: borderColor, Style: 1},
			{Type: "top", Color: borderColor, Style: 1},
			{Type: "bottom", Color: borderColor, Style: 1},
			{Type: "right", Color: borderColor, Style: 1},
		},
		Font: &excelize.Font{
			Bold:   true,
			Family: "微软雅黑",
			Size:   12,
			Color:  fontColor,
		},
		Alignment: &excelize.Alignment{
			Horizontal:      "center",
			Indent:          1,
			JustifyLastLine: true,
			ReadingOrder:    0,
			RelativeIndent:  1,
			ShrinkToFit:     true,
			Vertical:        "",
			WrapText:        true,
		},
		Fill: excelize.Fill{
			Color:   []string{"8FBC8F"},
			Type:    "pattern",
			Pattern: 1,
		},
	})
	if err2 != nil {
		fmt.Println(err2)
	}
	f.SetCellStyle("Sheet1", "A1", "A1", titleS)

	style, err := f.NewStyle(&excelize.Style{
		Border: []excelize.Border{
			{Type: "left", Color: borderColor, Style: 1},
			{Type: "top", Color: borderColor, Style: 1},
			{Type: "bottom", Color: borderColor, Style: 1},
			{Type: "right", Color: borderColor, Style: 1},
		},
		Font: &excelize.Font{
			//Bold:   true,
			Family: "微软雅黑",
			Size:   12,
			Color:  fontColor,
		},
		Alignment: &excelize.Alignment{
			Horizontal:      "center",
			Indent:          1,
			JustifyLastLine: true,
			ReadingOrder:    0,
			RelativeIndent:  1,
			ShrinkToFit:     true,
			Vertical:        "",
			WrapText:        true,
		},
		Fill: excelize.Fill{
			Color:   []string{"F5FFFA"},
			Type:    "pattern",
			Pattern: 1,
		},
	})
	if err != nil {
		fmt.Println(err)
	}

	f.SetCellStyle("Sheet1", "A2", fmt.Sprintf("O%d", last), style)

	titleC, err3 := f.NewStyle(&excelize.Style{
		Border: []excelize.Border{
			{Type: "left", Color: borderColor, Style: 1},
			{Type: "top", Color: borderColor, Style: 1},
			{Type: "bottom", Color: borderColor, Style: 1},
			{Type: "right", Color: borderColor, Style: 1},
		},
		Font: &excelize.Font{
			//Bold:   true,
			Family: "微软雅黑",
			Size:   11,
			Color:  fontColor,
		},
		Alignment: &excelize.Alignment{
			Horizontal:      "center",
			Indent:          1,
			JustifyLastLine: true,
			ReadingOrder:    0,
			RelativeIndent:  1,
			ShrinkToFit:     true,
			Vertical:        "",
			WrapText:        true,
		},
		Fill: excelize.Fill{
			Color:   []string{"FFFFFF"},
			Type:    "pattern",
			Pattern: 1,
		},
	})
	if err3 != nil {
		fmt.Println(err3)
	}
	f.SetCellStyle("Sheet1", "B3", fmt.Sprintf("O%d", last), titleC)
	// if err := f.SaveAs("Book1.xlsx"); err != nil {
	// 	fmt.Println(err)
	// }

	return f, title, nil
}

func (s *BillService) ExportSt(teamId, userId int, name string, deptPath string, begin, end *time.Time, reqId string) (*excelize.File, string, error) {
	list, err := s.StQuery(teamId, userId, deptPath, begin, end, reqId)
	if err != nil {
		return nil, "", err
	}
	month := begin.Month()
	return s.StExcel(int(month), name, list)
}

var titleClolumns = []string{"", "姓名", "信息留存任务", "信息留存数量", "留存达成率", "到诊任务", "实际到诊", "到诊达成率", "到诊成交数量", "成交率", "成交金额", "待收欠款", "当月补欠款", "实收任务", "当月实收", "完成度", "复诊", "新诊", "备注"}

var BASE_CLOUMN = []string{"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"}

func (s *BillService) StExcel(month int, name string, list []dto.BillUserStDto) (*excelize.File, string, error) {
	f := excelize.NewFile()
	defer func() {
		if err := f.Close(); err != nil {
			fmt.Println(err)
		}
	}()

	borderColor := "696969"
	fontColor := "696969"

	err := f.SetColWidth("Sheet1", "A", "A", 7)
	if err != nil {
		fmt.Println(err)
	}

	err = f.SetColWidth("Sheet1", "B", "I", 11)
	if err != nil {
		fmt.Println(err)
	}

	err = f.SetColWidth("Sheet1", "J", "S", 10)
	if err != nil {
		fmt.Println(err)
	}

	err = f.SetColWidth("Sheet1", "K", "O", 11)
	if err != nil {
		fmt.Println(err)
	}

	err = f.MergeCell("Sheet1", "A1", "S1")
	if err != nil {
		fmt.Println(err)
		return nil, "", err
	}
	title := fmt.Sprintf("%s组%d月份小组进度数据表", name, month)
	f.SetCellValue("Sheet1", "A1", title)

	f.SetSheetRow("Sheet1", "A2", &titleClolumns)
	//f.SetCellStyle("Sheet1", "A2", fmt.Sprintf("A%d", len(titleClolumns)+1), style)
	var targetNew, newCustomerCnt, targetFirst, firstDiagnosis, dealCnt int
	var total, target decimal.Decimal
	for i, v := range list {
		targetNew += v.TargetNew
		newCustomerCnt += v.NewCustomerCnt
		targetFirst += v.TargetFirst
		firstDiagnosis += v.FirstDiagnosis
		dealCnt += v.DealCnt
		total = total.Add(v.Total)
		target = target.Add(v.Target)

		f.SetCellValue("Sheet1", fmt.Sprintf("A%d", i+3), i+1)
		f.SetCellValue("Sheet1", fmt.Sprintf("B%d", i+3), v.Name)
		f.SetCellInt("Sheet1", fmt.Sprintf("C%d", i+3), v.TargetNew)
		f.SetCellInt("Sheet1", fmt.Sprintf("D%d", i+3), v.NewCustomerCnt)
		if v.TargetNew == 0 {
			f.SetCellValue("Sheet1", fmt.Sprintf("E%d", i+3), "0%")
		} else {
			f.SetCellValue("Sheet1", fmt.Sprintf("E%d", i+3), fmt.Sprintf("%.f%%", float64(v.NewCustomerCnt)*100.0/float64(v.TargetNew)))
		}
		f.SetCellInt("Sheet1", fmt.Sprintf("F%d", i+3), v.TargetFirst)
		f.SetCellInt("Sheet1", fmt.Sprintf("G%d", i+3), v.FirstDiagnosis)
		if v.TargetFirst == 0 {
			f.SetCellValue("Sheet1", fmt.Sprintf("H%d", i+3), "0%")
		} else {
			f.SetCellValue("Sheet1", fmt.Sprintf("H%d", i+3), fmt.Sprintf("%.f%%", float64(v.FirstDiagnosis)*100.0/float64(v.TargetFirst)))
		}
		f.SetCellInt("Sheet1", fmt.Sprintf("I%d", i+3), v.DealCnt)
		if v.FirstDiagnosis == 0 {
			f.SetCellValue("Sheet1", fmt.Sprintf("J%d", i+3), "0%")
		} else {
			f.SetCellValue("Sheet1", fmt.Sprintf("J%d", i+3), fmt.Sprintf("%.f%%", float64(v.DealCnt)*100.0/float64(v.FirstDiagnosis)))
		}

		d, _ := v.Deal.Float64()
		f.SetCellFloat("Sheet1", fmt.Sprintf("K%d", i+3), d, 2, 32)
		cd, _ := v.CurDebt.Float64()
		f.SetCellFloat("Sheet1", fmt.Sprintf("L%d", i+3), cd, 2, 32)
		debt, _ := v.Debt.Float64()
		f.SetCellFloat("Sheet1", fmt.Sprintf("M%d", i+3), debt, 2, 32)
		t, _ := v.Target.Float64()
		f.SetCellFloat("Sheet1", fmt.Sprintf("N%d", i+3), t, 2, 32)
		total, _ := v.Total.Float64()
		f.SetCellFloat("Sheet1", fmt.Sprintf("O%d", i+3), total, 2, 32)
		if v.Target.IsZero() {
			f.SetCellValue("Sheet1", fmt.Sprintf("P%d", i+3), "0%")
		} else {
			f.SetCellValue("Sheet1", fmt.Sprintf("P%d", i+3), fmt.Sprintf("%s%%", v.Total.Mul(decimal.New(100, 0)).Div(v.Target).StringFixed(0)))
		}
		f.SetCellInt("Sheet1", fmt.Sprintf("Q%d", i+3), v.FurtherDiagnosis)
		f.SetCellInt("Sheet1", fmt.Sprintf("R%d", i+3), v.SecondDiagnosis)
		f.SetCellValue("Sheet1", fmt.Sprintf("S%d", i+3), "")

	}

	last := len(list) + 3
	f.SetCellValue("Sheet1", fmt.Sprintf("A%d", last), "合计")
	for i := 3; i < len(titleClolumns); i++ {
		cell, err := excelize.CoordinatesToCellName(i, last)
		if err != nil {
			fmt.Println(err)
			return nil, "", err
		}
		if i == 5 {
			if targetNew == 0 {
				f.SetCellValue("Sheet1", cell, "0%")
			} else {
				f.SetCellValue("Sheet1", cell, fmt.Sprintf("%.f%%", float64(newCustomerCnt)*100.0/float64(targetNew)))
			}
		} else if i == 8 {
			if targetFirst == 0 {
				f.SetCellValue("Sheet1", cell, "0%")
			} else {
				f.SetCellValue("Sheet1", cell, fmt.Sprintf("%.f%%", float64(firstDiagnosis)*100.0/float64(targetFirst)))
			}
		} else if i == 16 {
			if target.IsZero() {
				f.SetCellValue("Sheet1", cell, "0%")
			} else {
				f.SetCellValue("Sheet1", cell, fmt.Sprintf("%s%%", total.Mul(decimal.New(100, 0)).Div(target).StringFixedBank(0)))
			}
		} else if i == 10 {
			if firstDiagnosis == 0 {
				f.SetCellValue("Sheet1", cell, "0%")
			} else {
				f.SetCellValue("Sheet1", cell, fmt.Sprintf("%.f%%", float64(dealCnt)*100.0/float64(firstDiagnosis)))
			}
		} else {
			f.SetCellFormula("Sheet1", cell, fmt.Sprintf("=SUM(%s%d:%s%d)", BASE_CLOUMN[i-1], 3, BASE_CLOUMN[i-1], last-1))
		}

	}

	titleS, err2 := f.NewStyle(&excelize.Style{
		Border: []excelize.Border{
			{Type: "left", Color: borderColor, Style: 1},
			{Type: "top", Color: borderColor, Style: 1},
			{Type: "bottom", Color: borderColor, Style: 1},
			{Type: "right", Color: borderColor, Style: 1},
		},
		Font: &excelize.Font{
			Bold:   true,
			Family: "微软雅黑",
			Size:   12,
			Color:  fontColor,
		},
		Alignment: &excelize.Alignment{
			Horizontal:      "center",
			Indent:          1,
			JustifyLastLine: true,
			ReadingOrder:    0,
			RelativeIndent:  1,
			ShrinkToFit:     true,
			Vertical:        "",
			WrapText:        true,
		},
		Fill: excelize.Fill{
			Color:   []string{"8FBC8F"},
			Type:    "pattern",
			Pattern: 1,
		},
	})
	if err2 != nil {
		fmt.Println(err2)
	}
	f.SetCellStyle("Sheet1", "A1", "A1", titleS)

	style, err := f.NewStyle(&excelize.Style{
		Border: []excelize.Border{
			{Type: "left", Color: borderColor, Style: 1},
			{Type: "top", Color: borderColor, Style: 1},
			{Type: "bottom", Color: borderColor, Style: 1},
			{Type: "right", Color: borderColor, Style: 1},
		},
		Font: &excelize.Font{
			//Bold:   true,
			Family: "微软雅黑",
			Size:   12,
			Color:  fontColor,
		},
		Alignment: &excelize.Alignment{
			Horizontal:      "center",
			Indent:          1,
			JustifyLastLine: true,
			ReadingOrder:    0,
			RelativeIndent:  1,
			ShrinkToFit:     true,
			Vertical:        "",
			WrapText:        true,
		},
		Fill: excelize.Fill{
			Color:   []string{"F5FFFA"},
			Type:    "pattern",
			Pattern: 1,
		},
	})
	if err != nil {
		fmt.Println(err)
	}

	f.SetCellStyle("Sheet1", "A2", fmt.Sprintf("S%d", last), style)

	titleC, err3 := f.NewStyle(&excelize.Style{
		Border: []excelize.Border{
			{Type: "left", Color: borderColor, Style: 1},
			{Type: "top", Color: borderColor, Style: 1},
			{Type: "bottom", Color: borderColor, Style: 1},
			{Type: "right", Color: borderColor, Style: 1},
		},
		Font: &excelize.Font{
			//Bold:   true,
			Family: "微软雅黑",
			Size:   11,
			Color:  fontColor,
		},
		Alignment: &excelize.Alignment{
			Horizontal:      "center",
			Indent:          1,
			JustifyLastLine: true,
			ReadingOrder:    0,
			RelativeIndent:  1,
			ShrinkToFit:     true,
			Vertical:        "",
			WrapText:        true,
		},
		Fill: excelize.Fill{
			Color:   []string{"FFFFFF"},
			Type:    "pattern",
			Pattern: 1,
		},
	})
	if err3 != nil {
		fmt.Println(err3)
	}
	f.SetCellStyle("Sheet1", "B3", fmt.Sprintf("S%d", last), titleC)

	// if err := f.SaveAs("Book1.xlsx"); err != nil {
	// 	fmt.Println(err)
	// }

	return f, title, nil
}

func (s *BillService) StMonthRateExcel(curTime time.Time, teamId, userId int, deptPath string) (*excelize.File, string, error) {
	year := curTime.Year()
	month := curTime.Month()

	today := utils.GetZoreTimeLocal(curTime)
	end := today.Add(24 * time.Hour)
	begin := utils.GetMonthFirstDayLocal(curTime)

	db := s.DB().Where("team_id = ?", teamId).Where("trade_at >=?", begin).
		Where("trade_at < ?", end)
	db.Where("dept_path like ?", deptPath+"%")
	var list []models.Bill
	if err := db.Find(&list).Error; err != nil {
		return nil, "", err
	}

	var firLocalCnt, firRefCnt, firLocalDealCnt, firRefDealCnt, furtherLocalDealCnt, furtherRefDealCnt, secLocalDealCnt, secRefDealCnt int //数量

	var firLocal, firRef, firlocalReal, firRefReal, furtherLocal, furtherRef, furtherLocalReal, furtherRefReal,
		secLocal, secRef, secLocalReal, secRefReal, backReal decimal.Decimal //金额

	for _, b := range list {
		if b.TradeType == int(enums.TradeDeal) { //成交
			if b.Source == int(enums.SourceLocal) { //场地
				if b.DiagnosisType == int(enums.DiagnosisFirst) {
					firLocalCnt++
					firLocalDealCnt++
					firLocal = firLocal.Add(b.RealAmount)         //成交金额
					firlocalReal = firlocalReal.Add(b.PaidAmount) //支付金额
				} else if b.DiagnosisType == int(enums.DiagnosisFurther) {
					furtherLocalDealCnt++

					furtherLocal = furtherLocal.Add(b.RealAmount)         //成交金额
					furtherLocalReal = furtherLocalReal.Add(b.PaidAmount) //支付金额

				} else if b.DiagnosisType == int(enums.DiagnosisSecend) {
					secLocalDealCnt++

					secLocal = secLocal.Add(b.RealAmount)         //成交金额
					secLocalReal = secLocalReal.Add(b.PaidAmount) //成交金额

				}
			} else { //场外
				if b.DiagnosisType == int(enums.DiagnosisFirst) {
					firRefCnt++
					firRefDealCnt++
					firRef = firRef.Add(b.RealAmount)         //成交金额
					firRefReal = firRefReal.Add(b.PaidAmount) //支付金额
				} else if b.DiagnosisType == int(enums.DiagnosisFurther) {
					furtherRefDealCnt++

					furtherRef = furtherRef.Add(b.RealAmount)         //成交金额
					furtherRefReal = furtherRefReal.Add(b.PaidAmount) //支付金额

				} else if b.DiagnosisType == int(enums.DiagnosisSecend) {
					secRefDealCnt++

					secRef = secRef.Add(b.RealAmount)         //支付金额
					secRefReal = secRefReal.Add(b.PaidAmount) //支付金额

				}
			}

		} else if b.TradeType == int(enums.TradeBalance) { //补当月尾款
			if b.Source == int(enums.SourceLocal) { //场地
				if b.DiagnosisType == int(enums.DiagnosisFirst) {
					//firLocal = firLocal.Add(b.RealAmount)         //成交金额
					firlocalReal = firlocalReal.Add(b.PaidAmount) //支付金额
				} else if b.DiagnosisType == int(enums.DiagnosisFurther) {
					//furtherLocal = furtherLocal.Add(b.RealAmount)         //成交金额
					furtherLocalReal = furtherLocalReal.Add(b.PaidAmount) //支付金额
				} else if b.DiagnosisType == int(enums.DiagnosisSecend) {
					//secLocal = secLocal.Add(b.RealAmount)         //成交金额
					secLocalReal = secLocalReal.Add(b.PaidAmount) //成交金额
				}
			} else { //场外
				if b.DiagnosisType == int(enums.DiagnosisFirst) {
					//					firRef = firRef.Add(b.RealAmount)         //成交金额
					firRefReal = firRefReal.Add(b.PaidAmount) //支付金额
				} else if b.DiagnosisType == int(enums.DiagnosisFurther) {
					//					furtherRef = furtherRef.Add(b.RealAmount)         //成交金额
					furtherRefReal = furtherRefReal.Add(b.PaidAmount) //支付金额
				} else if b.DiagnosisType == int(enums.DiagnosisSecend) {
					//					secRef = secRef.Add(b.RealAmount)         //支付金额
					secRefReal = secRefReal.Add(b.PaidAmount) //支付金额
				}
			}

		} else if b.TradeType == int(enums.TradeFail) { //未成交
			if b.Source == int(enums.SourceLocal) { //场地
				if b.DiagnosisType == int(enums.DiagnosisFirst) {
					firLocalCnt++
					// } else if b.DiagnosisType == int(enums.DiagnosisFurther) {

					// } else if b.DiagnosisType == int(enums.DiagnosisSecend) {
				}
			} else { //场外
				if b.DiagnosisType == int(enums.DiagnosisFirst) {
					firRefCnt++
					// } else if b.DiagnosisType == int(enums.DiagnosisFurther) {

					// } else if b.DiagnosisType == int(enums.DiagnosisSecend) {
				}
			}

		} else if b.TradeType == int(enums.TradeDebt) { //补上月尾款
			backReal = backReal.Add(b.DebtAmount)
		}
	}

	f := excelize.NewFile()
	defer func() {
		if err := f.Close(); err != nil {
			fmt.Println(err)
		}
	}()

	sheet := fmt.Sprintf("%d月", month)
	f.SetSheetName("Sheet1", sheet)

	err := f.SetColWidth(sheet, "A", "M", 17)
	if err != nil {
		fmt.Println(err)
	}

	//#到诊
	err = f.MergeCell(sheet, "A1", "F1")
	if err != nil {
		fmt.Println(err)
		return nil, "", err
	}
	title := fmt.Sprintf("杭州院%d年%d月份到诊情况", year, month)
	f.SetCellValue(sheet, "A1", title)

	f.SetSheetRow(sheet, "A2", &[]string{"项目", "初诊人次", "初诊成交", "初诊成交率", "复诊成交人次", "新诊（二开）成交人次"})
	f.SetSheetCol(sheet, "A3", &[]string{"合计", "场地", "转介绍", "场地占比", "转介绍占比"})
	f.SetCellInt(sheet, "B3", firLocalCnt+firRefCnt)
	f.SetCellInt(sheet, "B4", firLocalCnt)
	f.SetCellInt(sheet, "B5", firRefCnt)

	f.SetCellInt(sheet, "C3", firLocalDealCnt+firRefDealCnt)
	f.SetCellInt(sheet, "C4", firLocalDealCnt)
	f.SetCellInt(sheet, "C5", firRefDealCnt)

	f.SetCellInt(sheet, "E3", furtherLocalDealCnt+furtherRefDealCnt)
	f.SetCellInt(sheet, "E4", furtherLocalDealCnt)
	f.SetCellInt(sheet, "E5", furtherRefDealCnt)

	f.SetCellInt(sheet, "F3", secLocalDealCnt+secRefDealCnt)
	f.SetCellInt(sheet, "F4", secLocalDealCnt)
	f.SetCellInt(sheet, "F5", secRefDealCnt)

	f.SetCellFormula(sheet, "D3", "=C3/B3")
	f.SetCellFormula(sheet, "D4", "=C4/B4")
	f.SetCellFormula(sheet, "D5", "=C5/B5")

	for i := 1; i < 6; i++ {
		if i != 3 {
			cell6 := fmt.Sprintf("%s%d", BASE_CLOUMN[i], 6)
			f.SetCellFormula(sheet, cell6, fmt.Sprintf("=%s%d/%s%d", BASE_CLOUMN[i], 4, BASE_CLOUMN[i], 3))
			cell7 := fmt.Sprintf("%s%d", BASE_CLOUMN[i], 7)
			f.SetCellFormula(sheet, cell7, fmt.Sprintf("=%s%d/%s%d", BASE_CLOUMN[i], 5, BASE_CLOUMN[i], 3))
		}
	}

	//客单价
	err = f.MergeCell(sheet, "H1", "L1")
	if err != nil {
		fmt.Println(err)
		return nil, "", err
	}
	f.SetCellValue(sheet, "H1", "客单价")

	f.SetSheetRow(sheet, "H2", &[]string{"项目", "初诊", "复诊", "新诊（二开）", "整体"})
	f.SetCellStr(sheet, "H3", "客单价")
	f.SetCellFormula(sheet, "I3", "=C13/C3")
	f.SetCellFormula(sheet, "J3", "=F13/E3")
	f.SetCellFormula(sheet, "K3", "=H13/F3")
	f.SetCellFormula(sheet, "L3", "=J13/SUM(C3,E3,F3)")

	//实收
	err = f.MergeCell(sheet, "A11", "M11")
	if err != nil {
		fmt.Println(err)
		return nil, "", err
	}

	f.SetCellValue(sheet, "A11", fmt.Sprintf("杭州院%d年%d月份实收情况", year, month))

	f.SetSheetRow(sheet, "A12", &[]string{"项目", "初诊成交额", "初诊实收金额", "初诊实收率", "复诊成交额", "复诊实收金额", "新诊成交额", "新诊实收金额", "收回往期欠款", "本月实收合计", "初诊实收占比", "复诊实收占比", "新诊实收占比"})
	f.SetSheetCol(sheet, "A13", &[]string{"合计", "场地", "转介绍", "场地占比", "转介绍占比"})

	f.SetCellInt(sheet, "B13", int(firLocal.Add(firRef).IntPart()))
	f.SetCellInt(sheet, "B14", int(firLocal.IntPart()))
	f.SetCellInt(sheet, "B15", int(firRef.IntPart()))

	f.SetCellInt(sheet, "C13", int(firlocalReal.Add(firRefReal).IntPart()))
	f.SetCellInt(sheet, "C14", int(firlocalReal.IntPart()))
	f.SetCellInt(sheet, "C15", int(firRefReal.IntPart()))

	f.SetCellInt(sheet, "E13", int(furtherLocal.Add(furtherRef).IntPart()))
	f.SetCellInt(sheet, "E14", int(furtherLocal.IntPart()))
	f.SetCellInt(sheet, "E15", int(furtherRef.IntPart()))
	f.SetCellInt(sheet, "F13", int(furtherLocalReal.Add(furtherRefReal).IntPart()))
	f.SetCellInt(sheet, "F14", int(furtherLocalReal.IntPart()))
	f.SetCellInt(sheet, "F15", int(furtherRefReal.IntPart()))

	f.SetCellInt(sheet, "G13", int(secLocal.Add(secRef).IntPart()))
	f.SetCellInt(sheet, "G14", int(secLocal.IntPart()))
	f.SetCellInt(sheet, "G15", int(secRef.IntPart()))
	f.SetCellInt(sheet, "H13", int(secLocalReal.Add(secRefReal).IntPart()))
	f.SetCellInt(sheet, "H14", int(secLocalReal.IntPart()))
	f.SetCellInt(sheet, "H15", int(secRefReal.IntPart()))

	f.SetCellInt(sheet, "I13", int(backReal.IntPart()))

	f.SetCellFormula(sheet, "J13", "=SUM(C13,F13,H13,I13)")

	for i := 1; i < 8; i++ {
		if i != 3 {
			cell16 := fmt.Sprintf("%s%d", BASE_CLOUMN[i], 16)
			f.SetCellFormula(sheet, cell16, fmt.Sprintf("=%s%d/%s%d", BASE_CLOUMN[i], 14, BASE_CLOUMN[i], 13))
			cell17 := fmt.Sprintf("%s%d", BASE_CLOUMN[i], 17)
			f.SetCellFormula(sheet, cell17, fmt.Sprintf("=%s%d/%s%d", BASE_CLOUMN[i], 15, BASE_CLOUMN[i], 13))
		}
	}

	f.SetCellFormula(sheet, "K13", "=C13/J13")
	f.SetCellFormula(sheet, "L13", "=F13/J13")
	f.SetCellFormula(sheet, "M13", "=H13/J13")

	f.SetCellFormula(sheet, "D13", "=C13/B13")
	f.SetCellFormula(sheet, "D14", "=C14/B14")
	f.SetCellFormula(sheet, "D15", "=C15/B15")

	f.SetCellStr(sheet, "L4", "单位：元")

	borderColor := "696969"
	fontColor := "696969"

	titleS, err2 := f.NewStyle(&excelize.Style{
		Border: []excelize.Border{
			{Type: "left", Color: borderColor, Style: 1},
			{Type: "top", Color: borderColor, Style: 1},
			{Type: "bottom", Color: borderColor, Style: 1},
			{Type: "right", Color: borderColor, Style: 1},
		},
		Font: &excelize.Font{
			Bold:   true,
			Family: "微软雅黑",
			Size:   12,
			Color:  fontColor,
		},
		Alignment: &excelize.Alignment{
			Horizontal:      "center",
			Indent:          1,
			JustifyLastLine: true,
			ReadingOrder:    0,
			RelativeIndent:  1,
			ShrinkToFit:     true,
			Vertical:        "",
			WrapText:        true,
		},
		Fill: excelize.Fill{
			Color:   []string{"8FBC8F"},
			Type:    "pattern",
			Pattern: 1,
		},
	})
	if err2 != nil {
		fmt.Println(err2)
	}
	f.SetCellStyle(sheet, "A1", "L1", titleS)
	f.SetCellStyle(sheet, "A11", "A11", titleS)

	style, err := f.NewStyle(&excelize.Style{
		Border: []excelize.Border{
			{Type: "left", Color: borderColor, Style: 1},
			{Type: "top", Color: borderColor, Style: 1},
			{Type: "bottom", Color: borderColor, Style: 1},
			{Type: "right", Color: borderColor, Style: 1},
		},
		Font: &excelize.Font{
			//Bold:   true,
			Family: "微软雅黑",
			Size:   12,
			Color:  fontColor,
		},
		Alignment: &excelize.Alignment{
			Horizontal:      "center",
			Indent:          1,
			JustifyLastLine: true,
			ReadingOrder:    0,
			RelativeIndent:  1,
			ShrinkToFit:     true,
			Vertical:        "center",
			WrapText:        true,
		},
		Fill: excelize.Fill{
			Color:   []string{"F5FFFA"},
			Type:    "pattern",
			Pattern: 1,
		},
	})
	if err != nil {
		fmt.Println(err)
	}

	f.SetCellStyle(sheet, "A2", "F7", style)
	f.SetCellStyle(sheet, "H2", "L3", style)
	f.SetCellStyle(sheet, "A12", "M17", style)

	contentStyle, err3 := f.NewStyle(&excelize.Style{
		Border: []excelize.Border{
			{Type: "left", Color: borderColor, Style: 1},
			{Type: "top", Color: borderColor, Style: 1},
			{Type: "bottom", Color: borderColor, Style: 1},
			{Type: "right", Color: borderColor, Style: 1},
		},
		Font: &excelize.Font{
			//Bold:   true,
			Family: "微软雅黑",
			Size:   11,
			Color:  fontColor,
		},
		Alignment: &excelize.Alignment{
			Horizontal:      "center",
			Indent:          1,
			JustifyLastLine: true,
			ReadingOrder:    0,
			RelativeIndent:  1,
			ShrinkToFit:     true,
			Vertical:        "center",
			WrapText:        true,
		},
		Fill: excelize.Fill{
			Color:   []string{"FFFFFF"},
			Type:    "pattern",
			Pattern: 1,
		},
	})
	if err3 != nil {
		fmt.Println(err3)
	}

	f.SetCellStyle(sheet, "B3", "F7", contentStyle)
	f.SetCellStyle(sheet, "I2", "L3", contentStyle)
	f.SetCellStyle(sheet, "B13", "M17", contentStyle)

	return f, title, nil
}

func (s *BillService) StMonth(teamId, userId int, deptPath string, day time.Time, reqId string) (string, error) {

	if teamId < 1 {
		return "", codes.ErrInvalidParameter(reqId, "teamId is nil")
	}

	var tu smodels.SysMember
	if err := service.SerSysMember.GetMember(teamId, userId, &tu); err != nil {
		return "", err
	}

	if deptPath == "" {
		deptPath = tu.DeptPath
	}

	var members []smodels.SysMember
	if err := service.SerSysMember.GetMembers(teamId, 0, deptPath, "", 0, &members); err != nil {
		return "", err
	}

	today := utils.GetZoreTimeLocal(day)
	end := today.Add(24 * time.Hour)
	begin := utils.GetMonthFirstDayLocal(day)
	unixToday := today.Unix()

	db := s.DB().Where("team_id = ?", teamId).Where("trade_at >=?", begin).
		Where("trade_at < ?", end)
	db.Where("dept_path like ?", deptPath+"%")
	var list []models.Bill
	if err := db.Find(&list).Error; err != nil {
		return "", err
	}

	var tmDeal, tPaid, tbDebt, tRefund, deal, paid, bdebt, refund decimal.Decimal
	var dealCnt, dCnt, iCnt, tdCnt, tiCnt int

	var tNc, tFirD, tFuD, tSecD, tDeal int                  //总 数
	var dayNc, dayFirD, dayFuD, daySecD, dayDeal, dayIv int //今日 数

	for _, b := range list {
		if b.TradeType == int(enums.TradeDeal) || b.TradeType == int(enums.TradeBalance) {
			dCnt += b.Brand1 + b.Brand2 + b.Brand3 + b.Brand4 + b.Brand5
			iCnt += (b.Brand1 + b.Brand2 + b.Brand3 + b.Brand4 + b.Brand5 - b.Brand1Impl - b.Brand2Impl - b.Brand3Impl - b.Brand4Impl - b.Brand5Impl)
		}
		if b.TradeType == int(enums.TradeDeal) {
			tDeal++
			if b.DiagnosisType == int(enums.DiagnosisFirst) {
				tFirD++
			} else if b.DiagnosisType == int(enums.DiagnosisFurther) {
				tFuD++
			} else if b.DiagnosisType == int(enums.DiagnosisSecend) {
				tSecD++
			}
		}
		if b.TradeType == int(enums.TradeFail) { //未成交
			if b.DiagnosisType == int(enums.DiagnosisFirst) {
				tFirD++
			} else if b.DiagnosisType == int(enums.DiagnosisFurther) {
				tFuD++
			} else if b.DiagnosisType == int(enums.DiagnosisSecend) {
				tSecD++
			}
			if b.TradeAt.Unix() >= unixToday {
				if b.DiagnosisType == int(enums.DiagnosisFirst) {
					dayFirD++
				} else if b.DiagnosisType == int(enums.DiagnosisFurther) {
					dayFuD++
				} else if b.DiagnosisType == int(enums.DiagnosisSecend) {
					daySecD++
				}
			}
		} else {
			tmDeal = tmDeal.Add(b.RealAmount)
			tPaid = tPaid.Add(b.PaidAmount)
			tbDebt = tbDebt.Add(b.DebtAmount)
			tRefund = tRefund.Add(b.RefundAmount)
			if b.TradeAt.Unix() >= unixToday {
				deal = deal.Add(b.RealAmount)
				paid = paid.Add(b.PaidAmount)
				bdebt = bdebt.Add(b.DebtAmount)
				refund = refund.Add(b.RefundAmount)
				dealCnt += 1
				tdCnt += b.Brand1 + b.Brand2 + b.Brand3 + b.Brand4 + b.Brand5
				tiCnt += (b.Brand1 + b.Brand2 + b.Brand3 + b.Brand4 + b.Brand5 - b.Brand1Impl - b.Brand2Impl - b.Brand3Impl - b.Brand4Impl - b.Brand5Impl)

				if b.TradeType == int(enums.TradeDeal) {
					dayDeal++
					if b.DiagnosisType == int(enums.DiagnosisFirst) {
						dayFirD++
					} else if b.DiagnosisType == int(enums.DiagnosisFurther) {
						dayFuD++
					} else if b.DiagnosisType == int(enums.DiagnosisSecend) {
						daySecD++
					}
				}
			}
		}
	}

	totalPaid := tPaid.Add(tbDebt).Sub(tRefund)
	todayPaid := paid.Add(bdebt)
	totalDebt := tmDeal.Sub(tPaid) //欠款

	dayFmt := day.Format("2006年01月02日\n")

	var texts utils.StringBuilder
	texts.Append(dayFmt)

	texts.Append(fmt.Sprintf("汇报人：%s\n", tu.Name))

	var taskList []models.TargetTask
	if err := SerTargetTask.GetTasks(enums.Month, today.Year()*100+int(today.Month()), teamId, 0, deptPath, &taskList); err != nil {
		return "", err
	}
	var tmpLen int
	var memberLen int
	var totalDeal int
	for _, task := range taskList {
		if task.Deal > 0 {
			totalDeal += task.Deal
			memberLen++
		} else {
			tmpLen++
		}
	}
	texts.Append(fmt.Sprintf("本月团队任务：%s\n", utils.MoneyFmt(float64(totalDeal))))
	if tmpLen > 0 {
		texts.Append(fmt.Sprintf("未完成任务：%d+%d\n", memberLen, tmpLen))
	} else {
		texts.Append(fmt.Sprintf("人员数量：%d\n", memberLen))
	}

	var edList []models.EventDaySt
	if err := SerEventDaySt.GetList(teamId, 0, deptPath, begin, end, &edList); err != nil {
		return "", err
	}

	var stDay utils.StringBuilder

	for _, ed := range edList {
		if ed.Day.Unix() >= unixToday { //今日
			dayNc += ed.NewCustomerCnt
			//dayFirD += ed.FirstDiagnosis + ed.FirstDiagnosisReferred
			//dayFuD += ed.FurtherDiagnosis
			//dayDeal += ed.Deal
			dayIv += ed.Invitation
			for _, m := range members {
				if m.UserId == ed.UserId {
					if ed.Rest == 2 {
						stDay.Append(fmt.Sprintf("%s：0休息\n", m.Name))
					} else {
						stDay.Append(fmt.Sprintf("%s：留存%d初诊%d复诊%d成交%d\n", m.Name, ed.NewCustomerCnt, ed.FirstDiagnosis, ed.FurtherDiagnosis, ed.Deal))
					}
					break
				}
			}

		}
		tNc += ed.NewCustomerCnt
		//tFirD += ed.FirstDiagnosis
		//tFuD += ed.FurtherDiagnosis
		tDeal += ed.Deal
	}
	var spday models.SummaryPlanDay

	if err := SerSummaryPlanDay.GetByDay(teamId, userId, today, &spday); err != nil {
		return "", err
	}

	texts.Append(fmt.Sprintf("今日留存信息：%d\n", dayNc))
	texts.Append(fmt.Sprintf("今日邀约到诊：%d\n", dayFirD))
	texts.Append(fmt.Sprintf("今日成交患者：%d\n", dayDeal))
	texts.Append(fmt.Sprintf("今日种植颗数：%d\n", tdCnt))
	texts.Append(fmt.Sprintf("明日邀约患者：%d\n", dayIv))
	texts.Append(fmt.Sprintf("本月留存患者数：%d\n", tNc))
	texts.Append(fmt.Sprintf("本月初诊患者数：%d\n", tFirD))
	texts.Append(fmt.Sprintf("本月成交患者数：%d\n", tDeal))

	if tFirD == 0 {
		texts.Append("本月患者成交率：0%\n")
	} else {
		f := fmt.Sprintf("%d%%", tDeal*100/tFirD)
		texts.Append(fmt.Sprintf("本月患者成交率：%s\n", f))
	}

	texts.Append(fmt.Sprintf("种植颗数：%d\n", dCnt))
	texts.Append(fmt.Sprintf("延期颗数：%d\n", iCnt))
	texts.Append(fmt.Sprintf("成交总流水：%s\n", tmDeal.StringFixedBank(0)))

	texts.Append(fmt.Sprintf("总欠款金额：%s\n", totalDebt.StringFixedBank(0)))
	texts.Append(fmt.Sprintf("本月实收：%s\n", totalPaid.StringFixedBank(0)))
	texts.Append(fmt.Sprintf("今日实收：%s\n", todayPaid.StringFixedBank(0)))
	if tmDeal.IsZero() {
		texts.Append("实收率：0%\n")
	} else {
		texts.Append(fmt.Sprintf("实收率：%s\n", fmt.Sprintf("%s%%", totalPaid.Div(tmDeal).Mul(decimal.NewFromInt(100)).StringFixedBank(0))))
	}
	if memberLen == 0 {
		texts.Append("团队人效：0%%\n")
	} else {
		texts.Append(fmt.Sprintf("团队人效：%s\n", totalPaid.Div(decimal.NewFromInt(int64(memberLen))).StringFixedBank(0)))
	}
	texts.Append(fmt.Sprintf("收回上月欠款：%s\n", tbDebt.StringFixedBank(0)))

	befMonth := begin.AddDate(0, -1, 0)
	deferDental := 0
	if m, err := s.StDental(teamId, 0, deptPath, befMonth, begin); err == nil {
		deferDental = m.Total - m.Implanted
	}

	texts.Append(fmt.Sprintf("上月延期种植：%d\n", deferDental)) //TODO

	dp := fmt.Sprintf("%d%%", today.Day()*100/utils.GetMonthLen(today))
	texts.Append(fmt.Sprintf("本月时间进度：%s\n", dp))

	if tmDeal.IsZero() {
		texts.Append("本月任务达成率：0%\n")
	} else {
		tp := fmt.Sprintf("%s%%", totalPaid.Div(decimal.NewFromInt(int64(totalDeal))).Mul(decimal.NewFromInt(100)).StringFixedBank(0))
		texts.Append(fmt.Sprintf("本月任务达成率：%s\n", tp))
	}

	texts.Append("\n")
	texts.Append("今日工作汇报：\n")
	texts.Append(spday.Summary)
	texts.Append("\n\n")

	texts.Append(fmt.Sprintf("今日留存：%s\n", strconv.Itoa(dayNc)))

	texts.Append(stDay.String())

	texts.Append("\n")
	texts.Append("明日工作计划：\n")
	texts.Append(spday.Plan)
	texts.Append("\n")
	return texts.String(), nil
}

func (s *BillService) StDental(teamId, userId int, deptPath string, begin, end time.Time) (dto.DentalStDto, error) {
	var m dto.DentalStDto
	db := s.DB().Model(&models.Bill{}).Select("sum(brand1+brand2+brand3+brand4+brand5) as total", "sum(brand1_impl+brand2_impl+brand3_impl+brand4_impl+brand5_impl) as implanted").
		Where("team_id = ?", teamId).Where("trade_at >=?", begin).Where("trade_at < ?", end)
	if userId != 0 {
		db.Where("user_id = ?", userId)
	} else if deptPath != "" {
		db.Where("dept_path like ?", deptPath+"%")
	}
	err := db.First(&m).Error
	return m, err
}
