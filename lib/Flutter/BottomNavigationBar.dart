//@ https://medium.com/better-programming/create-a-cross-platform-tabbed-app-in-flutter-c728ca5e30f6

// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

void bottomNavigationBar() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabbed App',
      theme: ThemeData(primarySwatch: Colors.green,),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<BottomNavigationBarItem> _navigationBarItems = [
    BottomNavigationBarItem( title: Text('Home'), icon: Icon(Icons.home),),
    BottomNavigationBarItem( title: Text('Search'), icon: Icon(Icons.search),),
    BottomNavigationBarItem( title: Text('Profile'), icon: Icon(Icons.account_circle),),
  ];

  Widget _currentWidget = HomeWidget();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0: _currentWidget = HomeWidget(); break;
        case 1: _currentWidget = SearchWidget(); break;
        case 2: _currentWidget = ProfileWidget(); break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
      body: _currentWidget,
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar( title: const Text('Home'),),);
  }
}

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar( title: const Text('Profile'),),);
  }
}

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar( title: const Text('Search'),),);
  }
}