package dto

import (
	"dilu/modules/sys/models"

	"github.com/baowk/dilu-core/core/base"
)

// SysMenuGetPageReq 列表或者搜索使用结构体
type SysMenuGetPageReq struct {
	base.ReqPage `query:"-"`
	Title        string `form:"title" search:"type:contains;column:title;table:sys_menu" comment:"菜单名称"` // 菜单名称
	Hidden       int    `form:"hidden" search:"type:exact;column:hidden;table:sys_menu" comment:"显示状态"`  // 显示状态
}

func (m *SysMenuGetPageReq) GetNeedSearch() interface{} {
	return *m
}

type SysMenuInsertReq struct {
	Id           int    `uri:"id" comment:"编码"`            // 编码
	MenuName     string `form:"menuName" comment:"菜单name"` //菜单name
	Title        string `form:"title" comment:"显示名称"`      //显示名称
	Icon         string `form:"icon" comment:"图标"`         //图标
	Path         string `form:"path" comment:"路径"`         //路径
	PlatformType int    `json:"platformType"`              //平台类型 1 平台管理 2团队管理
	MenuType     int    `form:"menuType" comment:"菜单类型"`   //菜单类型
	Permission   string `form:"permission" comment:"权限编码"` //权限编码
	ParentId     int    `form:"parentId" comment:"上级菜单"`   //上级菜单
	NoCache      bool   `form:"noCache" comment:"是否缓存"`    //是否缓存
	Component    string `form:"component" comment:"组件"`    //组件
	Sort         int    `form:"sort" comment:"排序"`         //排序
	Hidden       bool   `form:"hidden" comment:"是否隐藏"`     //是否隐藏
	base.ControlBy
}

func (s *SysMenuInsertReq) GetId() interface{} {
	return s.Id
}

type SysMenuUpdateReq struct {
	Id           int    `uri:"id" comment:"编码"`            // 编码
	MenuName     string `form:"menuName" comment:"菜单name"` //菜单name
	Title        string `form:"title" comment:"显示名称"`      //显示名称
	Icon         string `form:"icon" comment:"图标"`         //图标
	Path         string `form:"path" comment:"路径"`         //路径
	PlatformType int    `json:"platformType"`              //平台类型 1 平台管理 2团队管理
	MenuType     int    `form:"menuType" comment:"菜单类型"`   //菜单类型
	Permission   string `form:"permission" comment:"权限编码"` //权限编码
	ParentId     int    `form:"parentId" comment:"上级菜单"`   //上级菜单
	NoCache      bool   `form:"noCache" comment:"是否缓存"`    //是否缓存
	Component    string `form:"component" comment:"组件"`    //组件
	Sort         int    `form:"sort" comment:"排序"`         //排序
	Hidden       bool   `form:"hidden" comment:"是否显示"`     //是否显示
	base.ControlBy
}

func (s *SysMenuUpdateReq) GetId() interface{} {
	return s.Id
}

type MenuVo struct {
	Id        int       `json:"-"`
	Path      string    `json:"path,omitempty"`      //路由地址 必填
	Name      string    `json:"name,omitempty"`      //路由名字（对应不要重复，和当前组件的name保持一致）必填
	Component string    `json:"component,omitempty"` //按需加载组件 可选
	Redirect  string    `json:"redirect,omitempty"`  //路由重定向 可选
	Meta      RouteMeta `json:"meta,omitempty"`
	Children  []MenuVo  `json:"children,omitempty"`
}

type RouteMeta struct {
	Title        string   `json:"title,omitempty"`      //菜单名称（兼容国际化、非国际化，如何用国际化的写法就必须在根目录的locales文件夹下对应添加） 必填
	Icon         string   `json:"icon,omitempty"`       //图标
	ShowParent   bool     `json:"showParent,omitempty"` //是否显示父菜单
	Rank         int      `json:"rank,omitempty"`       //排序
	KeepAlive    bool     `json:"keepAlive,omitempty"`  //路由组件缓存（开启 true、关闭 false）可选
	ShowLink     bool     `json:"showLink"`             //是否显示 前端默认true，false在菜单列表中不显示
	FrameSrc     string   `json:"frameSrc,omitempty"`   //内嵌的iframe链接 可选
	FrameLoading bool     `json:"frameLoading"`         //iframe页是否开启首次加载动画（默认true）可选
	Auths        []string `json:"auths,omitempty"`      //按钮权限
	//HiddenTag    bool     `json:"hiddenTag"`              //当前菜单名称或自定义信息禁止添加到标签页
}

type SysMenuAPiGetReq struct {
	base.ReqPage `query:"-"`
	MenuId       int    `json:"menuId" form:"menuId"`
	Path         string `json:"path" form:"path"`
}

type SysMenuApiSetReq struct {
	MenuId int   `json:"menuId"`
	ApiIds []int `json:"apiIds"`
}

type SysMenuGetReq struct {
	Id int `uri:"id"`
}

func (s *SysMenuGetReq) GetId() interface{} {
	return s.Id
}

type SysMenuDeleteReq struct {
	Ids []int `json:"ids"`
	base.ControlBy
}

func (s *SysMenuDeleteReq) GetId() interface{} {
	return s.Ids
}

type MenuRole struct {
	models.SysMenu
	IsSelect bool `json:"is_select" gorm:"-"`
}

type SelectRole struct {
	RoleId int `uri:"roleId"`
}
