import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk
import os

class MenuWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="Login")
        self.set_border_width(10)

        box = Gtk.Box()
        box.set_halign(Gtk.Align.CENTER)
        box.set_valign(Gtk.Align.CENTER)
        self.add(box)

        grid = Gtk.Grid()
        grid.set_column_spacing(10)
        grid.set_row_spacing(10)
        box.pack_start(grid, True, True, 0)

        Inscrire_button = Gtk.Button(label="S'inscrire")
        Inscrire_button.set_size_request(100, 100)
        grid.attach(Inscrire_button, 0, 0, 1, 1)

        Connecter_button = Gtk.Button(label="Se connecter")
        grid.attach(Connecter_button, 1, 0, 1, 1)

        grid.set_size_request(300, 100)

        Inscrire_button.connect("clicked", self.ouvrir_Inscrire)
        Connecter_button.connect("clicked", self.ouvrir_Connecter)
    
    def ouvrir_Inscrire(self, widget):
        os.system('python inscription.py')
    def ouvrir_Connecter(self, widget):
        os.system('python connexion.py')
    


window = MenuWindow()
window.connect("destroy", Gtk.main_quit)
window.show_all()
Gtk.main()
