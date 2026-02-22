package common

import (
	"fmt"

	"github.com/baowk/dilu-core/core"
)

func GetMpAccessToken(appId string) string {
	j, err := core.GetApp().GetCache().Get("acctoken:" + appId)
	if err == nil {
		return j
	}
	return ""
}

func SetMpAccessToken(appId string, token string) {
	core.GetApp().GetCache().Set("acctoken:"+appId, token, 7000)
}

func GetMpOpenId(scene string) (string, error) {
	return core.GetApp().GetCache().Get("mp:login:" + scene)
}

func SetMpOpenId(scene, openId string) {
	core.GetApp().GetCache().Set("mp:login:"+scene, openId, 400)
}

func DelMpOpenId(scene string) error {
	err := core.GetApp().GetCache().Del("mp:login:" + scene)
	if err != nil {
		return err
	}
	return nil
}

func TeamMemberKey(teamId, userId int) string {
	return fmt.Sprintf("t:m:%d:%d", teamId, userId)
}
