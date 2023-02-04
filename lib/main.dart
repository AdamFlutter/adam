import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    title: 'Flutter ',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController emaill;
  late TextEditingController password;
  @override
  void initState() {
    emaill = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emaill.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 119, 255),
        title: const Text(
          "Adam App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              //const Text("loading");
              return Center(
                child: Column(children: [
                  TextButton(
                    onPressed: () {
                      print("hi");
                    },
                    child: Text(""),
                    
                  ),
                  TextButton(
                    onPressed: () {
                      print("hi");
                    },
                    child: Text(""),
                  ),
                  TextButton(
                    onPressed: () {
                      print("hi");
                    },
                    child: Text(""),
                  ),
                  TextField(
                    controller: emaill,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    enableSuggestions: true,
                    decoration: const InputDecoration(hintText: "email"),
                  ),
                  TextField(
                    controller: password,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: true,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: "password"),
                  ),
                  TextButton(
                    onPressed: () async {
                      final userCredential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emaill.text, password: password.text);
                      print(userCredential);
                    },
                    child: const Text(
                      "REGISTRE",
                    ),
                  )
                ]),
              );
            default:
              return const Center(
                child: Text(
                  "LOADING...",
                  style: TextStyle(fontSize: 40),
                ),
              );
          }
        },
      ),
    );
  }
}
/*       body: FutureBuilder(
        future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              //const Text("loading");
              return Center(
                child: Column(children: [
                  TextField(
                  
                    controller: emaill,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    enableSuggestions: true,
                    decoration: const InputDecoration(hintText: "email"),
                  ),
                  TextField(
                    controller: password,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: true,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: "password"),
                  ),
                  TextButton(
                    onPressed: () async {
                      final userCredential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emaill.text, password: password.text);
                      print(userCredential);
                    },
                    child: const Text(
                      "REGISTRE",
                    ),
                  )
                ]),
              );
            default:
              return const Center(
                child: Text(
                  "LOADING...",
                  style: TextStyle(fontSize: 40),
                ),
              );
          }
        },
      ),*/