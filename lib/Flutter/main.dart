//^       Discarded Stuff
//Hint:   Special Hints
//#       Text Descriptions
//!       Alert Pitfall etc. Avoid 
//@       Article Link
//ToDo:   Need to be done
//Done:   Task Completed
//------------------- HEADING GOES HERE --------------------
//| Descriptions Goes Here            --                    

// import 'BottomNavigationBar.dart';
// import 'CopyWith.dart';
// import 'FractionallySizedBox.dart';
// import 'ListViewBuilder.dart';
// import 'ListViewSeparated.dart';
import 'NavigatorPush.dart';
// import 'RichText.dart';
// import 'Scaffold.dart';
// import 'SliverAppBar.dart';
// import 'ThemeOf.dart';
// import 'UsingGlobalKey.dart';

// void main() => bottomNavigationBar();
// void main() => copyWith();
// void main() => fractionallySizedBox();
// void main() => listViewBuilder();
// void main() => listViewSeparated();
void main() => navigatorPush();
// void main() => richText();
// void main() => scaffold();
// void main() => sliverAppBar();
// void main() => themeOf();
// void main() => usingGlobalKey();

//----------------------------------------------------------
//------------- Default Flutter Implementation -------------
//----------------------------------------------------------
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData( primarySwatch: Colors.blue, ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() { setState(() { _counter++; }); }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar( title: Text(widget.title), ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('You have pushed the button this many times:',),
//             Text('$_counter', style: Theme.of(context).textTheme.display1,),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }