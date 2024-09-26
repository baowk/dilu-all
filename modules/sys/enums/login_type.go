package enums

type LoginType int8

const (
	LT_UNKNOWN   LoginType = 0 //未知
	LT_PHONE     LoginType = 1 //手机登录
	LT_EMAIL     LoginType = 2 //邮箱登录
	LT_USER_PWD  LoginType = 3 //账密登录
	LT_WECHAT_MP LoginType = 4 //账密登录
)
