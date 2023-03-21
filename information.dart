import 'package:flutter/material.dart';
import 'menu_principal.dart';
import 'main.dart';
import 'infos.dart';
import 'modifier.dart';
import 'modifiertarifs.dart';
import 'reinitialiser.dart';
import 'lesCouleurs.dart';
import 'AjoutTarif.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Informations sur l'hotel",
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
       color: Color.fromARGB(255, 247, 187, 221),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.info_outline,color: Color.fromARGB(255, 53, 51, 51),),
                title: Text("Toutes les informations"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>inform ()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.edit,color: Color.fromARGB(255, 17, 7, 163),),
                title: Text("Modifier le nom de l'hotel"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Modifier()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.attach_money,color: Colors.amber,),
                title: Text('Ajouter des tarifs'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => tarifsAjout()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.attach_money,color: Colors.amber,),
                title: Text('Modifier les tarifs'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => tarifsmodif ()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.restart_alt,color: Color.fromARGB(255, 145, 2, 2),),
                title: Text("Reinitialiser l'hotel"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Reinitialiser()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.color_lens,color: Color.fromARGB(255, 5, 114, 187),),
                title: Text("Les couleurs"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Couleur()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.arrow_back,color: Color.fromARGB(255, 190, 11, 11),),
                title: Text("Retour"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuPrincipal()),
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
