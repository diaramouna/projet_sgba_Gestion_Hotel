import 'package:flutter/material.dart';
import 'menu_principal.dart';
import 'main.dart';

class Reservations extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "reservations",
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
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
        color: Color.fromARGB(255, 247, 187, 221),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: GestureDetector(
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.add_circle,
                      color: Color.fromARGB(255, 3, 182, 107),
                    ),
                    title: Text("Ajouter Reservations"),
                  ),
                ),
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: GestureDetector(
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.edit,
                      color: Color.fromARGB(255, 65, 36, 230),
                    ),
                    title: Text("Modifier Reservations"),
                  ),
                ),
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: GestureDetector(
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 211, 46, 5),
                    ),
                    title: Text('Supprimer Reservation'),
                  ),
                ),
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: GestureDetector(
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.list,
                      color: Color.fromARGB(255, 119, 109, 109),
                    ),
                    title: Text('Lister toutes les reservations'),
                  ),
                ),
                onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: GestureDetector(
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(255, 230, 19, 19),
                    ),
                    title: Text("Retour"),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuPrincipal(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
