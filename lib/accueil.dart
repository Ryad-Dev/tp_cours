import 'package:app/helper.dart';
import 'package:app/user_list.dart';
import 'package:app/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  final DatabaseService _databaseService = DatabaseService();

  Future<void> _onSave() async {
    final name = nameController.text;
     final prenom = prenomController.text;
    final numero = numberController.text;

    await _databaseService
        .insertUser(User(name: name,prenom: prenom,numero: numero));

    //Navigator.pop(context);
      Fluttertoast.showToast(
      msg: "Contact créer avec succès",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  Future<List<User>> _getUsers() async {
    return await _databaseService.users();
    
  }

  String presentation = "";

  String valueProfession = "Developpeur front-end";
  List listProfession = [
    "Developpeur front-end",
    "Developpeur full stack",
    "Designer",
    "Copywriter",
  ];
/*  
  void updateDescription() {
    if (formKey.currentState!.validate()) {
      setState(() {
        presentation = "Je m'appelle" +nameController.text+", j'ai "+prenomController.text+" ans et dans la vie je suis"+ valueProfession ;
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text("Header")),
            ListTile(
                leading: Icon(CupertinoIcons.person_circle),
                title: Text("Profile"))
          ],
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    child: Image.asset("assets/avatar.png"),
                  ),
                  TextFormField(
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Veuillez entrer votre nom'
                          : null;
                    },
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      label: Text("Nom"),
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.account_circle),
                    ),
                  ),
                  TextFormField(
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Veuillez entrer votre prénom'
                          : null;
                    },
                    controller: prenomController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      label: Text("Prénom"),
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.account_circle),
                    ),
                  ),
                  TextFormField(
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Veuillez entrer votre numéro'
                          : null;
                    },
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Téléphone"),
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.description),
                    ),
                  ),

                  /*  DropdownButton(
                       hint: Text("Profession",style: TextStyle(color: Colors.black),),
                      dropdownColor: Colors.blue,
                      isExpanded: true,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                      value: valueProfession,
                      items: listProfession.map((valueItem) {
                        return DropdownMenuItem(
                            value: valueItem, child: Text(valueItem));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          valueProfession = newValue.toString();
                        });
                      }),*/
                  /* TextFormField(
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Veuillez entrer votre date de naissance'
                          : null;
                    },
                    controller: dateController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Age"),
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                  ),*/
                ],
              ),
              InkWell(
                onTap: 
                  _onSave
                
               ,
                child: Container(
                  width: width / 2,
                  height: width / 9,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Créer un contact",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              /*  InkWell(
              onTap: updateDescription,
              child: Container(
                width: width / 2,
                height: width / 9,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Valider",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),*/
             /* InkWell(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setString("firstName", nameController.text);
                    prefs.setString("lastName", prenomController.text);
                    prefs.setString("profession", professionController.text);

                    Fluttertoast.showToast(
                      msg: "Vous avez été enregister avec succès",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                    );
                  }
                },
                child: Container(
                  width: width / 2,
                  height: width / 9,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Enregistrer",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),*/
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactList(
                                future: _getUsers(),
                              )));
                },
                child: Container(
                  width: width / 2,
                  height: width / 9,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Liste des contacts",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              /*  Text(
                presentation,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),*/
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: const Icon(CupertinoIcons.add)),
    );
  }
}
