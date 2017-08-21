package controllers

import (
	"comparewebs/controllers"
	"comparewebs/models"

	"github.com/astaxie/beego"
)

type AdminController struct {
	controllers.Basecontroller
}

/*
*后台首页
*
 */
func (c *AdminController) Index() {
	c.Data["IsAdminIndex"] = true
	categories, err := models.GetAllUserList()
	if err != nil {
		beego.Error(err)
	}
	c.Data["AllUsers"] = categories
	c.TplName = c.GetTemplatetype() + "/admin/index.html"
}

/*
*网站信息设置
*
 */
func (c *AdminController) Info() {
	if c.Ctx.Request.Method == "POST" {
		website_title := c.Input().Get("website_title")
		website_keyword := c.Input().Get("website_keyword")
		website_des := c.Input().Get("website_des")
		website_footer := c.Input().Get("website_footer")

		models.EditWebInfo("1", website_title, website_keyword, website_des, website_footer)
		//c.SendJson(true, 0x00)
		c.Redirect("/comparewebs-admin/editwebinfo", 301)
	}
	allinfo, err := models.AdminAccess()
	if err != nil {
		beego.Error(err)
	}
	c.Data["IsAdminInfo"] = true
	c.Data["AllInfo"] = allinfo
	c.TplName = c.GetTemplatetype() + "/admin/info.html"
}
