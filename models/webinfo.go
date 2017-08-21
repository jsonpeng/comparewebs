package models

import (
	"fmt"
	"strconv"
	"time"

	"github.com/astaxie/beego/orm"
)

//用户访问
func UserAccess() (WebInfo, error) {
	o := orm.NewOrm()
	o.Using("default")
	info := WebInfo{Id: 1}
	err := o.Read(&info, "id")
	if err == nil {
		info.Id = 1
		info.WebsiteTitle = ""
		info.WebsiteKeyword = ""
		info.WebsiteDes = ""
		info.WebsiteAccessTime = time.Now()
		info.WebsiteFooterContent = ""
		err, _ := o.Insert(info)
		fmt.Print(err)
	}
	info.WebsiteCount++
	o.Update(info)
	return info, err
}

//修改网站信息
func EditWebInfo(id, title, keyword, des, footer string) error {
	o := orm.NewOrm()
	eid, err := strconv.ParseInt(id, 10, 64)
	if err != nil {
		return err
	}
	info := &WebInfo{Id: eid}
	if o.Read(info) == nil {
		info.WebsiteTitle = title
		info.WebsiteKeyword = keyword
		info.WebsiteDes = des
		info.WebsiteFooterContent = footer

		o.Update(info)
	}
	return err
}

//管理员访问信息显示
func AdminAccess() (WebInfo, error) {
	o := orm.NewOrm()
	o.Using("default")
	info := WebInfo{Id: 1}
	err := o.Read(&info, "id")
	if err != nil {
		content := new(WebInfo)
		content.Id = 1
		content.WebsiteTitle = ""
		content.WebsiteKeyword = ""
		content.WebsiteDes = ""
		content.WebsiteAccessTime = time.Now()
		content.WebsiteFooterContent = ""
		err, _ := o.Insert(content)
		fmt.Print(err)
	}
	return info, err
}
