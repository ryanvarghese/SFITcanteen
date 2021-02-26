

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class UserManagement{
  storeNewUser(user , context){
    Firestore.instance.collection('/users').add({
      'email' : user.email,

    }).then((value) {
      Navigator.of(context).pushNamedAndRemoveUntil('/menupage', (Route<dynamic> route) => false);;
      Navigator.of(context).pushReplacementNamed('/menupage');
    }).catchError((e){
      print(e);
    });
  }
}