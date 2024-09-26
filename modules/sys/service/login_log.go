package service

import (
	"github.com/baowk/dilu-core/core/base"
)

type LoginLogService struct {
	*base.BaseService
}

var SerLoginLog = LoginLogService{
	base.NewService("sys"),
}

