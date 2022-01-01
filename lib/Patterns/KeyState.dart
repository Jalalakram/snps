//@ https://medium.com/flutterpub/statefulwidgets-key-state-8ad83ac2e54f
import 'package:flutter/material.dart';

void keyState() => runApp(Zero());


class Zero extends StatelessWidget {
  Zero(): super(){
    print(
        ">>>>   Zero being created. Constructor called.");
  }
  @override
  Widget build(BuildContext context) {
    print(">>>>   Zero build() called!");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(title: 'First Page'),
    );
  }
}

/// High-level variable. Identifies the widget. New key? New widget!
Key _key = UniqueKey();

class FirstPage extends StatefulWidget {
  // constructor
  FirstPage({Key key, this.title}) : super(key: key){
    print(
        ">>>>>>>>   FirstPage StatefulWidget being created. Constructor called.");
  }
  final String title;

  @override
  _FirstPageState createState() {
    return _FirstPageState();
  }
}

class _FirstPageState extends State<FirstPage> {
  // constructor
  _FirstPageState() : super() {
    print(
        ">>>>>>>>   _FirstPageState being created. Constructor called.");
  }
  int _counter = 0;

  void initState() {
    print(">>>>>>>>   _FirstPageState initState() called.");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(">>>>>>>>   _FirstPageState build() called!");
    return _SecondPage(
      key: _key,
      title: "${widget.title} counter pressed: $_counter",
      state: this,
    );
  }
}

class _SecondPage extends StatefulWidget {
  // constructor
  _SecondPage({Key key, @required this.title, @required this.state})
      : super(key: key) {
    print(
        ">>>>>>>>>>>>   SecondPage StatefulWidget being created. Constructor called.");
  }
  final String title;
  final _FirstPageState state;

  @override
  _SecondPageState createState() {
    return _SecondPageState();
  }
}

class _SecondPageState extends State<_SecondPage> {
  // constructor
  _SecondPageState() : super() {
    print(
        ">>>>>>>>>>>>   _SecondPageState being created. Constructor called.");
  }
  int _counter = 0;

  void initState() {
    print(">>>>>>>>>>>>   _SecondPageState initState() called.");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(">>>>>>>>>>>>   _SecondPageState build() called!");
    return Scaffold( backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      persistentFooterButtons: <Widget>[
        RaisedButton(
          child: Text(
            'First Page Counter',
          ),
          onPressed: () {
            print(">>>>>>>>   'First Page Counter' button pressed.");
            widget.state.setState(() {
              widget.state._counter++;
            });
          },
        ),
        RaisedButton(
          child: Text(
            'Third Page',
          ),
          onPressed: () {
            print(">>>>>>>>>>>>>>>>   'Third Page' button pressed.");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        _ThirdPage(title: "You're on the Third Page", state: widget.state)));
          },
        ),
      ],
    );
  }

  void deactivate() {
    super.deactivate();
    print(">>>>>>>>>>>>   _SecondPageState deactiviated.");
  }

  void dispose() {
    super.dispose();
    print(
        ">>>>>>>>>>>>   _SecondPageState disposed. Counter was $_counter");
  }
}

class _ThirdPage extends StatefulWidget {
  _ThirdPage({Key key, @required this.title, @required this.state}) : super(key: key) {
    print(
        ">>>>>>>>>>>>>>>>   ThirdPage StatefulWidget being created. Constructor called.");
  }
  final String title;
  final _FirstPageState state;


  @override
  _ThirdPageState createState() {
    return _ThirdPageState();
  }
}

class _ThirdPageState extends State<_ThirdPage> {
  _ThirdPageState() : super() {
    print(
        ">>>>>>>>>>>>>>>>   _ThirdPageState being created. Constructor called.");
  }
  int _counter = 0;

  void initState() {
    print(">>>>>>>>>>>>>>>>   _ThirdPageState initState() called.");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(">>>>>>>>>>>>>>>>   _ThirdPageState build() called!");
    return Scaffold( backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("You're on this Third page."),
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(
              ">>>>>>>>>>>>>>>>   Third page 'Floating Blue' button pressed. setState() called.");
          setState(() {
            _counter++;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      persistentFooterButtons: <Widget>[
        RaisedButton(
          child: Text(
            'New Key',
          ),
          onPressed: () {
            print(">>>>>>>>>>>>>>>>>>>>   'New Key' button pressed.");
            _key = UniqueKey();
          },
        ),
        RaisedButton(
          child: Text(
            'First Page Counter',
          ),
          onPressed: () {
            print(">>>>>>>>   'First Page Counter' button pressed.");
            widget.state.setState(() {
              widget.state._counter++;
            });
          },
        ),
        RaisedButton(
          child: Text(
            'Second Page',
          ),
          onPressed: () {
            print(">>>>>>>>>>>>   'Second Page' button pressed.");
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  void deactivate() {
    super.deactivate();
    print(">>>>>>>>>>>>>>>>   _ThirdPageState deactiviated.");
  }

  void dispose() {
    super.dispose();
    print(
        ">>>>>>>>>>>>>>>>   _ThirdPageState disposed. Counter was $_counter");
  }
}