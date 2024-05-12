package middleware

import (
	"net/http"
	"time"

	"github.com/baowk/dilu-core/common/utils"
	"github.com/gin-gonic/gin"
)

// NoCache is a middleware function that appends headers
// to prevent the client from caching the HTTP response.
func NoCache(c *gin.Context) {
	c.Header("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate, value")
	c.Header("Expires", "Thu, 01 Jan 1970 00:00:00 GMT")
	c.Header("Last-Modified", time.Now().UTC().Format(http.TimeFormat))
	c.Next()
}

// 获取请求id，没有默认一个
func ReqId(c *gin.Context) {
	utils.GetReqId(c)
	c.Next()
}
