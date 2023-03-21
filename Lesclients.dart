import 'package:flutter/material.dart';
import 'menu_principal.dart';
import 'main.dart';


class clients extends StatelessWidget {
  final List<String> clientList = ['Client 1', 'Client 2', 'Client 3']; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Liste des clients",
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
      body: ListView.builder(
        itemCount: clientList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.group),
            title: Text(clientList[index]),
            onTap: () {
              // add client tap functionality here
            },
          );
        },
      ),
    );
  }
}
