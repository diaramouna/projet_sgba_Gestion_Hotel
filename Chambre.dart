import 'package:flutter/material.dart';
import 'menu_principal.dart';
import 'main.dart';
import 'infos.dart';
import 'modifier.dart';

class Chambre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Etat chambre"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        color: Color.fromARGB(255, 247, 187, 221),
        padding: EdgeInsets.all(16.0), // Add some padding to the container
        child: ListView(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.event_available,color: Color.fromARGB(255, 9, 175, 84),),
                title: Text("Reserver"),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.hotel, color: Colors.red),
                title: Text("Occuper"),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.hotel, color: Colors.green),
                title: Text('Liberer'),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.arrow_back,color: Color.fromARGB(255, 236, 52, 6),),
                title: Text("Retour"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPrincipal()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
