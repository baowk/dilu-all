package regexps

import "regexp"

// 匹配规则
// ^1第一位为一
// [345789]{1} 后接一位345789 的数字
// \\d \d的转义 表示数字 {9} 接9位
// $ 结束符
var phoneRegex = regexp.MustCompile(`^1[3456789]{1}\d{9}$`)

// CheckMobile 检验手机号
func CheckMobile(phone string) bool {
	return phoneRegex.MatchString(phone)
}

// 18位身份证 ^(\d{17})([0-9]|X)$
// 匹配规则
// (^\d{15}$) 15位身份证
// (^\d{18}$) 18位身份证
// (^\d{17}(\d|X|x)$) 18位身份证 最后一位为X的用户
var idCardRegex = regexp.MustCompile(`(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)`)

// CheckIdCard 检验身份证
func CheckIdCard(card string) bool {
	return idCardRegex.MatchString(card)
}

var emailRegex = regexp.MustCompile(`^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$`)

func CheckEmail(email string) bool {
	return emailRegex.MatchString(email)
}

func CheckPwd(pwd string) bool {
	return len(pwd) >= 6
}

var hmRegex = regexp.MustCompile(`^\d{2}:\d{2}$`)

// 匹配 HH:ss
func CheckHHmm(hs string) bool {
	return hmRegex.MatchString(hs)
}

var hmsRegex = regexp.MustCompile(`^\d{2}:\d{2}:\d{2}$`)

// 匹配 HH:ss
func CheckHHmmss(hs string) bool {
	return hmsRegex.MatchString(hs)
}

// IPv4 正则表达式
var ipv4Regex = regexp.MustCompile(`^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$`)

// IPv4
func CheckIpv4(ip string) bool {
	return ipv4Regex.MatchString(ip)
}

// IPv6 正则表达式
var ipv6Regex = regexp.MustCompile(`^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$`)

func CheckIpv6(ip string) bool {
	return ipv6Regex.MatchString(ip)
}

var internalIPRegex = regexp.MustCompile(`^(10\.|172\.(1[6-9]|2[0-9]|3[0-1])\.|192\.168\.)(\d{1,3}\.){1,3}\d{1,3}$`)

// 内网IP
func CheckInterIp(ip string) bool {
	return internalIPRegex.MatchString(ip)
}
