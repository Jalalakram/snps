/// Get_It package - Dependency Injection with Service Locator Pattern in Flutter & Dart
/// https://www.youtube.com/watch?v=DbV5RV2HRUk
/// https://github.dev/md-weber/get_it_tutorial

//! require explain get_it, has redundent hhtp and pojo object etc., need improve

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

// void get_it() => runApp(MyApp());
void main() {
  setup();
  runApp(MyApp());
}

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<MemeRepo>(
    () => MemeRepo(),
  );
  getIt.registerLazySingleton<MemeDomainController>(
    () => MemeDomainController(),
  );
}

class Meme {
  final int id;
  final String imageUrl;
  final String caption;
  final String category;

  Meme(this.id, this.imageUrl, this.caption, this.category);

  Meme.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        imageUrl = json["image"],
        caption = json["caption"],
        category = json["category"];
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageView(),
    );
  }
}

class MemeRepo {
  Future<Meme> getMeme() async {
    http.Response response = await http.get(Uri.parse('https://some-random-api.ml/meme'));
    
    Map<String, dynamic> singleMemeJson = jsonDecode(response.body);
    return Meme.fromJson(singleMemeJson);
  }
}

class MemeDomainController {
  getNextMeme() async {
    // TODO: Call the Repository and receive a meme
    return await getIt.get<MemeRepo>().getMeme();
  }
}

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  Meme visibleMeme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: visibleMeme != null
            ? Center(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Category ${visibleMeme.category}",
                          style: TextStyle(fontSize: 36),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Image.network(visibleMeme.imageUrl),
                        ),
                        SizedBox(height: 8),
                        Text("Caption: ${visibleMeme.caption}"),
                      ],
                    ),
                  ),
                ),
              )
            : Center(child: Text("No Meme loaded yet")),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.skip_next),
        onPressed: () async {
          Meme meme = await getIt.get<MemeDomainController>().getNextMeme();

          setState(() {
            visibleMeme = meme;
          });
        },
      ),
    );
  }
}