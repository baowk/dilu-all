package dto

import (
	"github.com/baowk/dilu-core/core/base"
	"time"
)

type SysApiGetPageReq struct {
	base.ReqPage `query:"-"`
	Status       int `form:"status"  query:"type:eq;column:status;table:sys_api"` //状态 3 DEF 2 OK 1 del
}

// SysApiDto 接口列表
type SysApiDto struct {
	base.Model
	Title     string    `json:"title"`     //标题
	Method    string    `json:"method"`    //请求类型
	Path      string    `json:"path"`      //请求地址
	PermType  int       `json:"permType"`  //权限类型（1无需认证 2须token 3须鉴权）
	Status    int       `json:"status"`    //状态 3 DEF 2 OK 1 del
	UpdateBy  int       `json:"updateBy"`  //更新者
	UpdatedAt time.Time `json:"updatedAt"` //最后更新时间
}

type SysApiExt struct {
	SysApiDto
	SysMenuId int `json:"sysMenuId"`
}
