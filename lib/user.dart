import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utilisateurs extends StatefulWidget {
  const Utilisateurs({super.key});

  @override
  State<Utilisateurs> createState() => _UtilisateursState();
}

class _UtilisateursState extends State<Utilisateurs> {
  String _firstName = "";
  String _lastName = "";
  String _profession = "";

  loadInformation() async {
    final prefs = await SharedPreferences.getInstance();
    setState(
      () {
        _firstName = prefs.getString("firstName") ?? "";
        _lastName = prefs.getString("lastName") ?? "";
        _profession = prefs.getString("profession") ?? "";
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((timeStamp) => loadInformation());
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Profils",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            leading: Text(
              "Nom: ",
              style: TextStyle(fontSize: 20),
            ),
            title: Text(
              _firstName,
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: Text(
              "Prénom: ",
              style: TextStyle(fontSize: 20),
            ),
            title: Text(
              _lastName,
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: Text(
              "Profession: ",
              style: TextStyle(fontSize: 20),
            ),
            title: Text(
              _profession,
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
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
                  "Retour",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
