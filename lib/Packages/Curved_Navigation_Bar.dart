//@ http://codingninja.info/how-to-create-a-bottom-navigation-bar-in-flutter.html
//@ https://pub.dev/packages/curved_navigation_bar

// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void curvedNavigationBar() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar Demo',
      debugShowCheckedModeBanner: false,
      home: MyBottomNavigationBarDemo(),
    );
  }
}

class MyBottomNavigationBarDemo extends StatefulWidget {
  
  @override
  _MyBottomNavigationBarDemoState createState() => _MyBottomNavigationBarDemoState();
}

class _MyBottomNavigationBarDemoState extends State<MyBottomNavigationBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar Demo'),
        backgroundColor: Colors.deepPurple,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.deepPurple,
        buttonBackgroundColor: Colors.deepPurple,
        height: 60,
        animationDuration: const Duration(
          milliseconds: 200,
        ),
        index: 2,
        animationCurve: Curves.bounceInOut,
        items: const <Widget>[
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.verified_user, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.settings, size: 30, color: Colors.white),
          Icon(Icons.more_horiz, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }
}