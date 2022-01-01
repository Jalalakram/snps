//@ https://medium.com/flutterpub/making-a-network-call-in-flutter-f712f2137109

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
//# Above import is getting Only the GET method from the http.dart file

void http() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( title: Text("GET Request"), ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          fetchData1();
          fetchData2();
          fetchData3();
        }),
      ),
    );
  }

  void fetchData1() async {
    var result = await get( 'https://jsonplaceholder.typicode.com/photos' );
    print(result.body);
  }

  void fetchData2() {
    get( 'https://jsonplaceholder.typicode.com/photos' ).then((result) {
      print(result.body);
    });
  }

  void fetchData3() async {
    print(await get( 'https://raw.githubusercontent.com/doxtitech/flutter_buddy_apps/master/http_example/GET_TEST.md' ));
    
    // http.post('');
    // http.put('');
    // http.delete('');
  }
}
