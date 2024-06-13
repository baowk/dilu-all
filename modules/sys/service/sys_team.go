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

func (s *SysTeamService) Create(team *models.SysTeam, user *models.SysUser, owner *models.SysMember) error {
	if team.Name == "" {
		return errors.New("团队名不能为空")
	}
	if team.Owner == 0 {
		return errors.New("用户id不能为空")
	}
	if user == nil {
		if err := SerSysUser.Get(team.Owner, user); err != nil {
			return err
		}
	}
	if user.Status != 1 {
		return errors.New("用户状态异常")
	}
	if user.PlatformRoleId != 0 {
		return errors.New("用户是平台管理员用户,无法创建团队")
	}
	team.Status = 2
	if err := s.BaseService.DB().Create(team).Error; err != nil {
		return err
	}
	if owner != nil && owner.Id > 0 {
		return nil
	}
	owner = &models.SysMember{
		TeamId:   team.Id,
		UserId:   user.Id,
		Nickname: user.Nickname,
		Name:     user.Name,
		PostId:   enums.Admin.Id,
		Status:   1,
		Roles:    "1",
	}

	if err := SerSysMember.Create(owner, user); err != nil {
		return err
	}

	return nil
}
