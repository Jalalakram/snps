//@ https://gist.github.com/jtlapp   Joe Lapp Counter Experiments
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';

void counter01() {
  runApp(Counter());
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( primarySwatch: Colors.blue, backgroundColor: Colors.grey),

      //# Impelmentation using SetState
      // home: SetState(),
    
      //# Impelmentation using Stream/Sink
      // home: UsingStream00(),      //# Stream Simplest Example
      // home: UsingStream01(),      //# Stream setState() Example
      // home: UsingStream02(),      //# StreamBuilder Example
    
      //# Impelmentation using Inherited Widget (IW)
      // home: UsingIW_01(),
      // home: UsingIW_02(),

      //# Impelmentation using Provider
      home: UsingProvider(),

      //# Impelmentation using RxDart
      // home: UsingRxDart(),

      //# Impelmentation using BLoC
      // home: BlocProvider<IncrementBloc>( child: CounterPage(), initBloc: () => IncrementBloc(),),

    );
  }
}

//---------------------------------------- SetState Implementation ----------------------------------------

//* Impelmentation using SetState
class SetState extends StatefulWidget {
  @override
  _SetStateState createState() => _SetStateState();
}

class _SetStateState extends State<SetState> {
  int _counter = 0;

  void _incrementCounter() { setState(() { _counter++; }); }
  void _decrementCounter() { setState(() { _counter--; }); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SetState version of the Counter App')),
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
             Text('Counter Implementation',), Text('$_counter', style: Theme.of(context).textTheme.headline4,), Text(' Using setState')
          ],),),
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        FloatingActionButton( onPressed: _incrementCounter, child: Icon(Icons.add),),
        FloatingActionButton( onPressed: _decrementCounter, child: Icon(Icons.remove),),
      ],)
    );
  }
}

//---------------------------------- Stream/StreamBuilder Implementation ----------------------------------
//@ https://medium.com/flutter-community/bloc-architecture-why-so-important-d9b29f06680e
//# Example 00 - Stream Simplest
class UsingStream00 extends StatefulWidget {
  UsingStream00({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UsingStream00State createState() => _UsingStream00State();
}

class _UsingStream00State extends State<UsingStream00> {
  int _counter = 0;

  StreamController<int> _counterController = new StreamController<int>();

  @override
  void dispose() {
    super.dispose();
    _counterController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream/Sink version of the Counter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Text( 'Counter Implementation'),
            new StreamBuilder(
              stream: _counterController.stream,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return new Text('${snapshot.data}', style: Theme.of(context).textTheme.headline4,);
              },
            ),
           Text( 'Using Stream Simplest'),
          ],
        ),
      ),
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        FloatingActionButton(onPressed: () => _counterController.sink.add(++_counter), child: Icon(Icons.add),),
        FloatingActionButton(onPressed: () => _counterController.sink.add(--_counter), child: Icon(Icons.remove),),
      ],)
    );
  }
}

//@ https://www.burkharts.net/apps/blog/fundamentals-of-dart-streams/
class StreamModel {
    int _counter = 0;
    StreamController _streamController = StreamController<int>();

    Stream<int> get counterUpdates => _streamController.stream;

    void incrementCounter(){ _counter++; _streamController.add(_counter); }
    void decrementCounter(){ _counter--; _streamController.add(_counter); }
}

//# Example 01 - Using Stream with setState()
class UsingStream01 extends StatefulWidget {
  @override
  _StreamState01 createState() => _StreamState01();
}

class _StreamState01 extends State<UsingStream01> {
  int _counter = 0;
  static StreamModel streamModel = StreamModel();
  StreamSubscription streamSubscription;

  @override
  void initState() {
    streamSubscription = streamModel.counterUpdates.listen((val) => setState(() { _counter = val;}));
    super.initState();
  }

  @override
  void dispose() { streamSubscription?.cancel(); super.dispose();}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream/Sink version of the Counter App')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
           Text( 'Counter Implementation'),
           Text( '$_counter', style: Theme.of(context).textTheme.headline4,),
           Text( 'Using Stream/setState()'),
          ],
        ),
      ),
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        FloatingActionButton(onPressed: streamModel.incrementCounter, child: Icon(Icons.add),), 
        FloatingActionButton(onPressed: streamModel.decrementCounter, child: Icon(Icons.remove),), 
      ],)
    );
  }
}

