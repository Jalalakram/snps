/// https://www.youtube.com/watch?v=OlcYP6UXlm8
/// Live Coding Firebase/Google/Facebook Authentication with Flutter

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'inherited_widget.dart';
import 'auth_api.dart';
import 'validators.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthInheritedProvider(
      auth: Auth(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Auth auth = AuthInheritedProvider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool loggedIn = snapshot.hasData;
          if (loggedIn == true) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Page'),
        actions: <Widget>[
          FlatButton(
            child: const Text("Sign Out"),
            onPressed: () async {
              try {
                Auth auth = AuthInheritedProvider.of(context).auth;
                await auth.signOut();
              } catch (e) {
                print(e);
              }
            },
          )
        ],
      ),
      body: const Center(
        child: Text('Welcome'),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  String _email, _password;
  FormType _formType = FormType.login;

  bool validate() {
    final form = formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void submit() async {
    if (validate()) {
      try {
        final auth = AuthInheritedProvider.of(context).auth;
        if (_formType == FormType.login) {
          String userId = await auth.signInWithEmailAndPassword(
            _email,
            _password,
          );

          print('Signed in $userId');
        } else {
          String userId = await auth.createUserWithEmailAndPassword(
            _email,
            _password,
          );

          print('Registered in $userId');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  void switchFormState(String state) {
    formKey.currentState.reset();

    if (state == 'register') {
      setState(() {
        _formType = FormType.register;
      });
    } else {
      setState(() {
        _formType = FormType.login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...buildInputs(),
              ...buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    return [
      TextFormField(
        validator: EmailValidator.validate,
        decoration: const InputDecoration(labelText: 'Email'),
        onSaved: (value) => _email = value,
      ),
      TextFormField(
        validator: PasswordValidator.validate,
        decoration: const InputDecoration(labelText: 'Password'),
        obscureText: true,
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildButtons() {
    if (_formType == FormType.login) {
      return [
        RaisedButton(
          child: const Text('Login'),
          color: Colors.blueAccent,
          onPressed: submit,
        ),
        FlatButton(
          child: const Text('Register Account'),
          color: Colors.teal,
          onPressed: () {
            switchFormState('register');
          },
        ),
        const Divider(
          height: 50.0,
        ),
        FlatButton(
          child: const Text("Sign in with Google"),
          color: Colors.lightGreen,
          onPressed: () async {
            try {
              final _auth = AuthInheritedProvider.of(context).auth;
              final id = await _auth.signInWithGoogle();
              print('signed in with google $id');
            } catch (e) {
              print(e);
            }
          },
        ),
        FlatButton(
          child: const Text('Sign in with Facebook'),
          color: Colors.lightBlue,
          onPressed: () async {
            try {
              final _auth = AuthInheritedProvider.of(context).auth;
              final id = await _auth.signInWithFacebook();
              print('signed in with facebook $id');
            } catch (e) {
              print(e);
            }
          },
        )
      ];
    } else {
      return [
        RaisedButton(
          child: const Text('Create Account'),
          color: Colors.blueAccent,
          onPressed: submit,
        ),
        FlatButton(
          child: const Text('Go to Login'),
          color: Colors.teal,
          onPressed: () {
            switchFormState('login');
          },
        )
      ];
    }
  }
}