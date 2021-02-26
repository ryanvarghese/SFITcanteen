import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sfit_canteen_app_new/register.dart';
import 'package:flutter/widgets.dart';

import 'menu.dart';


class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  String email;
  String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailcontrol = TextEditingController();
  final TextEditingController _passcontrol = TextEditingController();

  bool isEnabled = false;
  bool isEnabled2 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(backgroundColor: Colors.orange,  elevation: 0.0, ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(child: Image.asset('images/logo.png',width: 500 ,height: 140,), ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 17.0, 18.0, 20.0),
                      child: Text('SFIT', style: TextStyle(color:Colors.white , fontSize: 100, fontFamily: 'Poppins', fontWeight: FontWeight.w900)),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(

                    bottomRight: Radius.circular(40.0),

                    bottomLeft: Radius.circular(40.0),),
                  color: Colors.orange,
                ),
                height: 340,

              ),


              Form(
                child:Container(
                  padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 40.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      TextFormField(
                        style: TextStyle(color: Colors.black87, fontFamily: 'Poppins', fontWeight: FontWeight.w700),
                        decoration:
                        InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Local Login Address',
                          hintStyle: TextStyle(color: Colors.grey,fontFamily: 'Poppins', fontWeight: FontWeight.w700),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Colors.grey,width: 1),

                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                          ),
                        ),
                        onChanged: (value){
                          email = value;
                          setState(() {
                            if(value.length>0)
                              isEnabled = true;
                            else
                              isEnabled = false;
                          });
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        style: TextStyle(color: Colors.black87, fontFamily: 'Poppins', fontWeight: FontWeight.w700),
                        decoration:
                        InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey,fontFamily: 'Poppins', fontWeight: FontWeight.w700),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Colors.grey,width: 1),

                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                          ),
                        ),
                        onChanged: (value){
                          password = value;
                        },
                      ),
                      SizedBox(height: 20,),


                      FlatButton(

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.grey)
                        ),


                        onPressed: (){
                            FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email, password: password
        ).then((value){
          Navigator.of(context).pushReplacementNamed('/menupage');
        }).catchError((e) {
          print (e);
        }
        );
                        },

                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 7 , 40, 0),
                          child: Text('Sign In', style: TextStyle(color: Color(0Xff5A5A5A), fontFamily: 'Poppins', fontWeight: FontWeight.w900),),
                        ),
                        color: Colors.white,
                      ),
                    ],
                  ),

                ),
              ),

              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "By continuing, you agree to our ",
                      style: TextStyle(fontSize: 10, color: Colors.grey)),
                  TextSpan(
                      text: "Privacy Policies",
                      style: TextStyle(fontSize: 10, color: Color(0xff3082CC), fontFamily: 'Poppins', fontWeight: FontWeight.w500,  decoration: TextDecoration.underline,)),
                ]),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Data Use Policies",
                      style: TextStyle(fontSize: 10, color: Color(0xff3082CC), fontFamily: 'Poppins', fontWeight: FontWeight.w500,  decoration: TextDecoration.underline,)),
                  TextSpan(
                      text: " , including our ",
                      style: TextStyle(fontSize: 10, color: Colors.grey)),
                  TextSpan(
                      text: "Cookie Use",
                      style: TextStyle(fontSize: 10, color: Color(0xff3082CC), fontFamily: 'Poppins', fontWeight: FontWeight.w500,  decoration: TextDecoration.underline,)),
                ]),
              ),
            ],
          ),
        ),

      ),);
  }
}
