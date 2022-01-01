import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void provider01() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Followed(),
      child: MaterialApp(home: HomeScreen(),),
);}}

class HomeScreen extends StatelessWidget {
  ListTile eachTile(Followed followed, String name, String initials) {
    return ListTile(
      title: Text(name, style: TextStyle(color: Colors.white70)),
      leading: CircleAvatar(child: Text(initials),),
      trailing: IconButton(
        icon: (followed.followedList.contains(name))
          ? Icon(Icons.check, color: Colors.white70,)
          : Icon(Icons.add, color: Colors.white70,),
        onPressed: () {
          if (followed.followedList.contains(name)) {
            followed.remove(name);
          } else {
            followed.add(name);
          }
        },
  ),);}

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[800],
      appBar: AppBar(title: Text("Provider"), centerTitle: true, actions: <Widget>[
          FlatButton(
            child: Text("next", style: TextStyle(color: Colors.white),),
            onPressed: () {Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),);
          }),],),
      body: Consumer<Followed>(
        builder: (BuildContext context, Followed value, Widget child) {
          return ListView(
            children: <Widget>[
              eachTile(value, "Elon Musk", "EM"),
              eachTile(value, "Kanye West", "KW"),
              eachTile(value, "Kim Kardashian", "KK"),
              eachTile(value, "Kobe Bryant", "KB"),
              eachTile(value, "Tom Hanks", "TH"),
              eachTile(value, "Lebron James", "LJ"),
              eachTile(value, "Michael Jordan", "MJ"),
              eachTile(value, "Joe Rogan", "JR"),
              eachTile(value, "Selena Gomez", "SG"),
              eachTile(value, "Oprah Winfrey", "OW"),
],);},),);}}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[800],
        appBar: AppBar(title: Text("Profile"), centerTitle: true,),
        body: Consumer<Followed>(
          builder: (BuildContext context, Followed value, Widget child) {
            return ListView.builder(
              itemCount: value.followedList.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding( padding: EdgeInsets.all(40.0),
                    child: Text("You are followed:", style: TextStyle(color: Colors.white70),),
                  );
                } else {
                  return Center(
                    child: Text(value.followedList[index - 1], style: TextStyle(color: Colors.white70),),
                  );
                }
              });
},));}}

class Followed extends ChangeNotifier {
  final List<String> _followedList = [];
  List<String> get followedList => _followedList;

  add(String name) {
    _followedList.add(name);
    notifyListeners();
  }

  remove(String name) {
    _followedList.removeWhere((element) => element == name);
    notifyListeners();
  }
}