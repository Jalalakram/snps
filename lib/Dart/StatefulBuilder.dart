///@ https://medium.com/flutter-community/stateful-widgets-be-gone-stateful-builder-a67f139725a0
///# Works but not recommended due to it's anti pattern
///# as Immutable class has Non-final Values

import 'package:flutter/material.dart';

void statefulBuilder() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Center(
          child: PersonCard(),
        ),
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  int counter = 0;  ///! Should be Immuatable
  @override
  Widget build(BuildContext contex) {
    return Card(
      child: SizedBox(
        width: 300.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "Luke Skywalker",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "Age:  23",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Center(
              child: Container(
                height: 130.0,
                width: 130.0,
                child: Image.asset("assets/skywalker.png"),
              ),
            ),
            const SizedBox(height: 12.0),
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.skip_previous),
                      onPressed: () {
                        setState(() {
                          counter--;
                        });
                      },
                    ),
                    Text(
                      "$counter",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next),
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}