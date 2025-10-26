package idcard

// import (
// 	"fmt"
// 	"regexp"
// 	"strconv"
// )

// var id_18 = regexp.MustCompile(`^\d{6}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$`)

// // 18位身份证正则表达式验证
// func CheckID18(idcard string) bool {
// 	return id_18.MatchString(idcard)
// }

// var id_15 = regexp.MustCompile(`^\d{6}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}$`)

// // 15位身份证正则表达式验证
// func CheckID15(idcard string) bool {
// 	return id_15.MatchString(idcard)
// }

// var W = []int{7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2}

// // 身份证有效性认证
// func Check(idcard string) bool {
// 	sum := 0
// 	for idx, val := range W {
// 		i, err := strconv.ParseInt(string(idcard[idx]), 10, 32)
// 		if err != nil {
// 			fmt.Println(err)
// 			return false
// 		}
// 		sum += int(i) * val
// 	}
// 	// 校验位是X，则表示10
// 	if idcard[17] == 'X' || idcard[17] == 'x' {
// 		sum += 10
// 	} else {
// 		i, err := strconv.ParseInt(string(idcard[17]), 10, 32)
// 		if err != nil {
// 			return false
// 		}
// 		sum += int(i)
// 	}
// 	// 如果除11模1，则校验通过
// 	return sum%11 == 1
// }
