import requests
import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

class FactureList(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="Liste des factures")

        self.set_border_width(10)

        # Création de la liste
        self.liststore = Gtk.ListStore(str, str, float, str)

        # Récupération des données depuis l'API
        factures = requests.get('https://monapi.com/factures').json()
        for f in factures:
            self.liststore.append([f['num_facture'], f['date_facture'], f['montant_facture'], f['id_reservation']])

        # Création de la vue de liste
        treeview = Gtk.TreeView(model=self.liststore)

        # Création des colonnes avec leurs titres
        renderer = Gtk.CellRendererText()
        column_num_fact = Gtk.TreeViewColumn("num_facture", renderer, text=0)
        treeview.append_column(column_num_fact)

        renderer = Gtk.CellRendererText()
        column_date_fact = Gtk.TreeViewColumn("date_facture", renderer, text=1)
        treeview.append_column(column_date_fact)

        renderer = Gtk.CellRendererText()
        column_montant_fact = Gtk.TreeViewColumn("montant_facture", renderer, text=2)
        treeview.append_column(column_montant_fact)

        renderer = Gtk.CellRendererText()
        column_id_reserv = Gtk.TreeViewColumn("id_reservation", renderer, text=3)
        treeview.append_column(column_id_reserv)

        # Ajout de la vue de liste à la fenêtre
        self.add(treeview)

# Affichage de la fenêtre
win = FactureList()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
