package start

import (
	"dilu/modules/sys/service"
	"fmt"
	"log/slog"
	"time"

	"github.com/gin-gonic/gin"
)

func syncApiFn(r *gin.Engine) {
	slog.Info("***** Begin Sync Api *****", "time", time.Now())
	for _, route := range r.Routes() {
		if err := service.SerSysApi.CreateIsNotExits(route.Method, route.Path); err != nil {
			fmt.Println(err)
		}
	}
	slog.Info("***** End Sync Api *****", "time", time.Now())
}
