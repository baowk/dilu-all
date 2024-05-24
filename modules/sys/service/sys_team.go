package service

import (
	"dilu/modules/sys/enums"
	"dilu/modules/sys/models"
	"dilu/modules/sys/service/dto"

	"github.com/baowk/dilu-core/common/consts"
	"github.com/baowk/dilu-core/core/base"
	"github.com/pkg/errors"
)

type SysTeamService struct {
	*base.BaseService
}

var SerSysTeam = SysTeamService{
	base.NewService(consts.DB_DEF),
}

func (s *SysTeamService) Page(req *dto.SysTeamGetPageReq, list *[]models.SysTeam, total *int64) error {
	db := s.DB()
	if req.Name != "" {
		db = db.Where("name like ?", "%"+req.Name+"%")
	}
	if req.Status != 0 {
		db = db.Where("status = ?", req.Status)
	}
	return db.Limit(req.GetSize()).Offset(req.GetOffset()).Find(list).Limit(-1).Offset(-1).Count(total).Error
}

func (s *SysTeamService) Create(model *models.SysTeam) error {
	if model.Name == "" {
		return errors.New("团队名不能为空")
	}
	if model.Owner == 0 {
		return errors.New("用户id不能为空")
	}
	var user models.SysUser
	if err := SerSysUser.Get(model.Owner, &user); err != nil {
		return err
	}
	if user.Status != 1 {
		return errors.New("用户状态异常")
	}
	if user.PlatformRoleId != 0 {
		return errors.New("用户是平台管理员用户")
	}
	model.Status = 2
	if err := s.DB().Create(model).Error; err != nil {
		return err
	}

	member := models.SysMember{
		TeamId:   model.Id,
		UserId:   model.Owner,
		Nickname: user.Nickname,
		Name:     user.Name,
		PostId:   enums.Admin.Id,
		Status:   1,
		Roles:    "1",
	}

	if err := s.DB().Create(&member).Error; err != nil {
		return err
	}
	return nil
}
