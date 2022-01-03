import 'package:flutter/material.dart';

void themeOf() => runApp(ProductiveApp());

class ProductiveApp extends StatefulWidget {
  @override
  _ProductiveAppState createState() => _ProductiveAppState();
}

class _ProductiveAppState extends State<ProductiveApp> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: isDarkTheme ? darkTheme : lightTheme,
      home: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ThemeTest(),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    isDarkTheme = !isDarkTheme;
                  });
                },
                child: Text(isDarkTheme ? "Use Light" : "Use Dark"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ThemeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "Title",
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          "Headline",
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          "Subhead",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          "Button",
          style: Theme.of(context).textTheme.button,
        ),
        Text(
          "Caption",
          style: Theme.of(context).textTheme.caption,
        ),
        Text(
          "Body1",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          "Body2",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}

var lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  textTheme: lightTextTheme,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: const IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);

var darkTheme = ThemeData(
  textTheme: darkTextTheme,
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: const IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

var lightTextTheme = const TextTheme(
  subtitle1: TextStyle(fontSize: 30, color: Colors.green),
  bodyText1: TextStyle(fontSize: 30, color: Colors.green),
  headline1: TextStyle(fontSize: 30, color: Colors.green),
  headline2: TextStyle(fontSize: 30, color: Colors.indigoAccent),
);

var darkTextTheme = const TextTheme(
  subtitle1: TextStyle(fontSize: 30, color: Colors.grey),
  bodyText1: TextStyle(fontSize: 30, color: Colors.grey),
  headline1: TextStyle(fontSize: 30, color: Colors.grey),
  headline2: TextStyle(fontSize: 30, color: Colors.yellow),
);
