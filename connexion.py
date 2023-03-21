import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk
import requests


class LoginWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="Page de Connexion")

        # Création d'une grille pour organiser les éléments
        grid = Gtk.Grid()
        self.add(grid)

        # Champ d'adresse e-mail
        email_label = Gtk.Label(label="Adresse e-mail")
        grid.attach(email_label, 0, 0, 1, 1)

        self.email_entry = Gtk.Entry()
        grid.attach(self.email_entry, 1, 0, 1, 1)

        # Champ de mot de passe
        password_label = Gtk.Label(label="Mot de passe")
        grid.attach(password_label, 0, 1, 1, 1)

        self.password_entry = Gtk.Entry()
        self.password_entry.set_visibility(False)
        grid.attach(self.password_entry, 1, 1, 1, 1)

        # Bouton de connexion
        login_button = Gtk.Button(label="Connexion")
        login_button.connect("clicked", self.on_login_clicked)
        grid.attach(login_button, 1, 2, 1, 1)
         # Centrer les éléments dans la fenêtre
        grid.set_halign(Gtk.Align.CENTER)
        grid.set_valign(Gtk.Align.CENTER)

    def on_login_clicked(self, button):
    # Récupérer les informations d'identification entrées par l'utilisateur
        email = self.email_entry.get_text()
        password = self.password_entry.get_text()

    # Envoyer une requête HTTP POST à l'API pour vérifier les informations d'identification
        url = "https://example.com/api/login"
        data = {"email": email, "password": password}
        response = requests.post(url, data=data)

    # Analyser la réponse de l'API pour déterminer si les informations d'identification sont correctes
        if response.status_code == 200 and response.json()["authenticated"]:
        # Afficher un message de confirmation si les informations d'identification sont correctes
            dialog = Gtk.MessageDialog(
                parent=self,
                flags=0,
                message_type=Gtk.MessageType.INFO,
                buttons=Gtk.ButtonsType.OK,
                text="Connexion réussie"
        )
            dialog.run()
            dialog.destroy()
        else:
        # Afficher un message d'erreur si les informations d'identification sont incorrectes
            dialog = Gtk.MessageDialog(
                parent=self,
                flags=0,
                message_type=Gtk.MessageType.ERROR,
                buttons=Gtk.ButtonsType.OK,
                text="Adresse e-mail ou mot de passe incorrect"
        )
            dialog.run()
            dialog.destroy()
win = LoginWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
