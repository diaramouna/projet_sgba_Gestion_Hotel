package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strconv"
	// "time"

	"github.com/gorilla/mux"
	//"rest_api_go/utils"
)

//****************************************************Clients***********************************************************
var newClient Client

func GetClients(q http.ResponseWriter, r *http.Request)  {
	newclients :=GetAllClients()
	res, _ := json.Marshal(newclients)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}

func GetClientsById(q http.ResponseWriter, r *http.Request){
	vars :=mux.Vars(r)
	Id := vars["Id"]
	ID,err := strconv.ParseInt(Id,0,0)
	if err != nil{
		fmt.Println("Erreur lors du castre")
	}
	clDetails, _ :=ClientId(ID)
	res, _ := json.Marshal(clDetails)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}

func DeleteClients(q http.ResponseWriter, r *http.Request){
	vars :=mux.Vars(r)
	Id := vars["Id"]
	ID,err := strconv.ParseInt(Id,0,0)
	if err != nil{
		fmt.Println("Erreur lors du castre")
	}
	clDetails :=DelClient(ID)
	res, _ := json.Marshal(clDetails)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}
func AjoutClients(q http.ResponseWriter, r *http.Request){
	crcl := &Client{}
	CheckBody(r, crcl)
	c:= crcl.AddClient()
	res,_ := json.Marshal(c)
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}

func UpdateClients(q http.ResponseWriter, r *http.Request){
	var upcl = &Client{}
	CheckBody(r,upcl)
	vars :=mux.Vars(r)
	Id := vars["Id"]
	ID,err := strconv.ParseInt(Id,0,0)
	if err != nil{
		fmt.Println("Erreur lors du castre")
		
	}
	clDetails,db :=ClientId(ID)
	if upcl.Nom != ""{
		clDetails.Nom = upcl.Nom
	}
	if upcl.Prenom != ""{
		clDetails.Prenom = upcl.Prenom
	}
	if upcl.Telephone != "" {
		clDetails.Telephone = upcl.Telephone
	}
	db.Save(&clDetails)
	res, _ := json.Marshal(clDetails)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res) 
}

//******************************************************SERVICES****************************************************************

func GetServices(q http.ResponseWriter, r *http.Request)  {
	newservices :=GetAllServices()
	res, _ := json.Marshal(newservices)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}

func GetServicesById(q http.ResponseWriter, r *http.Request){
	vars :=mux.Vars(r)
	Id := vars["Id"]
	ID,err := strconv.ParseInt(Id,0,0)
	if err != nil{
		fmt.Println("Erreur lors du castre")
	}
	clDetails, _ :=ServiceId(ID)
	res, _ := json.Marshal(clDetails)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}

func DeleteServices(q http.ResponseWriter, r *http.Request){
	vars :=mux.Vars(r)
	Id := vars["Id"]
	ID,err := strconv.ParseInt(Id,0,0)
	if err != nil{
		fmt.Println("Erreur lors du castre")
	}
	clDetails :=DelService(ID)
	res, _ := json.Marshal(clDetails)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}
func AjoutServices(q http.ResponseWriter, r *http.Request){
	crcl := &Services{}
	CheckBody(r, crcl)
	c:= crcl.AddService()
	res,_ := json.Marshal(c)
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}

func UpdateServices(q http.ResponseWriter, r *http.Request){
	var upsr = &Services{}
	CheckBody(r,upsr)
	vars :=mux.Vars(r)
	Id := vars["Id"]
	ID,err := strconv.ParseInt(Id,0,0)
	if err != nil{
		fmt.Println("Erreur lors du castre")
		
	}
	clDetails,db :=ServiceId(ID)
	if upsr.Nom_service != ""{
		clDetails.Nom_service = upsr.Nom_service
	}
	if upsr.Prix_service != 0{
		clDetails.Prix_service = upsr.Prix_service
	}
	db.Save(&clDetails)
	res, _ := json.Marshal(clDetails)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res) 
}

//*******************************************************Reservations*****************************************************************

func GetResevation(q http.ResponseWriter, r *http.Request)  {
	newReservations :=GetAllReservations()
	res, _ := json.Marshal(newReservations)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}

func DeleteReservations(q http.ResponseWriter, r *http.Request){
	vars :=mux.Vars(r)
	Id := vars["Id"]
	ID,err := strconv.ParseInt(Id,0,0)
	if err != nil{
		fmt.Println("Erreur lors du castre")
	}
	clDetails :=DelReservation(ID)
	DelClient(ID)
	DelService(ID)
	res, _ := json.Marshal(clDetails)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}
func AjoutReservations(q http.ResponseWriter, r *http.Request){
	crcl := &Reservations{}
	CheckBody(r, crcl)
	c:= crcl.AddReservations()
	res,_ := json.Marshal(c)
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}

func RechercheResevation(q http.ResponseWriter, r *http.Request){
	vars :=mux.Vars(r)
	Id := vars["Id"]
	ID,err := strconv.ParseInt(Id,0,0)
	if err != nil{
		fmt.Println("Erreur lors du castre")
	}
	clDetails, _ :=ReservationId(ID)
	res, _ := json.Marshal(clDetails)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}

