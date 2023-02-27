import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Register.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    String emailAddress = "";
    String password = "";

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value){
                  emailAddress = value;
                },
                decoration: InputDecoration(hintText: 'email'),
              ),
              TextField(
                obscureText: true,
                onChanged: (value){
                  password = value;
                },
                decoration: InputDecoration(hintText: 'password'),
                //obscureText: true,
              ),
              ElevatedButton(
                  onPressed: () async{
                    try {
                      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailAddress,
                          password: password
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  },
                  child: Text('Click to login')),
              Text('Not have an Account'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => new Register()),
                    );
                  },
                  child: Text("Register Here"))
            ],
          ),
        ),
      ),
    );
  }
}
