import 'package:flutter/material.dart';

void mediaQuery() => runApp(MaterialApp(home: Example1()));

class Example1 extends StatelessWidget {
  const Example1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //? MediaQuery.of() works with a context must be decendent of MetrialApp
    //? MetrialApp above will be used for MediaQuery.of() declaration below.
    Size size = MediaQuery.of(context).size;

    Orientation orientation = MediaQuery.of(context).orientation;

    EdgeInsets devicePadding = MediaQuery.of(context).viewPadding;

    //? MetrialApp below will not work for above MediaQuery.of() declaration.
    return MaterialApp(
      home: Center(
        // child: Padding( padding: devicePadding, //? would limit box exceeding to Taskbar
          child: Scaffold(
            body: Center(
              child: Container(
                width: size.shortestSide / 2,
                color: Colors.blue,
              ),
            ),
          ),
        // ),
      ),
    );
  }
}
