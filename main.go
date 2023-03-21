package main

import (
	 "net/http"
	"log"
	"github.com/gorilla/mux"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)



func main(){
	r := mux.NewRouter()
	ClientRoutes(r)
	ServicesRoutes(r)
	ReservationRoutes(r)
	ChambresRoutes(r)
	FacturesRoutes(r)
	http.Handle("/",r)	
	log.Fatal(http.ListenAndServe("localhost:5000",r))
} 