package controllers

import (
	"strconv"

	"github.com/astaxie/beego"
)

const (
	SUCCESS = 0x00 //成功
	FAILED  = 0x01 //失败

	SUCCESS_ADMIN         = 0x10 //登录到管理员
	NO_USERNAME           = 0x12 //用户名不存在
	INVALID_USERNAME_PASS = 0x13 //用户名或密码非法

	ERROR_USERINFORMATION = 0X18 //清除了Session

	NO_LOGIN = 0x25 //用户未登录

)

type Basecontroller struct {
	beego.Controller
	Templatetype string
}

func (c *Basecontroller) GetTemplatetype() string {
	templatetype := beego.AppConfig.String("template_type")
	if templatetype == "" {
		templatetype = "comparewebs"
	}
	return templatetype
}

/*
*发送json到前端
*
 */
func (c *Basecontroller) SendJson(status bool, errno int) {
	errno2str := strconv.Itoa(errno)
	c.Data["json"] = &map[string]interface{}{"status": status, "errno": errno2str}
	c.ServeJSON()
}
