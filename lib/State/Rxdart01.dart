//# Why use RxDart and how we can use with BLoC Pattern in Flutter?
//@ https://medium.com/flutter-community/why-use-rxdart-and-how-we-can-use-with-bloc-pattern-in-flutter-a64ca2c7c52d

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void rxdart01() => runApp(MyHomePage());

/// Using a StatefulWidget to Release the StreamController, via the dispose method
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String  title = 'RxDart/BLoC Implementation of the Counter App';

  final CounterBloc _counterBloc = CounterBloc(initialCount: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('RxDart: You have pushed the button this many times:'),
              StreamBuilder<int>(
                stream: _counterBloc.counterObservable,
                initialData: 0,
                builder: (context, AsyncSnapshot<int> snapshot){
                return Text('${snapshot.data}', style: Theme.of(context).textTheme.headline4);
                }
              )
            ],
          ),
        ),
        floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
          FloatingActionButton(onPressed:  _counterBloc.increment, child: Icon(Icons.add),),
          FloatingActionButton(onPressed: _counterBloc.decrement, child: Icon(Icons.remove),),
        ],)
      ),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}

class CounterBloc {
  int initialCount = 0;
  BehaviorSubject<int> _subjectCounter;

  CounterBloc({this.initialCount}){
   _subjectCounter = BehaviorSubject<int>.seeded(this.initialCount); //initializes the subject with element already
  }

  Stream<int> get counterObservable => _subjectCounter.stream; 

  void increment(){
    initialCount = initialCount +2;
    _subjectCounter.sink.add(initialCount);
  }

  void decrement(){
    initialCount--;
    _subjectCounter.sink.add(initialCount);
  }

  void dispose(){
    _subjectCounter.close();
  }
  
}