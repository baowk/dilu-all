package dto

import (
	"dilu/modules/sys/models"
	"github.com/baowk/dilu-core/core/base"
)

type SysMenuApiRuleGetPageReq struct {
	base.ReqPage `query:"-"`
}

func (SysMenuApiRuleGetPageReq) TableName() string {
	return models.TBSysMenuApiRule
}

// SysMenuApiRule
type SysMenuApiRuleDto struct {
	SysMenuId uint `json:"sysMenuId"` //主键
	SysApiId  uint `json:"sysApiId"`  //主键
}
