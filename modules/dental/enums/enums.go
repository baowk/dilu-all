package enums

type DentalBrand struct {
	Name   string   `json:"name"`   //名称
	Alias  []string `json:"alias"`  //别名
	Origin string   `json:"origin"` //产地
	Id     int      `json:"id"`     //编号id
}

var DentalBrands = []DentalBrand{
	DentalBrand{
		Name:   "奥齿泰",
		Origin: "韩国",
		Id:     1,
	},
	DentalBrand{
		Name:   "皓圣",
		Origin: "美国",
		Id:     2,
	},
	DentalBrand{
		Name:   "雅定",
		Alias:  []string{"ADIN"},
		Origin: "以色列",
		Id:     3,
	},
	DentalBrand{
		Name:   "ITI",
		Alias:  []string{"士卓曼"},
		Origin: "瑞士",
		Id:     4,
	},
	DentalBrand{
		Name:   "诺贝尔",
		Origin: "瑞典",
		Id:     5,
	},
}

var Counselor = []string{"咨询师", "外场咨询"}
var TradeAt = []string{"成交日期", "时间"}
var CustomerName = []string{"患者姓名", "患者"}
var Doctor = []string{"种植医生", "医生"}
var Project = []string{"种植项目"}
var Brand = []string{"品牌"}
var Cnt = []string{"颗数"}
var Others = []string{"全科项目", "全科"}
var Total = []string{"成交金额", "费用"}
var Paid = []string{"实收金额", "实收"}
var Debts = []string{"欠款金额", "欠款"}
var PaybackDate = []string{"补款日期"}
var Implant = []string{"种在嘴里", "是否已种", "种植情况"}
var ImplantVals = []string{"是", "已"}
var Extensions = []string{"延期情况"}
var Remark = []string{"备注", "未成交原因"}

type DayType int

const (
	DAY   DayType = 1
	Week  DayType = 7
	Month DayType = 30
)

type Pack int

const (
	PackCnt  Pack = 1 + iota //多颗
	PackHalf                 //半口
	PackFull                 //全口
	General                  //全科
)

type TradeType int

const (
	TradeFail    TradeType = -1 //未成交
	TradeDeal    TradeType = 1  //成交
	TradeBalance TradeType = 2  //补当月款
	TradeDebt    TradeType = 3  //补上月款
	TradeImplant TradeType = 9  //补种牙齿
	TradeRefund  TradeType = 10 //退款

)

type ImplantType int

const (
	ImplantNo   ImplantType = 1 //未种
	ImplantHalf ImplantType = 2 //部分
	ImplantFull ImplantType = 3 //全部
)

type DiagnosisType int

const (
	DiagnosisFirst   DiagnosisType = 1 //初诊
	DiagnosisFurther DiagnosisType = 2 //复诊
	DiagnosisSecend  DiagnosisType = 3 //新诊（二开）
)

type SourceType int

const (
	SourceLocal        SourceType = 1 //场地
	SourceOut          SourceType = 2 //场外
	SourceWorkOvertime SourceType = 3 //加班
)
