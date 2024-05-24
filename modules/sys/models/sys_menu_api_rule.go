package models

// SysMenuApiRule
type SysMenuApiRule struct {
	SysMenuId uint `json:"sysMenuId" gorm:"type:int unsigned;primaryKey;autoIncrement;comment:主键"` //主键
	SysApiId  uint `json:"sysApiId" gorm:"type:int unsigned;primaryKey;autoIncrement;comment:主键"`  //主键
}

const TBSysMenuApiRule = "sys_menu_api_rule"

func (SysMenuApiRule) TableName() string {
	return TBSysMenuApiRule
}

func NewSysMenuApiRule() *SysMenuApiRule {
	return &SysMenuApiRule{}
}
