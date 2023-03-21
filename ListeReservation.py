import requests
import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

class ReservationList(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="Liste des réservations")

        self.set_border_width(10)

        # Création de la liste
        self.liststore = Gtk.ListStore(str, str, str, int, str, str)

        # Récupération des données depuis l'API
        reservations = requests.get('https://monapi.com/reservations').json()
        for r in reservations:
            self.liststore.append([r['id_reservation'], r['date_arrivee'], r['date_depart'], r['nb_personnes'], r['id_client'], r['id_service']])

        # Création de la vue de liste
        treeview = Gtk.TreeView(model=self.liststore)

        # Création des colonnes avec leurs titres
        renderer = Gtk.CellRendererText()
        column_id_reserv = Gtk.TreeViewColumn("id_reservation", renderer, text=0)
        treeview.append_column(column_id_reserv)

        renderer = Gtk.CellRendererText()
        column_date_arr = Gtk.TreeViewColumn("date_arrivee", renderer, text=1)
        treeview.append_column(column_date_arr)

        renderer = Gtk.CellRendererText()
        column_date_dep = Gtk.TreeViewColumn("date_depart", renderer, text=2)
        treeview.append_column(column_date_dep)

        renderer = Gtk.CellRendererText()
        column_nb_pers = Gtk.TreeViewColumn("nb_personnes", renderer, text=3)
        treeview.append_column(column_nb_pers)

        renderer = Gtk.CellRendererText()
        column_id_clt = Gtk.TreeViewColumn("id_client", renderer, text=4)
        treeview.append_column(column_id_clt)

        renderer = Gtk.CellRendererText()
        column_id_srv = Gtk.TreeViewColumn("id_service", renderer, text=5)
        treeview.append_column(column_id_srv)

        # Ajout de la vue de liste à la fenêtre
        self.add(treeview)

# Affichage de la fenêtre
win = ReservationList()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
