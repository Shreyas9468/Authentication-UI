import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teach2/Final.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: 'enter email',
                ),
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  hintText: 'enter password',
                ),
              ),
              ElevatedButton(onPressed: (){
                
              }, child: Text('Register')),

            ],
          ),
        ),
      ),
    );
  }
}
