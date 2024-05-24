package apis

import (
	"dilu/common/utils"
	"dilu/modules/sys/models"
	"dilu/modules/sys/service"
	"dilu/modules/sys/service/dto"
	"github.com/baowk/dilu-core/core/base"
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/copier"
)

type SysMenuApi struct {
	base.BaseApi
}

var SysMenuA = SysMenuApi{}

// Get 获取接口列表
// @Summary 获取接口列表
// @Tags sys-SysMenu
// @Accept application/json
// @Product application/json
// @Param data body dto.SysMenuGetReq true "body"
// @Success 200 {object} base.Resp{data=models.SysMenu} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys/sys-menu/get [post]
// @Security Bearer
func (e *SysMenuApi) Get(c *gin.Context) {
	var req dto.SysMenuGetReq
	if err := c.ShouldBind(&req); err != nil {
		e.Error(c, err)
		return
	}
	var data models.SysMenu
	if _, err := service.SerSysMenu.Get(&req, &data); err != nil {
		e.Error(c, err)
		return
	}
	e.Ok(c, data)
}

// Create 创建接口列表
// @Summary 创建接口列表
// @Tags sys-SysMenu
// @Accept application/json
// @Product application/json
// @Param data body dto.SysMenuInsertReq true "body"
// @Success 200 {object} base.Resp{data=models.SysMenu} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys/sys-menu/create [post]
// @Security Bearer
func (e *SysMenuApi) Create(c *gin.Context) {
	var req dto.SysMenuInsertReq
	if err := c.ShouldBind(&req); err != nil {
		e.Error(c, err)
		return
	}
	currentUserId := utils.GetUserId(c)
	req.CreateBy = currentUserId
	if req.MenuType == 1 {
		req.Permission = ""
	}
	var data models.SysMenu
	err := copier.Copy(&data, req)
	if err != nil {
		e.Error(c, err)
		return
	}
	if err := service.SerSysMenu.Create(&data); err != nil {
		e.Error(c, err)
		return
	}
	e.Ok(c, data)
}

// Update 更新接口列表
// @Summary 更新接口列表
// @Tags sys-SysMenu
// @Accept application/json
// @Product application/json
// @Param data body dto.SysApiDto true "body"
// @Success 200 {object} base.Resp{data=models.SysMenu} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys/sys-menu/update [post]
// @Security Bearer
func (e *SysMenuApi) Update(c *gin.Context) {
	var req dto.SysMenuUpdateReq
	if err := c.ShouldBind(&req); err != nil {
		e.Error(c, err)
		return
	}
	currentUserId := utils.GetUserId(c)
	req.UpdateBy = currentUserId
	if req.MenuType == 1 {
		req.Permission = ""
	}
	var data models.SysMenu
	err := copier.Copy(&data, req)
	if err != nil {
		e.Error(c, err)
		return
	}
	if err := service.SerSysMenu.UpdateById(&data); err != nil {
		e.Error(c, err)
		return
	}
	e.Ok(c, data)
}

// Del 删除接口列表
// @Summary 删除接口列表
// @Tags sys-SysMenu
// @Accept application/json
// @Product application/json
// @Param data body base.ReqIds true "body"
// @Success 200 {object} base.Resp{data=models.SysMenu} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys/sys-menu/del [post]
// @Security Bearer
func (e *SysMenuApi) Del(c *gin.Context) {
	var req base.ReqIds
	if err := c.ShouldBind(&req); err != nil {
		e.Error(c, err)
		return
	}
	if err := service.SerSysMenu.DelIds(&models.SysMenu{}, req.Ids); err != nil {
		e.Error(c, err)
		return
	}
	e.Ok(c)
}

