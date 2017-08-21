package routers

import (
	"comparewebs/controllers/user"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.UserController{}, "*:Index")
	beego.Router("/login", &controllers.UserController{}, "*:Login")
	beego.Router("/reg", &controllers.UserController{}, "*:Reg")
	beego.Router("/del", &controllers.UserController{}, "*:Del")
	beego.Router("/edit", &controllers.UserController{}, "*:Modify")
}
