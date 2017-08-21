package routers

import (
	"comparewebs/controllers/admin"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/comparewebs-admin", &controllers.AdminController{}, "*:Index")
	beego.Router("/comparewebs-admin/editwebinfo", &controllers.AdminController{}, "*:Info")
}
