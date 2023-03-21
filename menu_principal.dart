import 'package:flutter/material.dart';
import 'package:flutter_application_fin/acueil.dart';
import 'information.dart';
import 'Chambre.dart';
import 'Lesclients.dart';
import 'Reservations.dart';
import 'fatures.dart';
import 'Statistiques.dart';
import 'GestionClient.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Principal",
          style: TextStyle(
            color: Color.fromARGB(255, 236, 234, 234),
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
            Card(
              child: ListTile(
                leading: Icon(Icons.business,color: Colors.amber,),
                title: Text("Gestion Hotel"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Info()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.bed_rounded,color: Color.fromARGB(255, 16, 3, 133),),
                title: Text('Les Chambres'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Chambre()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.group,color: Colors.black,),
                title: Text('Les Clients'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Gestion()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.calendar_month,color: Color.fromARGB(255, 85, 143, 107),),
                title: Text('Les Reservations'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Reservations()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.receipt,color: Color.fromARGB(255, 2, 68, 129),),
                title: Text('Les Factures'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => fatures()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.insert_chart,color: Color.fromARGB(255, 48, 45, 38),),
                title: Text('Statistiques'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Statistiques()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.exit_to_app,color: Color.fromARGB(255, 255, 7, 7),),
                title: Text('Quitter'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Accueil()),
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