//# Example 02 - Using StreamBuilder
class UsingStream02 extends StatelessWidget {
  static StreamModel streamModel = StreamModel();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StreamBuilder Version of Counter'),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text('Counter Implementation'),
          StreamBuilder<int>(
            initialData: 0,
            stream: streamModel.counterUpdates,
            builder: (context, snappShot) {
              String valueAsString = 'NoData';
              if (snappShot != null && snappShot.hasData) {
                valueAsString = snappShot.data.toString();
              }
              return Text(valueAsString, style: Theme.of(context).textTheme.headline4);
          }),
          Text( 'Using StreamBuilder/StatelessWidget',),
          ],),),
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        FloatingActionButton(onPressed: streamModel.incrementCounter, child: Icon(Icons.add),),
        FloatingActionButton(onPressed: streamModel.decrementCounter, child: Icon(Icons.remove),),
      ],)
    );
  }
}

//--------------------------- InheritedWidget Implementation -----------------------------
//# Example 01 - 
//@ https://medium.com/@mnhmasum/flutter-inherited-widget-c9cc8c95c846

class InheritedCountProvider extends InheritedWidget {
  final Widget child;
  final InheritedCounter counter;

  InheritedCountProvider({this.child, this.counter})
      : super(child: child);

  static InheritedCountProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedCountProvider>();
  }

  @override
  bool updateShouldNotify(InheritedCountProvider oldWidget) {
    return true;
  }
}

class InheritedCounter {
  int count;

  InheritedCounter(this.count);

  increment() {
    count++;
  }
}

class UsingIW_01 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InheritedCountProvider(
          counter: InheritedCounter(0),
          child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InheritedCountProvider counterProvider;

  void _incrementCounter() {
    setState(() {
      counterProvider.counter.increment();
    });
  }

  @override
  Widget build(BuildContext context) {
    counterProvider = InheritedCountProvider.of(context);

    return Scaffold(
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
              '${counterProvider.counter.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//# Example 02 - 
//@ https://gist.github.com/jtlapp/f81438723e46d1c6258fce68d3d6766c

class UsingIW_02 extends StatelessWidget {
  Widget build(BuildContext context) {
    return CounterWidget(
      child: Scaffold( backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text("Page Title"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(builder: (context) {
                final inherited =
                    context.dependOnInheritedWidgetOfExactType
                        as _InheritedCount;
                return Text(
                  '${inherited.state.count}',
                  style: Theme.of(context).textTheme.headline4,
                );
              }),
              Builder(builder: (context) {
                final ancestor =
                    context.dependOnInheritedWidgetOfExactType
                        as _InheritedCount;
                return RaisedButton(
                  onPressed: () => ancestor.state.incrementCount(),
                  child: Text("Increment"),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  CounterWidget({Key key, @required this.child}) : super(key: key);

  final Widget child;

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<CounterWidget> {
  int count;

  void incrementCount() {
    setState(() {
      ++count;
    });
  }

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedCount(
      state: this,
      child: widget.child,
    );
  }
}

class _InheritedCount extends InheritedWidget {
  _InheritedCount({Key key, @required this.state, @required Widget child})
      : super(key: key, child: child);

  final _CounterState state;

  @override
  bool updateShouldNotify(_InheritedCount old) => true;
}

//------------------------------- Provider Implementation --------------------------------

class CounterProvider with ChangeNotifier {
  int count = 0;
  void increment() { ++count; notifyListeners();}
  void decrement() { --count; notifyListeners();}
}

class UsingProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterProvider>(                 //# <=== PROVIDER
      create: (context) => CounterProvider(),
      child: Scaffold(
        appBar: AppBar(title: Text("Simplest Provider - ChangeNotifier"),),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Counter Implementation'),
            Consumer<CounterProvider>(                          //# <=== DEPENDENT
              builder: (context, counter, child) => Text('${counter.count}', style: Theme.of(context).textTheme.headline4,),
            ),
            Text('Using Provider Package'),
        ],),),
      // floatingActionButton: FloatingActionButton( onPressed: (){ Provider.of<CounterProvider>(context, listen: false).decrement();}, child: Icon(Icons.remove), ),
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        //# listen: false - for non listening subscribers.
        Builder(builder: (context) {                            //# <=== DEPENDENT
          final counter = Provider.of<CounterProvider>(context, listen: false);
          return FloatingActionButton(onPressed: () => counter.increment(), child: Icon(Icons.add),);
        }),
        Builder(builder: (context) {                            //# <=== DEPENDENT
          final counter = Provider.of<CounterProvider>(context, listen: false);
          return FloatingActionButton(onPressed: () => counter.decrement(), child: Icon(Icons.remove),);
        }),
    ],),
  ),);
}}

//--------------------------------- Block_Pattern ---------------------------------------

//------------------------- Flutter_Block_Pattern Implementation ------------------------

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IncrementBloc bloc = Provider.of<IncrementBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('BLoC-Pattern version of the Counter App')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text('Counter Implementation'),
            StreamBuilder<int>(
              stream: bloc.outCounter,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                return Text('${snapshot.data}', style: Theme.of(context).textTheme.headline4,);
              }
            ),
            Text('Using Flutter Bloc Pattern'),
      ],)
      ),
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
        FloatingActionButton(child: const Icon(Icons.add), onPressed: (){bloc.incrementCounter.add('+');},),
        FloatingActionButton(child: const Icon(Icons.remove), onPressed: (){bloc.decrementCounter.add('-');},),
      ],)
    );
  }
}

