package router

import (
	"dilu/common/consts"

	"github.com/baowk/dilu-core/core"
	"github.com/gin-gonic/gin"
)

var (
	routerNoCheckRole = make([]func(*gin.RouterGroup), 0)
	//routerCheckRole   = make([]func(v1 *gin.RouterGroup, authMiddleware *jwt.GinJWTMiddleware), 0)
)

// InitRouter 路由初始化
func InitRouter() {
	r := core.GetApp().GetGinEngine()
	noCheckRoleRouter(r)
}

// noCheckRoleRouter 无需认证的路由
func noCheckRoleRouter(r *gin.Engine) {
	// 可根据业务需求来设置接口版本
	v := r.Group(consts.ApiRoot + "v1/sys")

	for _, f := range routerNoCheckRole {
		f(v)
	}
}
