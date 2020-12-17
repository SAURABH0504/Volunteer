import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/Screens/ContactUs.dart';
import 'package:myapp/Screens/HomeScreen.dart';
import 'package:myapp/Screens/NGOList.dart';
import 'package:myapp/Screens/NGOScreen.dart';
import 'package:myapp/Screens/VolunteerScreen.dart';

void main() {
  runApp(new MaterialApp(home: FutureBuilder(
    // Initialize FlutterFire
    future: Firebase.initializeApp(),
    builder: (context, snapshot) {
      // Check for errors
      if (snapshot.hasError) {
        return Center(
          child: Text('Connection Error'),
        );
      }
      // Once complete, show your application
      if (snapshot.connectionState == ConnectionState.done) {
        return MyApp();
      }
      // Otherwise, show something whilst waiting for initialization to complete
      return Center(child: CircularProgressIndicator());
    },
  ),));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        child: Scaffold(
          appBar: AppBar(
            title: Container(child: Center(child: Text('Volunteer Stage',style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),))),
            backgroundColor: Colors.black,
            bottom: TabBar(
              tabs: [
                Tab(child: FlatButton(child: Container(child: Text('Home',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),))),),
                Tab(child: FlatButton(child: Container(child: Text('Be a Volunteer',style: TextStyle(color: Colors.white,fontSize: 18),)))),
                Tab(child: FlatButton(child: Container(child: Text('Register as a NGO',style: TextStyle(color: Colors.white,fontSize: 18),)))),
                Tab(child: FlatButton(child: Container(child: Text('Contact Us',style: TextStyle(color: Colors.white,fontSize: 18),)),)),
              ],
            ),
          ),
          body: TabBarView(
             children: [HomeScreen(),VolunteerScreen(),NGOScreen(),NGOList()],
          ),
        ),
        length: 4,
        initialIndex: 0,
      ),
    );
  }
}
