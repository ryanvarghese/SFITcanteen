import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sfit_canteen_app_new/register.dart';
import 'Login.dart';
import 'menu.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Main());
  Firebase.initializeApp();
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => new Main(),
        '/signuppage': (BuildContext context) => new register(),
        '/menupage': (BuildContext context) => new Menu(),
      },
    );
  }
}

void helper() => runApp(MaterialApp(
      home: Homepage(),
    ));

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sqflite'),
        ),
        body: Column(children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text('insert'),
            color: Colors.grey[400],
          ),
          FlatButton(
            onPressed: () {},
            child: Text('query'),
            color: Colors.green,
          ),
          FlatButton(
            onPressed: () {},
            child: Text('update'),
            color: Colors.blue[100],
          ),
          FlatButton(
              onPressed: () {}, child: Text('delete'), color: Colors.red[200]),
        ]));
  }
}
