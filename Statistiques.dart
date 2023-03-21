import 'package:flutter/material.dart';
import 'menu_principal.dart';



class Statistiques extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulter Statistiques"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        color: Color.fromARGB(255, 247, 187, 221), // Couleur de fond du container
        padding: EdgeInsets.all(16.0), // Marge intérieure de 16 pixels
        constraints: BoxConstraints(maxHeight: 400.0), // Hauteur maximale de 400 pixels
        child: ListView(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.multiline_chart,color: Color.fromARGB(255, 167, 167, 51),),
                title: Text("Stat semestrielle"),
                onTap: () {
                  // Code à exécuter lorsque l'utilisateur appuie sur l'élément
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.bar_chart,color: Color.fromARGB(255, 167, 167, 51),),
                title: Text('stat mensuelle'),
                onTap: () {
                  // Code à exécuter lorsque l'utilisateur appuie sur l'élément
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.show_chart,color: Color.fromARGB(255, 167, 167, 51),),
                title: Text('stat annuelle'),
                onTap: () {
                  // Code à exécuter lorsque l'utilisateur appuie sur l'élément
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.arrow_back,color: Color.fromARGB(255, 167, 167, 51),),
                title: Text("Retour"),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MenuPrincipal()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
