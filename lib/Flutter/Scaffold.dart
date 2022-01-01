//@ https://flutter.github.io/assets-for-api-docs/assets/material/scaffold_bottom_app_bar.png
///# Flutter code sample for Scaffold
///# This example shows a [Scaffold] with 
///# [AppBar] on Top
///# [BottomAppBar] with a notch for an overlapping [FloatingActionButton]
///# [FloatingActionButton]. The [body] is a [Text] placed in a [Center] in order
///# to center the text within the [Scaffold]. The [FloatingActionButton] is
///# centered and docked within the [BottomAppBar] using
///# [FloatingActionButtonLocation.centerDocked]. The [FloatingActionButton] is
///# connected to a callback that increments a counter.

import 'package:flutter/material.dart';

void scaffold() => runApp(MaterialApp(home: MyStatefulWidget()));

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _count = 0;

  int _selectedIndex = 0;
  // static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Business',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: School',
  //     style: optionStyle,
  //   ),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      ///
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Center(child: Icon(Icons.home)),
            SizedBox(),
            Text('Bottom App Bar'),
          ],
        ),
      ),

      ///#
      body: Center( child: Text('You have pressed the button $_count times.'), ),

      ///#
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => setState(() { _count++; }),
      //   tooltip: 'Increment Counter',
      //   child: Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      ///# 01 - BottomAppBar
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   color: Colors.orangeAccent,
      //   child: Container(
      //     height: 90.0,
      //     child: Row(children: <Widget>[
      //       Text('Rock Bottom...'),
      //       Icon(Icons.account_box),
      //       IconButton(
      //       icon: Icon(Icons.access_alarm),
      //       onPressed: () {
      //         print('Alarm Triggered....');
      //       },
      //     ) 
      //     ],),
      //   ),
      // ),

      ///# - BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), title: Text('Home'),),
          BottomNavigationBarItem(
            icon: Icon(Icons.business), title: Text('Business'),),
          BottomNavigationBarItem(
            icon: Icon(Icons.school), title: Text('School'),),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

      ///# 02 - BottomNavigationBar Delete
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         title: showIndicator(_selectedIndex == 0)),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.access_alarm),
      //         title: showIndicator(_selectedIndex == 1)),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.settings),
      //         title: showIndicator(_selectedIndex == 2)),
      //   ],
      //   onTap: _onItemTappped,
      //   currentIndex: _selectedIndex,
      // ),

      // ///# 03 - PersistentFooterButtons
      // persistentFooterButtons: <Widget>[
      //   IconButton(icon: Icon(Icons.add), onPressed: null,),
      //   IconButton(icon: Icon(Icons.remove), onPressed: null,)
      // ],

    );
  }
}

// Widget showIndicator(bool show) {
//   return show
//       ? Padding(
//           padding: const EdgeInsets.only(top: 4),
//           child: Icon(Icons.brightness_1, size: 10, color: Colors.orange),
//         )
//       : SizedBox();
// }