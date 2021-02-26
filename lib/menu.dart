import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sfit_canteen_app_new/profile.dart';
import 'package:sfit_canteen_app_new/Cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sfit_canteen_app_new/Login.dart';
import 'package:sfit_canteen_app_new/register.dart';
import 'package:firebase_database/firebase_database.dart';
import 'contactus.dart';



void main() async {
  FirebaseApp app = await FirebaseApp.configure(name: 'firebaseapp', options:
  new FirebaseOptions(
    databaseURL: 'https://sfit-canteen.firebaseio.com',
  ));
  final FirebaseDatabase database = new FirebaseDatabase(app: app);
  
}

class Menu extends StatefulWidget {

 FirebaseApp app;
 FirebaseDatabase database;
  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> with SingleTickerProviderStateMixin{

  TabController tobj;
  Login lg = new Login();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  void initState() {
    // TODO: implement initState
  tobj= new TabController(length: 3, vsync: this);
    super.initState();


    }

  int price = 350;
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
              
              
            ],
          ),
        ),
        appBar: AppBar(title: Container(child: Center(child: Text('Menu',textScaleFactor: 3, ),),),actions: <Widget>[

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
        ],toolbarHeight: 300,backgroundColor: Colors.orange,


        bottom: TabBar(
          controller: tobj,
          tabs: <Widget>[
            new Tab(child :Text('Veg'),),
            new Tab(child :Text('Non Veg'),),
            new Tab(child :Text('Drinks'),),
          ],

        ),),
         body: new TabBarView(
           controller: tobj,
         children:<Widget> [
           ListView (
             children: [
               ListTile(
                 leading: Image(image: AssetImage('images/burger.png')),
                 title: Text('Burger'),
                 subtitle: Text('Rs $price'),
                 trailing: RaisedButton(
                   child: Text('Add'),
                   onPressed: null,
                 ),
               ),],),
           
           ListView (
             children: [
               ListTile(
                 leading: Image(image: AssetImage('images/burger.png')),
                 title: Text('Burger'),
                 subtitle: Text('Rs $price'),
                 trailing: RaisedButton(
                   child: Text('Add'),
                   onPressed: null,
                 ),
               ),],),


           ListView (
             children: [
               ListTile(
                 leading: Image(image: AssetImage('images/burger.png')),
                 title: Text('Burger'),
                 subtitle: Text('Rs $price'),
                 trailing: RaisedButton(
                   child: Text('Add'),
                   onPressed: null,
                 ),
               ),],)

         ],
         ),
        ),
      );
  }
}
