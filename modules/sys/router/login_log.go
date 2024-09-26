package router

import (
	"dilu/common/middleware"
	"dilu/modules/sys/apis"

	"github.com/gin-gonic/gin"
)

func init() {
	routerNoCheckRole = append(routerNoCheckRole, registerLoginLogRouter)
}

// 默认需登录认证的路由
func registerLoginLogRouter(v1 *gin.RouterGroup) {
	r := v1.Group("logslogin").Use(middleware.JwtHandler()).Use(middleware.PermHandler())
	{
		r.POST("/get", apis.ApiLoginLog.Get)
		r.POST("/create", apis.ApiLoginLog.Create)
		r.POST("/update", apis.ApiLoginLog.Update)
		r.POST("/page", apis.ApiLoginLog.QueryPage)
		r.POST("/del", apis.ApiLoginLog.Del)
	}
}
