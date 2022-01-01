import 'package:flutter/material.dart';

void inheritedWidget01() => runApp(MyApp());

//# STEP-01 Implementing InheritedWidget
class DataHolderAndProvider extends InheritedWidget{
  final data;

  DataHolderAndProvider({this.data, Widget child}):super (child:child);

  @override
  bool updateShouldNotify(DataHolderAndProvider oldWidget) {
    return data!=oldWidget.data;
  }

  static DataHolderAndProvider of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: Scaffold(backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('InheritedWidget Data Holder/Provider'),),
      body: Center(
        //# STEP-02 Use InheritedWidget as a root widget
        child: DataHolderAndProvider(
        //# STEP-03 Set Data in InderitedWidget
          data: ['Coding','Hive'],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FirstName(),
              SecondName(),
              FullName()
            ],
          ),
        ),
),));}}

//# STEP-04 Get data in child widget
class FirstName extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final data=DataHolderAndProvider.of(context).data;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: <Widget>[Text('First Name: ${data[0]}'),],),
);}}

//# STEP-04 Get data in child widget
class SecondName extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final data=DataHolderAndProvider.of(context).data;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: <Widget>[Text('Second Name: ${data[1]}'),],),
);}}

//# STEP-04 Get data in child widget
class FullName extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final data=DataHolderAndProvider.of(context).data;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: <Widget>[Text('Full Name : ${data[0]} ${data[1]}'),],),
);}}