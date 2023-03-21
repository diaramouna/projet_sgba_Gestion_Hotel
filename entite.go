package main

import (
	"github.com/jinzhu/gorm"
	// "net/http"
	// "encoding/json"
	//"fmt"
)

var db *gorm.DB

//***************************************************TYPE CLIENT*******************************************************************

type Client struct{
	Id_client int `json: "id"`
	Nom string `json: "name"`
	Prenom string `json: "prenom"`
	Telephone string `json: "telephone"`
}

func init(){
	Connect()
	db = GetDB()
	// db.AutoMigrate(&Client{})
}

func (c *Client) AddClient() *Client{
	db.NewRecord(c)
	db.Create(&c)
	return c
}


func GetAllClients() []Client{
	var Clients []Client
	db.Find(&Clients)
	return Clients
}

func ClientId(Id int64) (*Client, *gorm.DB){
	var cl Client
	db:=db.Where("Id_client=?",Id).Find(&cl)
	return &cl, db
}

func DelClient(Id int64) Client{
	var cl Client
	db.Where("Id_client=?",Id).Delete(&cl)
	return cl
}

//**********************************************TYPE Reservations*******************************************************************

type Services struct{
	Id_service int `json: "id_service"`
	Nom_service string `json: "nom_service"`
	Prix_service float64 `json: "prix_service"`
}

func (s *Services) AddService() *Services{
	db.NewRecord(s)
	db.Create(&s)
	return s
}

func GetAllServices() []Services{
	var Services []Services
	db.Find(&Services)
	return Services
}

func ServiceId(Id int64) (*Services, *gorm.DB){
	var ser Services
	db:=db.Where("Id_service=?",Id).Find(&ser)
	return &ser, db
}

func DelService(Id int64) Services{
	var ser Services
	db.Where("Id_service=?",Id).Delete(&ser)
	return ser
}

//***********************************************************TYPE RESERVATIONS***************************************************************

type Reservations struct{
	Id_reservation int `json: "id_reservation"`
	Date_arrivee string `json: "date_arr"`
	Date_depart string `json: "date_dep"`
	Nb_personnes int `json: "nb_personnes"`
	Id_client int `json: "id_client"`
	Id_service int `json: "id_service"`

}


func (r *Reservations) AddReservations() *Reservations{
	db.NewRecord(r)
	db.Create(&r)
	return r
}

func GetAllReservations() []Reservations{
	var Reservations []Reservations
	db.Find(&Reservations)
	return Reservations
}

func ReservationId(Id int64) (*Reservations, *gorm.DB){
	var ser Reservations
	db:=db.Where("id_reservation=?",Id).Find(&ser)
	return &ser, db
}
// func ReservationDate(date string) (*Reservations, *gorm.DB){
// 	var re Reservations
// 	db:=db.Where()

// }

func DelReservation(Id int64) Reservations{
	var ser Reservations
	db.Where("id_reservation=?",Id).Delete(&ser)
	return ser
}

//*******************************************************************CHAMBRES************************************************************

type Chambres struct{
	Id_chambres int
	Num_chambre int
	Etage int
	Categorie string
	Prix_chambre float64
	Id_reservation int
}

func (s *Chambres) AddChambre() *Chambres{
	db.NewRecord(s)
	db.Create(&s)
	return s
}

func GetAllChambres() []Chambres{
	var Chambres []Chambres
	db.Find(&Chambres)
	return Chambres
}

func ChambreId(Id int64) (*Chambres, *gorm.DB){
	var ser Chambres
	db:=db.Where("Id_Chambre=?",Id).Find(&ser)
	return &ser, db
}

func DelChambre(Id int64) Chambres{
	var ser Chambres
	db.Where("Id_Chambre=?",Id).Delete(&ser)
	return ser
}


//*****************************************************************FACTURES*************************************************************

type Factures struct{
	Num_facture int
	Date_facture string
	Montant_facture float64
	Id_reservation int
}


func (s *Factures) AddFacture() *Factures{
	db.NewRecord(s)
	db.Create(&s)
	return s
}

func GetAllFactures() []Factures{
	var Factures []Factures
	db.Find(&Factures)
	return Factures
}

func FactureId(Id int64) (*Factures, *gorm.DB){
	var ser Factures
	db:=db.Where("Id_Facture=?",Id).Find(&ser)
	return &ser, db
}

func DelFacture(Id int64) Factures{
	var ser Factures
	db.Where("Id_Facture=?",Id).Delete(&ser)
	return ser
}