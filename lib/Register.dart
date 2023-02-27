import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
                 decoration: InputDecoration(
                  hintText: 'enter email',
                ),
              ),
              TextField(
                onChanged: (value){
                  password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'enter password',
                ),
              ),
              ElevatedButton(onPressed: () async{
                try {
                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailAddress,
                    password: password,
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }
              }, child: Text('Register')),

            ],
          ),
        ),
      ),
    );
  }
}
