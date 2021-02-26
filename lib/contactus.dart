import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sfit_canteen_app_new/profile.dart';
import 'package:sfit_canteen_app_new/register.dart';

import 'Cart.dart';
import 'menu.dart';

class Contactus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        drawer: new Drawer(
          child: ListView(
            children:<Widget> [
              new UserAccountsDrawerHeader(
                accountName: Text('Ryan Varghese'),
                accountEmail: Text(''),
                currentAccountPicture: new CircleAvatar(backgroundColor: Colors.orangeAccent, child: Text('R'),),
                decoration: new BoxDecoration(color: Colors.orange),),
              ListTile(
                title: Text('Profile'),
                onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new Profile())),
              ),
              ListTile(
                title: Text('Menu'),
                onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new Menu())),
              ),
              ListTile(
                title: Text('Contact Us'),
                onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new Contactus())),
              ),
              ListTile(
                title:Text('About Us'),
                onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new Menu())),
              )

            ],
          ),
        ),
        appBar: AppBar(
          title: Container(child: Center(child: Text('Contact Us',textScaleFactor: 2, ),),),actions: <Widget>[

          IconButton(icon: Icon(
            Icons.shopping_cart, color: Colors.amber,
          ), onPressed: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new Cart())),),
          TextButton(onPressed: ((){
            FirebaseAuth auth = FirebaseAuth.instance;
            auth.signOut().then((res) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => register()),
                      (Route<dynamic> route) => false);
            });
          }),child: Text('logout', style: TextStyle(
            color: Colors.white,
          ),)),
        ],toolbarHeight: 250,backgroundColor: Colors.orange,),
        body:
    Center(
    child: new Column(
            children: [

              SizedBox(height: 40,),

              Row( children: [
                SizedBox(width: 95,),
               new Text("Contact Number",textScaleFactor: 2,),
               SizedBox(width: 10,),
               Icon(Icons.phone, color: Colors.amber,),
             ],),
              SizedBox(height: 20,),
              new Text("+91 22-28928585",textScaleFactor: 1,),
              SizedBox(height: 20,),
              new Text("+91-9136951119",textScaleFactor: 1,),
              SizedBox(height: 20,),
              new Text("Fax - 022-28954787",textScaleFactor: 1,),
              SizedBox(height: 20,),

               Row(children: [
                 SizedBox(width: 100,),
                new Text("Email Address",textScaleFactor: 2,),
                SizedBox(width: 10,),
                Icon(Icons.email, color: Colors.amber,),
              ],),
              SizedBox(height: 20,),
              new Text("sfedu@sfit.ac.in",textScaleFactor: 1,),
              SizedBox(height: 20,),
              new Text("admissions@sfit.ac.in",textScaleFactor: 1,),
              SizedBox(height: 20,),
              Row(children: [
                SizedBox(width: 115,),
                new Text("Our Location",textScaleFactor: 2,),
                SizedBox(width: 10,),
                Icon(Icons.map_rounded, color: Colors.amber,),
              ],),
              SizedBox(height: 20,),
              new Text("Mount Poinsur, S.V.P. Road, Borivali",textScaleFactor: 1,),
              SizedBox(height: 20,),
              new Text("(West), Mumbai 400 103",textScaleFactor: 1,),


            ],
          ),),



      ),
      );

  }
}
