import 'package:flutter/material.dart';
import 'menu_principal.dart';
import 'main.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_fin/main.dart';

class fatures extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Factures",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'roboro',
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(156, 39, 176, 1),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.list,color: Color.fromARGB(255, 131, 130, 127),),
              title: Text("Lister Facture"),
              onTap: () {},
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.add,color: Color.fromARGB(255, 131, 130, 127),),
              title: Text("Ajouter Facture"),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
