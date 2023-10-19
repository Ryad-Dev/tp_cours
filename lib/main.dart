import 'package:app/accueil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<Widget> screens = [
    Accueil(),
    Container(
      color: Colors.red,
    ),
    Container(color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: "accueil"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.add), label: "Ajouter"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.alarm), label: "Alarme"),
        ],
      ),
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  String presentation = "";

  void updateDescription() {
    if (formKey.currentState!.validate()) {
      setState(() {
        presentation = "Je m'appelle " +
            nameController.text +
            " , j'ai " +
            dateController.text +
            " ans et dans la vie je suis " +
            professionController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {}, icon: Icon(CupertinoIcons.bolt_horizontal)),
        title: const Text(
          "Informations",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text("Header")),
            ListTile(
                leading: Icon(CupertinoIcons.person_circle),
                title: Text("data"))
          ],
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: [
                TextFormField(
                  validator: (String? value) {
                    return (value == null || value.isEmpty)
                        ? 'Veuillez entrer votre nom'
                        : null;
                  },
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    label: Text("Nom et Prénom"),
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.account_circle),
                  ),
                ),
                TextFormField(
                  validator: (String? value) {
                    return (value == null || value.isEmpty)
                        ? 'Veuillez entrer votre profession'
                        : null;
                  },
                  controller: professionController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text("Profession"),
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.description),
                  ),
                ),
                TextFormField(
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
                ),
              ],
            ),
            InkWell(
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
            ),
            Text(
              presentation,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/