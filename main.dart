import 'package:flutter/material.dart';

import 'acueil.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bienvenue dans notre hôtel',
      debugShowCheckedModeBanner: false,
      home: Accueil(),
    );
     
  }
}



