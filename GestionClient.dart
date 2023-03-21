import 'package:flutter/material.dart';
import 'menu_principal.dart';
import 'main.dart';

class Gestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gestion de client",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'roboro',
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.purple,
      ),
      body: Container(
         color: Color.fromARGB(255, 247, 187, 221), // définir la couleur de fond du container
        child: Column(
          children: [
            SizedBox(height: 20), // ajouter un espace vide pour laisser la place à la barre d'app
            Card(
              child: ListTile(
                leading: Icon(Icons.exit_to_app ,color: Color.fromARGB(255, 236, 7, 7),),
                title: Text("Client sortant aujourd'hui"),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.group,color: Color.fromARGB(255, 16, 226, 138),),
                title: Text("liste des clients reservé"),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.delete, color: Color.fromARGB(255, 236, 7, 7),),
                title: Text("suppression d'un client"),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.arrow_back,color: Colors.black,),
                title: Text("Retour"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuPrincipal()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
