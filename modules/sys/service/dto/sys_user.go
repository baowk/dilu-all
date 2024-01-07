package dto

import (
	"dilu/modules/sys/models"

	"github.com/baowk/dilu-core/core/base"
)

type SysUserGetPageReq struct {
	base.ReqPage `search:"-"`
	Id           int    `form:"id" search:"type:exact;column:user_id;table:sys_user" comment:"用户ID"`
	Username     string `form:"username" search:"type:contains;column:username;table:sys_user" comment:"用户名"`
	NickName     string `form:"nickName" search:"type:contains;column:nick_name;table:sys_user" comment:"昵称"`
	Phone        string `form:"phone" search:"type:contains;column:phone;table:sys_user" comment:"手机号"`
	Gender       string `form:"sex" search:"type:exact;column:sex;table:sys_user" comment:"性别"`
	Email        string `form:"email" search:"type:contains;column:email;table:sys_user" comment:"邮箱"`
	Post         string `form:"postId" search:"type:exact;column:post_id;table:sys_user" comment:"岗位"`
	Status       int    `form:"status" search:"type:exact;column:status;table:sys_user" comment:"状态"`
	DeptJoin     `search:"type:left;on:dept_id:dept_id;table:sys_user;join:sys_dept"`
	SysUserOrder
}

type SysUserOrder struct {
	IdOrder        string `search:"type:order;column:user_id;table:sys_user" form:"idOrder"`
	UsernameOrder  string `search:"type:order;column:username;table:sys_user" form:"usernameOrder"`
	StatusOrder    string `search:"type:order;column:status;table:sys_user" form:"statusOrder"`
	CreatedAtOrder string `search:"type:order;column:created_at;table:sys_user" form:"createdAtOrder"`
}

type DeptJoin struct {
	DeptId string `search:"type:contains;column:dept_path;table:sys_dept" form:"deptId"`
}

func (m *SysUserGetPageReq) GetNeedSearch() interface{} {
	return *m
}

type ResetSysUserPwdReq struct {
	Id       int    `json:"id" comment:"用户ID" vd:"$>0"` // 用户ID
	Password string `json:"password" comment:"密码" vd:"len($)>0"`
	base.ControlBy
}

func (s *ResetSysUserPwdReq) GetId() interface{} {
	return s.Id
}

func (s *ResetSysUserPwdReq) Generate(model *models.SysUser) {
	if s.Id != 0 {
		model.Id = s.Id
	}
	model.Password = s.Password
}

type UpdateSysUserAvatarReq struct {
	Id     int    `json:"id" comment:"用户ID" vd:"len($)>0"` // 用户ID
	Avatar string `json:"avatar" comment:"头像" vd:"len($)>0"`
	base.ControlBy
}

func (s *UpdateSysUserAvatarReq) GetId() interface{} {
	return s.Id
}

func (s *UpdateSysUserAvatarReq) Generate(model *models.SysUser) {
	if s.Id != 0 {
		model.Id = s.Id
	}
	model.Avatar = s.Avatar
}

type UpdateSysUserStatusReq struct {
	Id     int `json:"id" comment:"用户ID" vd:"$>0"` // 用户ID
	Status int `json:"status" comment:"状态" vd:"len($)>0"`
	base.ControlBy
}

func (s *UpdateSysUserStatusReq) GetId() interface{} {
	return s.Id
}

func (s *UpdateSysUserStatusReq) Generate(model *models.SysUser) {
	if s.Id != 0 {
		model.Id = s.Id
	}
	model.Status = s.Status
}

type SysUserInsertReq struct {
	Id       int    `json:"id" comment:"用户ID"` // 用户ID
	Username string `json:"username" comment:"用户名" vd:"len($)>0"`
	Password string `json:"password" comment:"密码"`
	Nickname string `json:"nickname" comment:"昵称" vd:"len($)>0"`
	Phone    string `json:"phone" comment:"手机号" vd:"len($)>0"`
	RoleId   int    `json:"roleId" comment:"角色ID"`
	Avatar   string `json:"avatar" comment:"头像"`
	Gender   string `json:"sex" comment:"性别"`
	Email    string `json:"email" comment:"邮箱" vd:"len($)>0,email"`
	DeptId   int    `json:"deptId" comment:"部门" vd:"$>0"`
	Post     string `json:"postId" comment:"岗位"`
	Remark   string `json:"remark" comment:"备注"`
	Status   int    `json:"status" comment:"状态" vd:"len($)>0" default:"1"`
	base.ControlBy
}

func (s *SysUserInsertReq) GetId() interface{} {
	return s.Id
}

type SysUserUpdateReq struct {
	Id       int    `json:"id" comment:"用户ID"` // 用户ID
	Username string `json:"username" comment:"用户名" vd:"len($)>0"`
	Nickname string `json:"nickName" comment:"昵称" vd:"len($)>0"`
	Phone    string `json:"phone" comment:"手机号" vd:"len($)>0"`
	RoleId   int    `json:"roleId" comment:"角色ID"`
	Avatar   string `json:"avatar" comment:"头像"`
	Gender   string `json:"sex" comment:"性别"`
	Email    string `json:"email" comment:"邮箱" vd:"len($)>0,email"`
	DeptId   int    `json:"deptId" comment:"部门" vd:"$>0"`
	Post     string `json:"postId" comment:"岗位"`
	Remark   string `json:"remark" comment:"备注"`
	Status   int    `json:"status" comment:"状态" default:"1"`
	base.ControlBy
}

func (s *SysUserUpdateReq) GetId() interface{} {
	return s.Id
}

// PassWord 密码
type PassWord struct {
	NewPassword string `json:"newPassword" vd:"len($)>0"`
	OldPassword string `json:"oldPassword" vd:"len($)>0"`
}

type SysUserDto struct {
	Id       int    `json:"id"`       //主键
	Username string `json:"username"` //用户名
	Phone    string `json:"phone"`    //手机号
	Email    string `json:"email"`    //邮箱
	Password string `json:"password"` //密码
	Nickname string `json:"nickname"` //昵称
	Name     string `json:"name"`     //姓名
	Avatar   string `json:"avatar"`   //头像
	Bio      string `json:"bio"`      //签名
	Birthday string `json:"birthday"` //生日
	Gender   string `json:"gender"`   //性别 1男 2女 3未知
	RoleId   int    `json:"roleId"`   //角色id
	Post     string `json:"post"`     //岗位
	Remark   string `json:"remark"`   //备注
	Status   int    `json:"status"`   //状态 1冻结 2正常 3默认
}
