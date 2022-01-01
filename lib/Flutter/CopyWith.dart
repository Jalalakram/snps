//@ https://medium.com/better-programming/what-is-the-copywith-operation-in-flutter-2567e4d924bf
import 'package:flutter/material.dart';

void copyWith() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Register Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(primaryColor: Colors.green),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: kTextFieldDecoration,
                textAlign: TextAlign.center,
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(primaryColor: Colors.green),
              child: TextField(
                obscureText: true,
                decoration: kTextFieldDecoration.copyWith(
                    icon: Icon(Icons.vpn_key),
                    hintText: 'Password',
                    labelText: 'Password'),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              color: Colors.green,
              textColor: Colors.white,
              child: Text('Register'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

const kTextFieldDecoration = InputDecoration(
  hintText: 'example@email.com',
  icon: Icon(Icons.email),
  labelText: 'Email',
  labelStyle: TextStyle(color: Colors.green),
);