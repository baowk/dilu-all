package service

import (
	"dilu/common/config"
	"dilu/modules/sys/models"
	"fmt"
	"time"

	"github.com/baowk/dilu-core/common/consts"
	"github.com/baowk/dilu-core/common/utils"
	"github.com/baowk/dilu-core/core"
	"github.com/baowk/dilu-core/core/base"
	"github.com/baowk/dilu-plugin/email"
)

type SysEmail struct {
	*base.BaseService
}

var SerEmail = SysEmail{
	base.NewService(consts.DB_DEF),
}

var mail_tmp = `
	你的验证码为：%s,10分钟内有效！
`

// 发送验证码
func (e *SysEmail) Send(mail string) error {
	var err error
	code := utils.RandNumberByLen(6)
	data := models.SysEmail{
		Email:     mail,
		Code:      code,
		Type:      "Code",
		Status:    0,
		UseStatus: 0,
	}
	err = core.DB().Create(&data).Error
	if err != nil {
		return err
	}
	content := fmt.Sprintf(mail_tmp, code)
	email.Send(465, "host", "sendEmail", "pwd", "sendname", mail, "验证码消息", content)
	return nil
}

// 验证
func (e *SysEmail) Verify(mail, code string) bool {
	if config.Get().Server.Mode == "dev" && code == "666666" {
		return true
	}
	var err error
	var data models.SysEmail

	err = core.DB().Model(&data).Where(" email = ? ", mail).Order("id desc").First(&data).Error
	if err != nil {
		return false
	}
	if data.UseStatus == 1 {
		return false
	}
	if data.CreatedAt+int64(time.Minute.Seconds()*10) < time.Now().Unix() {
		if code == data.Code {
			data.UseStatus = 1
			data.UpdatedAt = time.Now().Unix()
			core.DB().Save(&data)
			return true
		}
	}

	return false
}
