import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sfit_canteen_app_new/usermanagement.dart';

import 'Login.dart';

class register extends StatefulWidget {
  @override
  registerState createState() => registerState();
}

class registerState extends State<register> {

  String email;
  String password;
  String cpassword;
  String username;

  TextEditingController user = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(title: Container(child: Center(child: Text('Register', textScaleFactor: 2,),),), backgroundColor: Colors.orange, toolbarHeight: 200,),
        body: Form(
    child: Container(
    padding: EdgeInsets.symmetric(horizontal: 80.0,),
    child: Column(
    children: [
      SizedBox(height: 10,),

      TextFormField(
        controller: email1,
        onChanged: (value){
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(hintText: 'Email'),
      ),
    SizedBox(height: 10,),

    TextFormField(
      controller: pass,
    obscureText: true,
      onChanged: (value){
        setState(() {
         password = value;
        });
      },
      decoration: InputDecoration(hintText: 'Password'),
    ),
      SizedBox(height: 10,),


    RaisedButton(onPressed:(){
  FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email, password: password
  ).then((signedInUser){
   UserManagement().storeNewUser(signedInUser.user, context);
  }).catchError((e){
    print(e);
  });
    } ,
    child: Text('Register'),
    ),

      Container(
        child: Row(
          children: [
            Text('Already have an account?'),
            TextButton(onPressed:(){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                return Login();
              }));} , child: Text('Login'))
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    ],
    ),
    ),
    ),
      ),
    );
  }
}