func UpdateReservations(q http.ResponseWriter, r *http.Request){
	var upsr = &Reservations{}
	CheckBody(r,upsr)
	vars :=mux.Vars(r)
	Id := vars["Id"]
	ID,err := strconv.ParseInt(Id,0,0)
	if err != nil{
		fmt.Println("Erreur lors du castre")	
	}
	clDetails,db :=ReservationId(ID)
	if upsr.Id_reservation != 0 {
		clDetails.Id_reservation = upsr.Id_reservation
	}
	if upsr.Date_arrivee != "" {
		clDetails.Date_arrivee = upsr.Date_arrivee
	}
	if upsr.Date_depart != ""{
		clDetails.Date_depart = upsr.Date_depart
	}
	if upsr.Nb_personnes !=0{
		clDetails.Nb_personnes = upsr.Nb_personnes
	}
	if upsr.Id_client !=0{
		clDetails.Id_client = upsr.Id_client
	}
	if upsr.Id_service !=0{
		clDetails.Id_service = upsr.Id_service
	}
	db.Save(&clDetails)
	res, _ := json.Marshal(clDetails)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res) 
}
//time.Now()
//*************************************************Chambres*****************************************************************


func GetChambres(q http.ResponseWriter, r *http.Request)  {
	newChambres :=GetAllChambres()
	res, _ := json.Marshal(newChambres)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}

func GetChambresById(q http.ResponseWriter, r *http.Request){
	vars :=mux.Vars(r)
	Id := vars["Id"]
	ID,err := strconv.ParseInt(Id,0,0)
	if err != nil{
		fmt.Println("Erreur lors du castre")
	}
	clDetails, _ :=ChambreId(ID)
	res, _ := json.Marshal(clDetails)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}

func DeleteChambres(q http.ResponseWriter, r *http.Request){
	vars :=mux.Vars(r)
	Id := vars["Id"]
	ID,err := strconv.ParseInt(Id,0,0)
	if err != nil{
		fmt.Println("Erreur lors du castre")
	}
	clDetails :=DelChambre(ID)
	res, _ := json.Marshal(clDetails)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}
func AjoutChambres(q http.ResponseWriter, r *http.Request){
	crcl := &Chambres{}
	CheckBody(r, crcl)
	c:= crcl.AddChambre()
	res,_ := json.Marshal(c)
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}

// func UpdateChambres(q http.ResponseWriter, r *http.Request){
// 	var upsr = &Chambres{}
// 	CheckBody(r,upsr)
// 	vars :=mux.Vars(r)
// 	Id := vars["Id"]
// 	ID,err := strconv.ParseInt(Id,0,0)
// 	if err != nil{
// 		fmt.Println("Erreur lors du castre")
		
// 	}
// 	clDetails,db :=ChambreId(ID)
// 	if upsr.Nom_Chambre != ""{
// 		clDetails.Nom_Chambre = upsr.Nom_Chambre
// 	}
// 	if upsr.Prix_Chambre != 0{
// 		clDetails.Prix_Chambre = upsr.Prix_Chambre
// 	}
// 	db.Save(&clDetails)
// 	res, _ := json.Marshal(clDetails)
// 	q.Header().Set("Content-Type", "application/json")
// 	q.WriteHeader(http.StatusOK)
// 	q.Write(res) 
// }




//*************************************************Factures*****************************************************************

func GetFactures(q http.ResponseWriter, r *http.Request)  {
	newFactures :=GetAllFactures()
	res, _ := json.Marshal(newFactures)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}

func GetFacturesById(q http.ResponseWriter, r *http.Request){
	vars :=mux.Vars(r)
	Id := vars["Id"]
	ID,err := strconv.ParseInt(Id,0,0)
	if err != nil{
		fmt.Println("Erreur lors du castre")
	}
	clDetails, _ :=FactureId(ID)
	res, _ := json.Marshal(clDetails)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}

func DeleteFactures(q http.ResponseWriter, r *http.Request){
	vars :=mux.Vars(r)
	Id := vars["Id"]
	ID,err := strconv.ParseInt(Id,0,0)
	if err != nil{
		fmt.Println("Erreur lors du castre")
	}
	clDetails :=DelFacture(ID)
	res, _ := json.Marshal(clDetails)
	q.Header().Set("Content-Type", "application/json")
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}
func AjoutFactures(q http.ResponseWriter, r *http.Request){
	crcl := &Factures{}
	CheckBody(r, crcl)
	c:= crcl.AddFacture()
	res,_ := json.Marshal(c)
	q.WriteHeader(http.StatusOK)
	q.Write(res)
}

// func UpdateFactures(q http.ResponseWriter, r *http.Request){
// 	var upsr = &Factures{}
// 	CheckBody(r,upsr)
// 	vars :=mux.Vars(r)
// 	Id := vars["Id"]
// 	ID,err := strconv.ParseInt(Id,0,0)
// 	if err != nil{
// 		fmt.Println("Erreur lors du castre")
		
// 	}
// 	clDetails,db :=FactureId(ID)
// 	if upsr.Nom_Facture != ""{
// 		clDetails.Nom_Facture = upsr.Nom_Facture
// 	}
// 	if upsr.Prix_service != 0{
// 		clDetails.Prix_service = upsr.Prix_service
// 	}
// 	db.Save(&clDetails)
// 	res, _ := json.Marshal(clDetails)
// 	q.Header().Set("Content-Type", "application/json")
// 	q.WriteHeader(http.StatusOK)
// 	q.Write(res) 
// }