import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teach2/Final.dart';
import 'package:teach2/Register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                
                decoration: InputDecoration(hintText: 'email'),
              ),
              TextField(
               
                decoration: InputDecoration(hintText: 'password'),
                //obscureText: true,
              ),
              ElevatedButton(
                  onPressed: (){
                   
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
