package models

import (
	"strconv"
	"time"

	"github.com/astaxie/beego/orm"
)

//注册用户
func RegisterUser(username, password, tel, email string) error {
	o := orm.NewOrm()
	o.Using("default")
	pro := new(Users)
	pro.Username = username
	pro.Password = password
	pro.Tel = tel
	pro.Email = email
	pro.Created = time.Now()
	pro.Updated = time.Now()
	pro.AuthorityStartTimer = time.Now()
	pro.AuthorityEndTimer = time.Now()
	_, err := o.Insert(pro)
	return err
}

//通过用户名查找用户信息
func FindUser(username string) (Users, error) {
	o := orm.NewOrm()
	o.Using("default")
	user := Users{Username: username}
	err := o.Read(&user, "username")

	return user, err
}

//获取所有用户列表
func GetAllUserList() ([]*Users, error) {
	o := orm.NewOrm()

	users := make([]*Users, 0)

	qs := o.QueryTable("users")
	_, err := qs.All(&users)
	return users, err
}

//根据ID删除用户
func DelUser(id string) error {
	uid, err := strconv.ParseInt(id, 10, 64)
	if err != nil {
		return err
	}
	o := orm.NewOrm()
	o.Using("default")

	user := &Users{Id: uid}
	_, err = o.Delete(user)
	return err
}

//根据ID编辑用户
func EditUser(id, username, pwd, email, tel, authority string) error {
	uid, err := strconv.ParseInt(id, 10, 64)
	if err != nil {
		return err
	}
	authorities, err := strconv.ParseBool(authority)
	if err != nil {
		return err
	}
	o := orm.NewOrm()
	user := &Users{Id: uid}
	if o.Read(user) == nil {
		if authorities != user.WetherAuthority {
			user.AuthorityEndTimer = time.Now()
			user.AuthorityTimes++

		}
		user.WetherAuthority = authorities
		user.Username = username
		user.Password = pwd
		user.Email = email
		user.Tel = tel
		user.Updated = time.Now()
		o.Update(user)
	}
	return err
}
