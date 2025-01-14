package models

import (
	"time"
)

// LoginLog
type LoginLog struct {
	Id        uint64    `json:"id" gorm:"type:bigint unsigned;primaryKey;autoIncrement;comment:主键"` //主键
	Uid       uint      `json:"uid" gorm:"type:int unsigned;comment:用户id"`                          //用户id
	Method    int8      `json:"method" gorm:"type:tinyint;comment:登录方式"`                            //登录方式
	Ip        string    `json:"ip" gorm:"type:varchar(42);comment:登录ip"`                            //登录ip
	Region    string    `json:"region" gorm:"type:varchar(100);comment:地域"`                         //地域
	ClientId  string    `json:"clientId" gorm:"type:varchar(64);comment:客户端"`                       //客户端
	ClientVer string    `json:"clientVer" gorm:"type:varchar(32);comment:操作系统"`                     //操作系统
	Os        string    `json:"os" gorm:"type:varchar(32);comment:操作系统"`                            //操作系统
	OsVer     string    `json:"osVer" gorm:"type:varchar(64);comment:操作系统版本"`                       //操作系统版本
	UpdatedAt time.Time `json:"updatedAt" gorm:"type:datetime;comment:更新时间"`                        //更新时间
}

const TBLoginLog = "login_log"

func (LoginLog) TableName() string {
	return TBLoginLog
}

//func NewLoginLog() *LoginLog{
//    return &LoginLog{}
//}
