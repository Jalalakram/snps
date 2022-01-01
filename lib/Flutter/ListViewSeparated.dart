import 'package:flutter/material.dart';

void listViewSeparated() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 25,
      separatorBuilder: (BuildContext context, int index) => Divider(
        thickness: 1,
        color: Colors.blue,
        indent: 32,
        endIndent: 8,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               
                Text(
                  'Title Number $index',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text('Details of the item')
              ],
            ),
          ),
        );
      },
    );
  }
}
  