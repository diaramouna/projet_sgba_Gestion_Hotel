import 'package:flutter/material.dart';
import 'menu_principal.dart';
import 'main.dart';

class tarifsmodif extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text (" modification de Tarifs",style: TextStyle (
        color: Colors.white ,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'roboro' ,      ),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.purple,
      ),
    );
  }
}