package dto

import (
    "github.com/baowk/dilu-core/core/base"
    "dilu/modules/sys/models"
)

type LoginLogGetPageReq struct {
	base.ReqPage `query:"-"`
    SortOrder  string `json:"-" query:"type:order;column:id"`
    
    
}

func (LoginLogGetPageReq) TableName() string {
	return models.TBLoginLog
}


//LoginLog
type LoginLogDto struct {
    
    Id uint64 `json:"id"` //主键
    Uid uint `json:"uid" form:"uid"` //用户id 
    Method int8 `json:"method" form:"method"` //登录方式 
    Ip string `json:"ip" form:"ip"` //登录ip 
    Region string `json:"region" form:"region"` //地域 
    ClientId string `json:"clientId" form:"clientId"` //客户端 
    ClientVer string `json:"clientVer" form:"clientVer"` //操作系统 
    Os string `json:"os" form:"os"` //操作系统 
    OsVer string `json:"osVer" form:"osVer"` //操作系统版本 
}