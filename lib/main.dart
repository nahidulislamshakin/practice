import './login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseOptions get firebaseOptions => const FirebaseOptions(
    apiKey: "AIzaSyCA_H3mG6AclrDt-5C6Jp49ZIDZ9XR7YbA",
    appId: "1:73750114527:android:e11ecdf97ad0d855d7b96a",
    messagingSenderId: "73750114527",
    projectId: "department-app-888ef");

Future initializDefault() async{
  FirebaseApp app = await Firebase.initializeApp(options: firebaseOptions);
}

Future main() async{
  await initializDefault();
  runApp(MaterialApp(home: MyApp(),));

}
class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String mail="";
  String password="";
  final _formkey = GlobalKey<FormState>();

  Future register() async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(email: mail, password: password);
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogIn()));
    return user;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                      await register();
                    },
                      child: Text("Submit"),)
                  ],
                ),
              ),
            )

          ],)
    );
    //  ),
    //   );
  }
}