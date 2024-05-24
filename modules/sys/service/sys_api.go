package service

import (
	"dilu/common/consts"
	"dilu/modules/sys/models"
	"encoding/json"
	"strconv"
	"time"

	"github.com/baowk/dilu-core/core/base"

	coreConst "github.com/baowk/dilu-core/common/consts"
)

type SysApiService struct {
	*base.BaseService
}

var SerSysApi = SysApiService{
	base.NewService(coreConst.DB_DEF),
}

func (s *SysApiService) GetByType(permType int, list *[]models.SysApi) error {
	key := consts.CacheApiKey + strconv.Itoa(permType)
	str, err := s.Cache().Get(key)
	if err == nil {
		if err := json.Unmarshal([]byte(str), list); err == nil {
			if len(*list) > 0 {
				return nil
			}
		}
	}
	db := s.DB().Where("status > 1")
	if permType > 0 {
		db.Where("perm_type = ?", permType)
	}
	err = db.Find(list).Error
	if err == nil {
		s.Cache().Set(key, *list, time.Hour*24)
	}
	return err
}

func (s *SysApiService) CreateIsNotExits(method, path string) error {
	var cnt int64
	if err := s.DB().Model(models.NewSysApi()).Where("method = ? and path = ?", method, path).Count(&cnt).Error; err != nil {
		return err
	}
	if cnt == 0 {
		api := &models.SysApi{
			Method: method,
			Path:   path,
		}
		if err := s.DB().Create(&api).Error; err != nil {
			return err
		}
	}
	return nil
}
