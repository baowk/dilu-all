package models

import (
	"time"
)

// 操作日志
type SysOperaLog struct {
	Id            int       `json:"id" gorm:"type:int unsigned;primaryKey;autoIncrement;comment:主键"`         //主键
	Title         string    `json:"title" gorm:"type:varchar(255);comment:操作模块"`                             //操作模块
	BusinessType  string    `json:"businessType" gorm:"type:varchar(128);comment:操作类型"`                      //操作类型
	BusinessTypes string    `json:"businessTypes" gorm:"type:varchar(128);comment:BusinessTypes"`            //BusinessTypes
	Method        string    `json:"method" gorm:"type:varchar(128);comment:函数"`                              //函数
	RequestMethod string    `json:"requestMethod" gorm:"type:varchar(128);comment:请求方式 GET POST PUT DELETE"` //请求方式 GET POST PUT DELETE
	OperatorType  string    `json:"operatorType" gorm:"type:varchar(128);comment:操作类型"`                      //操作类型
	OperName      string    `json:"operName" gorm:"type:varchar(128);comment:操作者"`                           //操作者
	DeptName      string    `json:"deptName" gorm:"type:varchar(128);comment:部门名称"`                          //部门名称
	OperUrl       string    `json:"operUrl" gorm:"type:varchar(255);comment:访问地址"`                           //访问地址
	OperIp        string    `json:"operIp" gorm:"type:varchar(128);comment:客户端ip"`                           //客户端ip
	OperLocation  string    `json:"operLocation" gorm:"type:varchar(128);comment:访问位置"`                      //访问位置
	OperParam     string    `json:"operParam" gorm:"type:longtext;comment:请求参数"`                             //请求参数
	Status        int       `json:"status" gorm:"type:tinyint;comment:操作状态 1:成功 2:失败"`                       //操作状态 1:成功 2:失败
	OperTime      time.Time `json:"operTime" gorm:"type:datetime(3);comment:操作时间"`                           //操作时间
	JsonResult    string    `json:"jsonResult" gorm:"type:varchar(255);comment:返回数据"`                        //返回数据
	Remark        string    `json:"remark" gorm:"type:varchar(255);comment:备注"`                              //备注
	LatencyTime   string    `json:"latencyTime" gorm:"type:varchar(128);comment:耗时"`                         //耗时
	UserAgent     string    `json:"userAgent" gorm:"type:varchar(255);comment:ua"`                           //ua
	CreatedAt     time.Time `json:"createdAt" gorm:"type:datetime(3);comment:创建时间"`                          //创建时间
	UpdatedAt     time.Time `json:"updatedAt" gorm:"type:datetime(3);comment:最后更新时间"`                        //最后更新时间
	CreateBy      int       `json:"createBy" gorm:"type:int unsigned;comment:创建者"`                           //创建者
	UpdateBy      int       `json:"updateBy" gorm:"type:int unsigned;comment:更新者"`                           //更新者
}

const TBSysOperaLog = "sys_opera_log"

func (SysOperaLog) TableName() string {
	return TBSysOperaLog
}

func NewSysOperaLog() *SysOperaLog {
	return &SysOperaLog{}
}
