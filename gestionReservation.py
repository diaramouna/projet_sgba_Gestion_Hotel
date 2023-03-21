import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk
import os

class MenuWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="Menu Reservation")
        self.set_border_width(10)

        box = Gtk.Box()
        box.set_halign(Gtk.Align.CENTER)
        box.set_valign(Gtk.Align.CENTER)
        self.add(box)

        grid = Gtk.Grid()
        grid.set_column_spacing(10)
        grid.set_row_spacing(10)
        box.pack_start(grid, True, True, 0)

        ListReservation_button = Gtk.Button(label="Liste des reservations")
        ListReservation_button.set_size_request(100, 100)
        grid.attach(ListReservation_button, 0, 0, 1, 1)

        SuppReservation_button = Gtk.Button(label="Ajouter une reservation ")
        grid.attach(SuppReservation_button, 1, 0, 1, 1)

        Retour_button = Gtk.Button(label="Retour")
        grid.attach(Retour_button, 2, 0, 1, 1)

        grid.set_size_request(300, 100)

        ListReservation_button.connect("clicked", self.ouvrir_gestion_ListReservation)
        SuppReservation_button.connect("clicked", self.ouvrir_gestion_SuppReservation)
        Retour_button.connect("clicked", self.ouvrir_retour)

    def ouvrir_gestion_ListReservation(self, widget):
        os.system('python ListeReservation.py')
    def ouvrir_gestion_SuppReservation(self, widget):
        os.system('python reservation_chambre.py')
    def ouvrir_retour(self, widget):
        os.system('python acceuil.py')



window = MenuWindow()
window.connect("destroy", Gtk.main_quit)
window.show_all()
Gtk.main()
