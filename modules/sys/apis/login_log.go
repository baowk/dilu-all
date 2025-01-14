package apis

import (
	"dilu/modules/sys/models"
	"dilu/modules/sys/service"
	"dilu/modules/sys/service/dto"

	"github.com/baowk/dilu-core/core/base"
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/copier"
)

type LoginLogApi struct {
	base.BaseApi
}

var ApiLoginLog = LoginLogApi{}

// QueryPage 获取LoginLog列表
// @Summary 获取LoginLog列表
// @Tags sys-LoginLog
// @Accept application/json
// @Product application/json
// @Param teamId header int false "团队id"
// @Param data body dto.LoginLogGetPageReq true "body"
// @Success 200 {object} base.Resp{data=base.PageResp{list=[]models.LoginLog}} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys/logslogin/page [post]
// @Security Bearer
func (e *LoginLogApi) QueryPage(c *gin.Context) {
	var req dto.LoginLogGetPageReq
	if err := c.ShouldBind(&req); err != nil {
		e.Error(c, err)
		return
	}
	list := make([]models.LoginLog, 0, req.GetSize())
	var total int64

	if req.SortOrder == "" {
		req.SortOrder = "desc"
	}

	if err := service.SerLoginLog.QueryPage(req, &list, &total, req.GetSize(), req.GetOffset()); err != nil {
		e.Error(c, err)
		return
	}
	e.Page(c, list, total, req.GetPage(), req.GetSize())
}

// Get 获取LoginLog
// @Summary 获取LoginLog
// @Tags sys-LoginLog
// @Accept application/json
// @Product application/json
// @Param teamId header int false "团队id"
// @Param data body base.ReqId true "body"
// @Success 200 {object} base.Resp{data=models.LoginLog} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys/logslogin/get [post]
// @Security Bearer
func (e *LoginLogApi) Get(c *gin.Context) {
	var req base.ReqId
	if err := c.ShouldBind(&req); err != nil {
		e.Error(c, err)
		return
	}
	var data models.LoginLog
	if err := service.SerLoginLog.Get(req.Id, &data); err != nil {
		e.Error(c, err)
		return
	}
	e.Ok(c, data)
}

// Create 创建LoginLog
// @Summary 创建LoginLog
// @Tags sys-LoginLog
// @Accept application/json
// @Product application/json
// @Param teamId header int false "团队id"
// @Param data body dto.LoginLogDto true "body"
// @Success 200 {object} base.Resp{data=models.LoginLog} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys/logslogin/create [post]
// @Security Bearer
func (e *LoginLogApi) Create(c *gin.Context) {
	var req dto.LoginLogDto
	if err := c.ShouldBind(&req); err != nil {
		e.Error(c, err)
		return
	}
	var data models.LoginLog
	copier.Copy(&data, req)
	if err := service.SerLoginLog.Create(&data); err != nil {
		e.Error(c, err)
		return
	}
	e.Ok(c, data)
}

// Update 更新LoginLog
// @Summary 更新LoginLog
// @Tags sys-LoginLog
// @Accept application/json
// @Product application/json
// @Param teamId header int false "团队id"
// @Param data body dto.LoginLogDto true "body"
// @Success 200 {object} base.Resp{data=models.LoginLog} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys/logslogin/update [post]
// @Security Bearer
func (e *LoginLogApi) Update(c *gin.Context) {
	var req dto.LoginLogDto
	if err := c.ShouldBind(&req); err != nil {
		e.Error(c, err)
		return
	}
	var data models.LoginLog
	copier.Copy(&data, req)
	if err := service.SerLoginLog.UpdateById(&data); err != nil {
		e.Error(c, err)
		return
	}
	e.Ok(c, data)
}

// Del 删除LoginLog
// @Summary 删除LoginLog
// @Tags sys-LoginLog
// @Accept application/json
// @Product application/json
// @Param teamId header int false "团队id"
// @Param data body base.ReqIds true "body"
// @Success 200 {object} base.Resp{data=models.LoginLog} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys/logslogin/del [post]
// @Security Bearer
func (e *LoginLogApi) Del(c *gin.Context) {
	var req base.ReqIds
	if err := c.ShouldBind(&req); err != nil {
		e.Error(c, err)
		return
	}
	if err := service.SerLoginLog.DelIds(&models.LoginLog{}, req.Ids); err != nil {
		e.Error(c, err)
		return
	}
	e.Ok(c)
}
