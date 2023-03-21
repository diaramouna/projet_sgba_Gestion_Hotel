import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk
import requests

class InscriptionForm(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="Formulaire de réservation")
        self.set_default_size(400, 300)

        # Créer une grille pour organiser les widgets
        grid = Gtk.Grid()
        grid.set_column_spacing(10)
        grid.set_row_spacing(10)
        self.add(grid)

        # Champ de saisie pour le nom
        label_nom = Gtk.Label(label="Nom")
        grid.attach(label_nom, 0, 0, 1, 1)
        entry_nom = Gtk.Entry()
        entry_nom.set_placeholder_text("Nom")
        grid.attach(entry_nom, 1, 0, 1, 1)

        # Champ de saisie pour le prénom
        label_prenom = Gtk.Label(label="Prénom")
        grid.attach(label_prenom, 0, 1, 1, 1)
        entry_prenom = Gtk.Entry()
        entry_prenom.set_placeholder_text("Prénom")
        grid.attach(entry_prenom, 1, 1, 1, 1)

        # Champ de saisie pour le numéro de téléphone
        label_telephone = Gtk.Label(label="Téléphone")
        grid.attach(label_telephone, 0, 2, 1, 1)
        entry_telephone = Gtk.Entry()
        entry_telephone.set_placeholder_text("Numéro de téléphone")
        grid.attach(entry_telephone, 1, 2, 1, 1)

        label_email = Gtk.Label(label="E-mail")
        grid.attach(label_email, 0, 3, 1, 1)
        entry_telephone.set_placeholder_text("Numéro de téléphone")
        self.entry_email = Gtk.Entry()
        grid.attach(self.entry_email, 1, 3, 1, 1)

        label_motdepasse = Gtk.Label(label="Mot de passe")
        grid.attach(label_motdepasse, 0, 4, 1, 1)
        self.entry_motdepasse = Gtk.Entry()
        self.entry_motdepasse.set_visibility(False)
        grid.attach(self.entry_motdepasse, 1, 4, 1, 1)

        label_confirmation = Gtk.Label(label="Confirmation du mot de passe")
        grid.attach(label_confirmation, 0, 5, 1, 1)
        self.entry_confirmation = Gtk.Entry()
        self.entry_confirmation.set_visibility(False)
        grid.attach(self.entry_confirmation, 1, 5, 1, 1)

        button = Gtk.Button(label="S'inscrire")
        button.connect("clicked", self.on_button_clicked)
        grid.attach(button, 0, 6, 2, 1)

        # Centrer les éléments dans la fenêtre
        grid.set_halign(Gtk.Align.CENTER)
        grid.set_valign(Gtk.Align.CENTER)

    def on_button_clicked(self, widget):
        self.valider_formulaire()

    def valider_formulaire(self):
        prenom = self.entry_prenom.get_text()
        nom = self.entry_nom.get_text()
        telephone = self.entry_telephone.get_text()
        email = self.entry_email.get_text()
        motdepasse = self.entry_motdepasse.get_text()
        confirmation = self.entry_confirmation.get_text()

        # Vérifier que tous les champs obligatoires sont remplis


        # Vérifier que tous les champs obligatoires sont remplis
        if not prenom or not nom or not telephone or not email or not motdepasse or not confirmation:
            message = "Veuillez remplir tous les champs obligatoires"
            dialog = Gtk.MessageDialog(parent=self, flags=0, message_type=Gtk.MessageType.ERROR, buttons=Gtk.ButtonsType.OK, text=message)
            dialog.run()
            dialog.destroy()
            return

        # Vérifier que le mot de passe et la confirmation du mot de passe sont identiques
        if motdepasse != confirmation:
            message = "Le mot de passe et la confirmation du mot de passe ne sont pas identiques"
            dialog = Gtk.MessageDialog(parent=self, flags=0, message_type=Gtk.MessageType.ERROR, buttons=Gtk.ButtonsType.OK, text=message)
            dialog.run()
            dialog.destroy()
            return

        # Envoyer les données à votre API à l'aide d'une requête HTTP POST
        data = {"prenom": prenom, "nom": nom, "telephone": telephone, "email": email, "motdepasse": motdepasse}
        response = requests.post("https://votreapi.com/inscription", data=data)

        # Vérifier la réponse de votre API
        if response.status_code == 200:
            message = "Inscription réussie"
            dialog = Gtk.MessageDialog(parent=self, flags=0, message_type=Gtk.MessageType.INFO, buttons=Gtk.ButtonsType.OK, text=message)
            dialog.run()
            dialog.destroy()
        else:
            message = "Erreur lors de l'inscription"
            dialog = Gtk.MessageDialog(parent=self, flags=0, message_type=Gtk.MessageType.ERROR, buttons=Gtk.ButtonsType.OK, text=message)
            dialog.run()
            dialog.destroy()
            
win = InscriptionForm()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
