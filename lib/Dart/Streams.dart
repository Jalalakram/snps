///# Define stream at one place,
///# Add data to it at some other place and
///# Listen to this data addition elsewhere.

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void streams() {
runApp(StreamScreen());                     //# Stream Generator
  // singleSubscriptionStreamController();  //# Single Subscription
  // broadcastStreamController();           //# Broadcast
}

//------------------------------------- Single Subscription Stream ------------------------------------------
singleSubscriptionStreamController() async*{

  //# To create a Stream you have to create a StreamController
  final StreamController oController = StreamController();
  
  //# Listen() Returns a StreamSubscription
  final StreamSubscription subscription =
    oController.stream.listen((someData) => print('$someData'));
  
  //# Implicit Subscription
  oController.stream.listen((someData) => print('$someData'));

  //* Add the data that will flow inside the stream
  oController.sink.add('my name');
  oController.sink.add(1234);
  oController.sink.add({'a': 'element A', 'b': 'element B'});
  oController.sink.add(123.45);
  oController.sink.add(new Error());

  //# Calling cancel() Frees the Subscription
  // This is to prevent the testing framework from killing this process 
  // before all items from the Stream have been taken care of
  await Future.delayed(Duration(milliseconds: 500));
  subscription.cancel();
  oController.close();
}

//------------------------------------------ Broadcast Stream -----------------------------------------------
void broadcastStreamController() {

  //# To create a Stream you have to create a StreamController
  final StreamController<int> oController = StreamController<int>.broadcast();

  oController.stream
  .where((val) => (val % 2 == 0))
  .map((val) => ((val * 10)/val))
  .listen((val) => print('$val' + '...transformed'))
  .cancel();

  //# Implicit Subscription
  oController.stream.listen((val) => print(val));

  //* Add the data that will flow inside the stream
  for (int i = 0; i <= 10; i++) { oController.sink.add(i); }

  //# Todo onError()

  //# Todo onDone()

  //# Calling cancel() Frees the Subscription
  oController.close();
}

//----------------------------------------------- Stream Builder --------------------------------------------
//ToDo: Implement StreamBuilder

//-----------------------------------------------------------------------------------------------------------
class StreamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamData(),
    );
  }
}

class StreamData extends StatefulWidget {
  @override
  _StreamDataState createState() => _StreamDataState();
}

class _StreamDataState extends State<StreamData> {
  StreamSubscription<Item> _subscription;
  StreamController<Item> _controller;
  Stream<Item> _stream;
  Timer _timer;

  List<Item> _values = [];

  Widget _fab = Icon(Icons.pause);

  @override
  void initState() {
    super.initState();
    _streamRepeater();
    _subscribe();
  }

  void _streamRepeater() {
    _controller = StreamController(
        onListen: _sendData,
        onResume: _sendData,
        onPause: _cancelData,
        onCancel: _cancelData);
    _stream = _controller.stream;
  }

  void _sendData() {
    setState(() => _fab = Icon(Icons.pause));
    _timer = Timer.periodic(Duration(seconds: 1), (next) {
      final color = ColorGenerator.color;
      final number = Random().nextInt(100);
      setState(() => _controller.add(Item(color, number)));
    });
  }

  void _cancelData() {
    if (_timer != null) {
      setState(() => _fab = Icon(Icons.play_arrow));
      _timer.cancel();
      _timer = null;
    }
  }

  void _subscribe() {
    _subscription = _stream.listen((result) {
      _values.insert(0, result);
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Stream')),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (context, index) {
          final value = _values[index];
          return Container(
            height: 100,
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: value.color,
              // shadowColor: value.color,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.centerLeft,
                children: [
                  Positioned(
                    left: 28,
                    child: Text('${value.number}',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: _values.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _subscription.isPaused
            ? _subscription.resume()
            : _subscription.pause(),
        child: _fab,
      ),
    );
  }
}

class Item {
  final Color color;
  final int number;

  Item(this.color, this.number);
}

class ColorGenerator {
  static Random random = Random();

  static Color get color => Color.fromARGB(
      255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
}