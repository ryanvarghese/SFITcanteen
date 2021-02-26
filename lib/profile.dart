import 'package:flutter/material.dart';
import 'package:sfit_canteen_app_new/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sfit_canteen_app_new/Login.dart';

import 'Cart.dart';
import 'contactus.dart';

class Profile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.amber),
          title: Column( children: <Widget>[
          Center(child: CircleAvatar(backgroundColor: Colors.orangeAccent, child: Text('R'),radius: 50,)),

          Center(child: Padding(child: Text('Ryan', style: TextStyle(
            fontSize: 22.0, color: Colors.white, fontFamily: 'Open Sans'
          ),),padding: EdgeInsets.all(5.0),),),

            Center(child: Padding(child: Text('Upload Photo',style: TextStyle(
              fontSize: 16.0,color: Colors.white60,
            ),),padding:EdgeInsets.all(5.0),),),],),

        toolbarHeight:200,actions: <Widget>[

    IconButton(icon: Icon(
    Icons.shopping_cart,
    ), onPressed: (){
      Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context)=> new Cart()));
    },)
    ],

          flexibleSpace: Image(
            image: AssetImage('images/burger.png'),
            fit: BoxFit.cover,
          ),

      ),


        drawer: new Drawer(

          child: ListView(
            children:<Widget> [
              new UserAccountsDrawerHeader(
                accountName: Text('Ryan Varghese'),
                accountEmail: Text('ryanvarghese12@gmail.com'),
                currentAccountPicture: new CircleAvatar(backgroundColor: Colors.orangeAccent, child: Text('R'),),
                decoration: new BoxDecoration(color: Colors.lightBlue[900]),),
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
              ),

            ],
          ),

        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ), );

  }
}