// GetMenus 获取所有菜单
// @Summary 获取所有菜单
// @Tags sys-SysMenu
// @Accept application/json
// @Product application/json
// @Success 200 {object} base.Resp{data=[]models.SysMenu} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys/sys-menu/all [post]
// @Security Bearer
func (e *SysMenuApi) GetMenus(c *gin.Context) {
	list := make([]models.SysMenu, 0)
	if err := service.SerSysMenu.GetMenus(c, &list); err != nil {
		e.Error(c, err)
		return
	}
	e.Ok(c, list)
}

// GetGrantMenus 获取授权菜单
// @Summary 获取授权菜单
// @Tags sys-SysMenu
// @Accept application/json
// @Product application/json
// @Success 200 {object} base.Resp{data=[]models.SysMenu} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys/sys-menu/grant [post]
// @Security Bearer
func (e *SysMenuApi) GetGrantMenus(c *gin.Context) {
	list := make([]models.SysMenu, 0)
	if err := service.SerSysMenu.GetMenus(c, &list); err != nil {
		e.Error(c, err)
		return
	}
	e.Ok(c, list)
}

// GetUserMenus 获取用户菜单
// @Summary 获取用户菜单
// @Tags sys-SysMenu
// @Accept application/json
// @Product application/json
// @Param teamId header int false "团队id"
// @Success 200 {object} base.Resp{data=[]dto.MenuVo} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys/sys-menu/userMenus [post]
// @Security Bearer
func (e *SysMenuApi) GetUserMenus(c *gin.Context) {
	var ms []dto.MenuVo
	if err := service.SerSysMenu.GetUserMenus(c, &ms); err != nil {
		e.Error(c, err)
		return
	}
	e.Ok(c, ms)
}

// CanAccess 获取用户菜单
// @Summary 获取用户菜单
// @Tags sys-SysMenu
// @Accept application/json
// @Product application/json
// @Param teamId header int false "团队id"
// @Param data body dto.SysMenuGetReq true "body"
// @Success 200 {object} base.Resp{data=string} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys/canAccess [post]
func (e *SysMenuApi) CanAccess(c *gin.Context) {
	var req dto.SysMenuGetReq
	if err := c.ShouldBind(&req); err != nil {
		e.Error(c, err)
		return
	}
	if err := service.SerSysMenu.CanAccess(c, req.Id); err != nil {
		e.Error(c, err)
		return
	}
	e.Ok(c)
}

// GetApis 获取 Menu 和 API 关联关系
// @Summary 获取用户菜单
// @Tags sys-SysMenu
// @Accept application/json
// @Product application/json
// @Param teamId header int false "团队id"
// @Param data body dto.SysMenuAPiGetReq true "body"
// @Success 200 {object} base.Resp{data=[]dto.SysApiExt} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys-menu/apis [post]
func (e *SysMenuApi) GetApis(c *gin.Context) {
	var req dto.SysMenuAPiGetReq
	if err := c.ShouldBind(&req); err != nil {
		e.Error(c, err)
		return
	}
	var total int64
	apis, err := service.SerSysMenu.GetApisByPage(req.MenuId, req.Path, &total, req.GetSize(), req.GetOffset())
	if err != nil {
		e.Error(c, err)
		return
	}
	e.Page(c, apis, total, req.GetPage(), req.GetSize())
}

// SetApis 设置 Menu 和 API 关联关系
// @Summary 设置 Menu 和 API 关联关系
// @Tags sys-SysMenu
// @Accept application/json
// @Product application/json
// @Param teamId header int false "团队id"
// @Param data body dto.SysMenuAPiGetReq true "body"
// @Success 200 {object} base.Resp{} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys-menu/apis [post]
func (e *SysMenuApi) SetApis(c *gin.Context) {
	var req dto.SysMenuApiSetReq
	if err := c.ShouldBind(&req); err != nil {
		e.Error(c, err)
		return
	}
	err := service.SerSysMenu.SetApis(req.MenuId, req.ApiIds)
	if err != nil {
		e.Error(c, err)
		return
	}
	e.Ok(c)
}
