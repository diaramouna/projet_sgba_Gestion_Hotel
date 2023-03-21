package main
import(
	"github.com/gorilla/mux"
	
)

var ClientRoutes = func (r *mux.Router)  {
	r.HandleFunc("/Clients", AjoutClients).Methods("POST")
	r.HandleFunc("/Client", GetClients).Methods("GET")
	r.HandleFunc("/Client/{Id}", GetClientsById).Methods("GET")
	r.HandleFunc("/Client/{Id}", DeleteClients).Methods("DELETE")
	r.HandleFunc("/Client/{Id}", UpdateClients).Methods("PUT")
}

var ServicesRoutes = func (r *mux.Router)  {
	r.HandleFunc("/Services", AjoutServices).Methods("POST")
	r.HandleFunc("/Services", GetServices).Methods("GET")
	r.HandleFunc("/Services/{Id}", GetServicesById).Methods("GET")
	r.HandleFunc("/Services/{Id}", UpdateServices).Methods("PUT")
	r.HandleFunc("/Services/{Id}", DeleteServices).Methods("DELETE")
}

var ReservationRoutes = func  (r *mux.Router)  {
	r.HandleFunc("/Reservations", AjoutReservations).Methods("POST")
	r.HandleFunc("/Reservations", GetResevation).Methods("GET")
	r.HandleFunc("/Reservations/{Date}", RechercheResevation).Methods("GET")
	r.HandleFunc("/Reservations/{Id}", UpdateReservations).Methods("PUT")
	r.HandleFunc("/Reservations/{Id}", DeleteReservations).Methods("DELETE")
}

var ChambresRoutes = func (r *mux.Router)  {
	r.HandleFunc("/Chambres", AjoutChambres).Methods("POST")
	r.HandleFunc("/Chambres", GetChambres).Methods("GET")
	r.HandleFunc("/Chambres{ID}", GetChambresById).Methods("GET")
	//r.HandleFunc("/Chambres", UpdateChambres).Methods("PUT")
	r.HandleFunc("/Chambres{Id}", DeleteChambres).Methods("DELETE")
}

var FacturesRoutes = func (r *mux.Router)  {
	r.HandleFunc("/Factures", AjoutFactures).Methods("POST")
	r.HandleFunc("/Factures", GetFactures).Methods("GET")
	r.HandleFunc("/Factures{Id}", GetFacturesById).Methods("GET")
	//r.HandleFunc("/Factures", UpdateFactures).Methods("PUT")
	r.HandleFunc("/Factures{Id}", DeleteFactures).Methods("DELETE")
}
