import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk
import os


class HotelApp(Gtk.Window):
    
    def __init__(self):
        Gtk.Window.__init__(self, title="Hôtel SAMBE")

        # création de la barre de menu
        header_bar = Gtk.HeaderBar(title="Hôtel SAMBE")
        header_bar.set_show_close_button(True)
        self.set_titlebar(header_bar)

        # boutons pour chaque section
        btn_chambres = Gtk.Button(label="Chambres")
        btn_clients = Gtk.Button(label="Clients")
        btn_reservations = Gtk.Button(label="Réservations")
        btn_factures = Gtk.Button(label="Factures")

        # connexion des boutons à la méthode switch_page
        btn_chambres.connect("clicked", self.switch_page, "chambres")
        btn_clients.connect("clicked", self.switch_page, "clients")
        btn_reservations.connect("clicked", self.switch_page, "reservations")
        btn_factures.connect("clicked", self.switch_page, "factures")

        # ajout des boutons à la barre de menu
        header_bar.pack_start(btn_chambres)
        header_bar.pack_start(btn_clients)
        header_bar.pack_start(btn_reservations)
        header_bar.pack_end(btn_factures)

        # création du stack pour gérer les pages
        self.stack = Gtk.Stack()
        self.stack.set_transition_type(Gtk.StackTransitionType.SLIDE_LEFT_RIGHT)
        self.stack.set_transition_duration(500)

        # ajout des pages au stack
        self.stack.add_titled(Gtk.Label("Page d'accueil"), "chambres", "Chambres")
        self.stack.add_titled(Gtk.Label("Page Clients"), "clients", "Clients")
        self.stack.add_titled(Gtk.Label("Page Réservations"), "reservations", "Réservations")
        self.stack.add_titled(Gtk.Label("Page Factures"), "factures", "Factures")

        # ajout du stack à la fenêtre
        self.add(self.stack)

         # chemin d'accès aux fichiers de chaque page
        self.file_paths = {
            "chambres": "gestionChambre.py",
            "clients": "gestionClient.py",
            "reservations": "gestionReservation.py",
            "factures": "facture.py",
        }
        
        # ...
        
    def switch_page(self, widget, page_name):
        file_path = self.file_paths[page_name]
        os.system("python {}".format(file_path))


win = HotelApp()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
