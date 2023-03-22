import 'package:flutter/material.dart';
import 'menu_principal.dart';
import 'main.dart';
import 'formulaire.dart';



class Accueil extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text"Hotel Ndao Paradis",style: TextStyle (
        color: Colors.white ,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'roboro' ,      ),),
          centerTitle: true,
          backgroundColor: Colors.purple,
          actionsIconTheme: const IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          leading: const Icon(Icons.menu),
          elevation: 20.0,
          
        ),
        body: Center(
          child: const Text("Bienvenue dans votre Hotel"),

        ),
    

        bottomNavigationBar: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.all(13),
                ),
                child: const Text('Binvenue dans notre Hotel'),
                 
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Formulaire())) ;
                 
                },
              ),
              
            ),
          ],
        ),



        
      ),
    );
  }
}




class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background_image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text("Contenu de la page"),
        ),
      ),
    );
  }
}
