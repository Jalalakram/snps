import 'package:flutter/material.dart';

// void routing() => runApp(MaterialApp(home: PushPopFirst(),));
// void routing() => runApp(MaterialApp(home: FirstPage()));
void routing() => runApp(NamedRouting());

//----------------------------------- PUSH/POP Witout Name Routing ------------------------------------
//# Example 01 - Stateful Method Call
//@ Video Tutorial Link: https://www.youtube.com/watch?v=Q30Vh-xKRf4
class PushPopFirst extends StatefulWidget {
  @override
  _PushPopFirstState createState() => _PushPopFirstState();
}

class _PushPopFirstState extends State<PushPopFirst> {
  String returnedFromPop;

  void _goToSecond() async {returnedFromPop = await Navigator.push(context, MaterialPageRoute(
    builder: (context) => PushPopSecond(passedString: 'Hello from First',)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Stateful Routing Instance Response'),),
      body: Center(child: Column(mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          //# Enable following to use _goToSecond method above
          RaisedButton(child: Text('Go to Second'), onPressed: _goToSecond,),

          //# Enable to use following inline code instead
          // RaisedButton(child: Text('Push'),onPressed: () async{
          //   returnedFromPop = await Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => PushPopSecond(passedString: 'Hello from First')));}),

          Text("$returnedFromPop")

        ],
      ),),);}
}

class PushPopSecond extends StatefulWidget {
  final String passedString;

  //# PushPopSecond({Key key, @required this.passedString}): super(key: key); //# Full Constructor
  PushPopSecond({this.passedString});                                         //# Small Constructor

  @override
  _PushPopSecondState createState() => _PushPopSecondState();
}

class _PushPopSecondState extends State<PushPopSecond> {
  void _goBack()  {Navigator.pop(context, 'Pop Returned:\n' + DateTime.now().toString());}

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Stateful Routing')),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Text(widget.passedString),
          RaisedButton(child: Text('Pop Back'), onPressed: _goBack,),

        ],
)),);}}

//# Example 02 - Stateless - Response not work properly due to
//# immutable varible returnedFromSecond doen't get update.
//@ https://resocoder.com/2019/04/27/flutter-routes-navigation-parameters-named-routes-ongenerateroute/
class FirstPage extends StatelessWidget {
  String returnedFromSecond;    //# immutable variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.brown,
      appBar: AppBar(title: Text('Stateless Routing lagging Response'),),
      body: Center(child: Column(mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          
          Text('First Page',style: TextStyle(fontSize: 30),),
          RaisedButton(child: Text('Go to second'),onPressed: () async{
              returnedFromSecond = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SecondPage(data: 'Hello from First'),
          ),);},),
          Text("$returnedFromSecond"),

],),),);}}

class SecondPage extends StatelessWidget {
  final String data;

  SecondPage({Key key, @required this.data,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.brown,
      appBar: AppBar(title: Text('Stateless Routing'),),
      body: Center(child: Column(mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Text('Second Page', style: TextStyle(fontSize: 30),),
          RaisedButton(child: Text('Go Back First'), onPressed: () {
            Navigator.pop(context, 'Second Returned:\n' + DateTime.now().toString());
          },),
          Text(data),

],),),);}}

//------------------------------------- Named Routing w/t Arguments -----------------------------------
//@ https://www.youtube.com/watch?v=Q30Vh-xKRf4
class NamedRouting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        final arguments = settings.arguments;
        switch (settings.name) {
          case '/second':
            return MaterialPageRoute(
              builder: (context) => NamedRoutingSecond(
                arguments: arguments,
              ),
            );
            break;
          default:
            return null ;
            break;
        }
      },
      initialRoute: '/',
      routes: {
        '/': (context) => NamedRoutingFirst(),
      },
    );
  }
}

class NamedRoutingFirst extends StatefulWidget {
  @override
  _NamedRoutingFirstState createState() => _NamedRoutingFirstState();
}

class _NamedRoutingFirstState extends State<NamedRoutingFirst> {
  Object returnedFromSecond;

  void _goToSecond() async {
    returnedFromSecond = await Navigator.pushNamed(context, '/second',
        arguments: SecondArguments(passedString: "from arguments", aText: Text("hello everybody")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home"),),
      body: Center(child: Column(
          children: <Widget>[
            RaisedButton(child: Text("Go To Second"), onPressed: _goToSecond,),
            Text("$returnedFromSecond")
],),),);}}

class SecondArguments {
  final String passedString;
  final Text aText;

  SecondArguments({this.passedString, this.aText});
}

class NamedRoutingSecond extends StatefulWidget {
  final SecondArguments arguments;

  NamedRoutingSecond({this.arguments,});
  @override
  _NamedRoutingSecondState createState() => _NamedRoutingSecondState();
}

class _NamedRoutingSecondState extends State<NamedRoutingSecond> {
  void _goBack() {Navigator.pop(context, "hello from second page");}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("second"),),
      body: Center(child: Column(
          children: <Widget>[
            RaisedButton(child: Text("Go Back"), onPressed: _goBack,),
            Text(widget.arguments.passedString),
            widget.arguments.aText,
],),),);}}

//------------------------------------------- Named Routing -------------------------------------------