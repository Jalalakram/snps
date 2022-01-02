//@ http://codingninja.info/working-with-custom-fonts-in-flutter-application.html
//# 1- Download the required fonts https://fonts.google.com/
//# 2- Import them into the project fonts folder.
//# 3- Declare the font in the pubspec.yaml
//# 4- Use the Custom Fonts.

import 'package:flutter/material.dart';

void googleFonts() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Custom Fonts in Flutter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Raleway'),
      home: Scaffold(
        appBar: AppBar(title: Text("Custom Google Fonts in Flutter")),
        body: MyCustomFont(),
      ),
    );
  }
}

class MyCustomFont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(children: <Widget>[
        Text(
          "Hello World!",
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'Roboto',
            fontSize: 50,
          ),
        ),
        Text(
          "Hello World!",
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            fontSize: 50,
          ),
        ),
        Text(
          "Hello World!",
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'Raleway',
            fontSize: 50,
          ),
        ),
        Text(
          "Hello World!",
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'Raleway',
            fontSize: 50,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "Hello World!",
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'TitilliumWeb',
            fontSize: 50,
          ),
        ),
        Text(
          "Hello World!",
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'TitilliumWeb',
            fontSize: 50,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "Hello World!",
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'Anton',
            fontSize: 50,
            fontWeight: FontWeight.w400,
          ),
        ),
      ]),
    ));
  }
}