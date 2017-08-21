package controllers

import (
	"comparewebs/controllers"
	"comparewebs/models"

	"github.com/astaxie/beego"
)

type UserController struct {
	controllers.Basecontroller
}

/*
*网站首页
*
 */
func (c *UserController) Index() {
	c.Data["IsUserIndex"] = true
	allinfo, err := models.AdminAccess()
	if err != nil {
		beego.Error(err)
	}

	c.Data["AllFrontInfo"] = allinfo
	//	alllist, err := models.UserAccess()
	//	if err != nil {
	//		beego.Error(err)
	//	}
	//	beego.Error(alllist)
	c.TplName = c.GetTemplatetype() + "/user/index.html"
}

/*
*用户登录
*
 */
func (c *UserController) Login() {

	if c.Ctx.Request.Method == "POST" {
		username := c.Input().Get("Username")
		pwd := c.Input().Get("Password")
		user, err := models.FindUser(username)
		if username == beego.AppConfig.String("admin_name") && pwd == beego.AppConfig.String("admin_pwd") {
			c.SendJson(true, 0x10)
		} else if err != nil {
			c.SendJson(false, 0x12)

		} else {

			if username == user.Username && pwd == user.Password {
				c.SendJson(true, 0x00)
			} else {
				c.SendJson(false, 0x13)
			}

		}
	}

	c.Data["IsUserLogin"] = true
	c.TplName = c.GetTemplatetype() + "/user/login.html"
}

/*
 *用户注册
 */
func (c *UserController) Reg() {

	if c.Ctx.Request.Method == "POST" {
		username := c.Input().Get("Username")
		pwd := c.Input().Get("Password")
		email := c.Input().Get("Email")
		tel := c.Input().Get("Phone")
		_, err := models.FindUser(username)
		if err == nil {
			//用户已经注册
			c.SendJson(false, 0x16)
		} else {
			//用户注册成功保存数据到数据库
			models.RegisterUser(username, pwd, email, tel)
			c.SendJson(true, 0x00)
		}

	}
	c.Data["IsUserLogin"] = true
	c.TplName = c.GetTemplatetype() + "/user/reg.html"
}

func (c *UserController) Del() {
	if c.Ctx.Request.Method == "POST" {
		uid := c.Input().Get("uid")
		err := models.DelUser(uid)
		if err != nil {
			beego.Error(err)
		}
		c.SendJson(true, 0x00)
	}

}

func (c *UserController) Modify() {
	if c.Ctx.Request.Method == "POST" {
		uid := c.Input().Get("uid")
		username := c.Input().Get("Username")
		pwd := c.Input().Get("Password")
		email := c.Input().Get("Email")
		tel := c.Input().Get("Phone")
		authority := c.Input().Get("Authority")
		models.EditUser(uid, username, pwd, email, tel, authority)
		c.SendJson(true, 0x00)
	}

}
