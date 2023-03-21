package main
import(
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

var (
	d * gorm.DB
)

func Connect(){
	c,err := gorm.Open("mysql", "root:root@tcp(localhost:3306)/hotel_test")
	// c,err := gorm.Open("mysql", "fish:passer@tcp(172.20.10.2:3306)/hotel")
	if err != nil {
		panic(err)
	}
	d=c
}

func GetDB() *gorm.DB{
	return d
}