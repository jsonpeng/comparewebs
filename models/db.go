package models

import (
	"time"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

type Users struct {
	Id                  int64
	Username            string
	Password            string
	Email               string
	Tel                 string
	Created             time.Time `orm:"index"`
	Updated             time.Time `orm:"index"`
	WetherAuthority     bool
	AuthorityStartTimer time.Time `orm:"index"`
	AuthorityEndTimer   time.Time `orm:"index"`
	AuthorityTimes      int64     `orm:"index"`
}

type WebInfo struct {
	Id                   int64
	WebsiteTitle         string
	WebsiteKeyword       string
	WebsiteDes           string
	WebsiteFooterContent string
	WebsiteAccessTime    time.Time `orm:"index"`
	WebsiteCount         int64     `orm:"index"`
}

func RegisterDB() {
	//注册 model
	orm.RegisterModel(new(Users), new(WebInfo))
	//注册驱动
	orm.RegisterDriver("mysql", orm.DRMySQL)
	//注册默认数据库
	orm.RegisterDataBase(beego.AppConfig.String("db_name"), beego.AppConfig.String("db_type"), beego.AppConfig.String("db_uname")+":"+beego.AppConfig.String("db_pwd")+"@/default?charset=utf8")
}
