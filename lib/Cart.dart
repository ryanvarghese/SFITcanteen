import 'package:flutter/material.dart';
import 'package:sfit_canteen_app_new/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Cart extends StatefulWidget {
  @override
  CartState createState() => CartState();
}
rara(){
  
}

class CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
              Navigator.pop(context);
          }, ),
        backgroundColor: Colors.orange,
        ),
        body: Container(
          child: Center(
        child: Text('Cart'),
        ),
        ),
      )
    );
  }
}
