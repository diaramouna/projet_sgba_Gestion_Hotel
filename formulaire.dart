import 'package:flutter/material.dart';
import 'menu_principal.dart';
import 'main.dart';
import 'acueil.dart';
import 'package:flutter_application_fin/formulaire.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "formulaire",
      home: HotelForm(),
    );
  }
}

class HotelForm extends StatefulWidget {
  @override
  _HotelFormState createState() => _HotelFormState();
}

class _HotelFormState extends State<HotelForm> {
  final _formKey = GlobalKey<FormState>();

  String _nomHotel = "";
  int _nombreEtages = 0;
  int _nombreChambresParEtage = 0;
  double _tarifNormalEconomie = 0;
  double _tarifNormalStandard = 0;
  double _tarifNormalAnnexes = 0;
  double _tarifSpecialEconomie = 0;
  double _tarifSpecialStandard = 0;
  double _tarifSpecialAnnexes = 0;
  double _prixPetitDejeuner = 0;
  double _prixTelephone = 0;
  double _prixBare = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulaire d\'hôtel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nom de l\'hôtel',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer le nom de l\'hôtel';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _nomHotel = value!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration:
                 InputDecoration(
                    labelText: 'Tarif petit dejeuner',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer le tarif  du petit dej';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _tarifNormalEconomie = double.parse(value!);
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Tarif petit dejeuner',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer le tarif  du telephone';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _tarifNormalEconomie = double.parse(value!);
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Tarif bar',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer le tarif de la bar';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _tarifNormalEconomie = double.parse(value!);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






class Formulaire extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
       title: Text ("formulaire", 
       style: TextStyle (
        color: Colors.white ,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'roboro' ,      ),
       ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.purple,
      ),
    
body: ListView(
  
        children: [
          ListTile(
          leading: Icon(Icons.check_circle ,color: Colors.green,),
            title: Text('Valider'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPrincipal())) ;
                 
            },
          ),
          
         ListTile(
           leading: Icon(Icons.arrow_back ,color: Colors.black,),
             title: Text("Retour"),
           
            onTap: () {
              
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Accueil ())) ;
            },
          ),
         
        ],
    ),
    );
  }
}