class IncrementBloc implements BaseBloc {
  int _counter;

  //
  // Stream to handle the counter
  //
  StreamController<int> _counterController = StreamController<int>();
  StreamSink<int> get _inAdd => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  //
  // Stream to handle the action on the counter
  //
  StreamController<String> _actionController = StreamController<String>();
  StreamSink get incrementCounter => _actionController.sink;
  StreamSink get decrementCounter => _actionController.sink;

  //
  // Constructor
  //
  IncrementBloc(){
    _counter = 0;
    _actionController.stream.listen(_handleLogic);
  }

  void dispose(){
    _actionController.close();
    _counterController.close();
  }

  void _handleLogic(data){
    if (data == '+') {
      _counter++;
    } else {
      _counter--;
    }
    _inAdd.add(_counter);
  }
}

//--------------------------------------------- RxDart Implementation ---------------------------------------
//@ https://medium.com/flutter-community/why-use-rxdart-and-how-we-can-use-with-bloc-pattern-in-flutter-a64ca2c7c52d
//# Example 01
//# Stream/Observable
//# listen/subscribe
//# StreamController/Subject
//# item/data

class UsingRxDart extends StatelessWidget {

  final CounterBloc _counterBloc = CounterBloc(initialCount: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RxDart version of the Counter App')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text('Counter Implementation'),
          StreamBuilder(
            stream: _counterBloc.counterObservable, 
            builder: (context, AsyncSnapshot<int> snapshot){
             return Text('${snapshot.data}', style: Theme.of(context).textTheme.headline4);}
          ),
          Text('Using RxDart'),
        ],),),
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
       FloatingActionButton( onPressed: _counterBloc.increment, child: Icon(Icons.add),),
       FloatingActionButton( onPressed: _counterBloc.decrement, child: Icon(Icons.remove),),
      ])
    );
  }
}

class CounterBloc {
  int initialCount = 0;                 //# <=== Initializes with 0 If the data is not passed
  BehaviorSubject<int> _subjectCounter;

  CounterBloc({this.initialCount}) {    //# <=== Initializes the subject with element already
   _subjectCounter = BehaviorSubject<int>.seeded(this.initialCount);
  }

  // Observable<int> get counterObservable => _subjectCounter.stream; 
  BehaviorSubject<int> get counterObservable => _subjectCounter.stream; 

  void increment() { initialCount++; _subjectCounter.sink.add(initialCount); }
  void decrement() { initialCount--; _subjectCounter.sink.add(initialCount); }

  void dispose(){ _subjectCounter.close(); }
}

//# Example 02 - Using Inherited Widget
//# RxDart01.dart