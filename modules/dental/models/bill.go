package models

import (
	"time"

	"github.com/shopspring/decimal"
)

// Bill
type Bill struct {
	Id            int             `json:"id" gorm:"type:int unsigned;primaryKey;autoIncrement;comment:主键"`  //主键
	No            string          `json:"no" gorm:"type:varchar(20);comment:订单号"`                           //订单号
	CustomerId    int             `json:"customerId" gorm:"type:int unsigned;comment:顾客"`                   //顾客
	UserId        int             `json:"userId" gorm:"type:int unsigned;comment:用户id"`                     //用户id
	TeamId        int             `json:"teamId" gorm:"type:int unsigned;comment:团队id"`                     //团队id
	DeptPath      string          `json:"deptPath" gorm:"type:varchar(255);comment:部门路径"`                   //路径
	Amount        decimal.Decimal `json:"amount" gorm:"type:decimal(10,2);comment:金额"`                      //金额
	RealAmount    decimal.Decimal `json:"realAmount" gorm:"type:decimal(10,2);comment:折后金额"`                //折后金额
	PaidAmount    decimal.Decimal `json:"paidAmount" gorm:"type:decimal(10,2);comment:已支付金额"`               //已支付金额
	DebtAmount    decimal.Decimal `json:"debtAmount" gorm:"type:decimal(10,2);comment:回收上月欠款"`              //回收上月欠款
	RefundAmount  decimal.Decimal `json:"refundAmount" gorm:"type:decimal(10,2);comment:退款"`                //退款
	LinkId        int             `json:"linkId" gorm:"type:int unsigned;comment:关联订单"`                     //关联订单
	TradeAt       time.Time       `json:"tradeAt" gorm:"type:datetime;default:(-);comment:交易日期"`            //交易日期
	TradeType     int             `json:"tradeType" gorm:"type:tinyint;comment:交易类型1 成交 2补尾款  3补上月欠款 10退款"` //交易类型 1 成交 2补尾款  3补上月欠款 10退款
	Brand1        int             `json:"brand1" gorm:"type:tinyint;comment:品牌"`                            //品牌奥齿泰
	Brand2        int             `json:"brand2" gorm:"type:tinyint;comment:品牌"`                            //品牌皓圣
	Brand3        int             `json:"brand3" gorm:"type:tinyint;comment:品牌"`                            //品牌雅定
	Brand4        int             `json:"brand4" gorm:"type:tinyint;comment:品牌"`                            //品牌ITI
	Brand5        int             `json:"brand5" gorm:"type:tinyint;comment:品牌"`                            //品牌诺贝尔
	Brand1Impl    int             `json:"brand1Impl" gorm:"type:tinyint;comment:品牌"`                        //品牌奥齿泰
	Brand2Impl    int             `json:"brand2Impl" gorm:"type:tinyint;comment:品牌"`                        //品牌皓圣
	Brand3Impl    int             `json:"brand3Impl" gorm:"type:tinyint;comment:品牌"`                        //品牌雅定
	Brand4Impl    int             `json:"brand4Impl" gorm:"type:tinyint;comment:品牌"`                        //品牌ITI
	Brand5Impl    int             `json:"brand5Impl" gorm:"type:tinyint;comment:品牌"`                        //品牌诺贝尔
	DiagnosisType int             `json:"diagnosisType" gorm:"type:tinyint;comment:出诊类型"`                   //出诊类型1 初诊 2复诊 3新诊
	Source        int             `json:"source" gorm:"type:tinyint;comment:来源"`                            //来源 1场地 2转介绍 3 加班
	Implant       int             `json:"implant" gorm:"type:tinyint;comment:种植状态：1 未种 2部分 3已种"`            //种植状态：1 未种 2部分 3已种
	ImplantDate   time.Time       `json:"implantDate" gorm:"type:datetime;default:(-);comment:植入日期"`        //植入日期
	Doctor        string          `json:"doctor" gorm:"type:varchar(32);comment:医生"`                        //医生
	Pack          int             `json:"pack" gorm:"type:tinyint;comment:1 普通 2 半口 3 全口"`                  //1 普通 2 半口 3 全口
	PaybackDate   time.Time       `json:"paybackDate" gorm:"type:datetime;default:(-);comment:预定回款日期"`      //预定回款日期
	Tags          string          `json:"tags" gorm:"type:varchar(255);comment:标签"`                         //标签
	PrjName       string          `json:"prjName" gorm:"type:varchar(255);comment:项目"`                      //种植项目
	OtherPrj      string          `json:"otherPrj" gorm:"type:varchar(255);comment:其他项目"`                   //其他项目
	Remark        string          `json:"remark" gorm:"type:varchar(255);comment:备注"`                       //备注
	CreatedAt     time.Time       `json:"createdAt" gorm:"type:datetime;comment:创建时间"`                      //创建时间
	UpdatedAt     time.Time       `json:"updatedAt" gorm:"type:datetime;comment:更新时间"`                      //更新时间
	CreateBy      int             `json:"createBy" gorm:"type:int unsigned;index;comment:创建者"`              //创建者id
	UpdateBy      int             `json:"updateBy" gorm:"type:int unsigned;index;comment:更新者"`              //更新者id
	//DentalCount    int             `json:"dentalCount" gorm:"type:tinyint;comment:颗数"`                       //颗数
	//ImplantedCount int             `json:"implantedCount" gorm:"type:tinyint;comment:已种颗数"`                  //已种颗数
}

func (Bill) TableName() string {
	return "bill"
}
