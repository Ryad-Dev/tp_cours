import 'package:app/helper.dart';
import 'package:app/user_details.dart';
import 'package:app/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContactList extends StatelessWidget {
  ContactList({
    Key? key,
    required this.future,
  }) : super(key: key);
  final Future<List<User>> future;

  final DatabaseService _databaseService = DatabaseService();
  Future<void> _onDelete(uid) async {
    await _databaseService.deleteUser(uid);

    Fluttertoast.showToast(
      msg: "Contact supprimé avec succès",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    /*  Future<void> _onUpdate() async {
    final name = nameController.text;
     final prenom = prenomController.text;
    final numero = numberController.text;

    await _databaseService
        .insertUser(User(name: name,prenom: prenom,numero: numero));

    //Navigator.pop(context);
      Fluttertoast.showToast(
      msg: "Contact modifié avec succès",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }
  */

    return FutureBuilder<List<User>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            title: Text(
              "Liste des Contacts",
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final User = snapshot.data![index];
                return _buildUserCard(User, context);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildUserCard(User user, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      CupertinoIcons.person,
                      size: 30,
                    )),
                SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name + " " + user.prenom,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        user.numero,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Utilisateurs(
                                  id: user.id.toString(),
                                  nom: user.name,
                                  prenom: user.prenom,
                                  numero: user.numero,
                                )));
                  },
                  child: Container(
                    width: width / 4,
                    height: width / 11,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: null,
                  child: Container(
                    width: width / 4,
                    height: width / 11,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Modifier",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    _databaseService.deleteUser(user.id!);
                    Fluttertoast.showToast(
                      msg: "Contact supprimé avec succès",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                    );
                  },
                  child: Container(
                    width: width / 4,
                    height: width / 11,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Supprimer",
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
            )
          ],
        ),
      ),
    );
  }
}
