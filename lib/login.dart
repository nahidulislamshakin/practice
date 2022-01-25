import './home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogIn extends StatefulWidget{
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  String mail="";
  String password="";
  final _formkey = GlobalKey<FormState>();

  Future logIn() async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final UserCredential user = await firebaseAuth.signInWithEmailAndPassword(email: mail, password: password);
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
    return user;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Form(
                  key: _formkey,
                  child: Column(

                    children: [
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: TextFormField(
                          onChanged: (value){
                            setState(() {
                              mail = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: TextFormField(
                          onChanged: (value){
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                      ),
                      RaisedButton(onPressed: ()async{
                        await logIn();
                      },
                        child: Text("Submit"),)
                    ],
                  ),
                ),
              )

            ],)
      ),
    );
  }
}