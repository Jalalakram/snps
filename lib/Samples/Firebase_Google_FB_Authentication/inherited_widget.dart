import 'package:flutter/material.dart';
import 'auth_api.dart';

class AuthInheritedProvider extends InheritedWidget {
  final BaseAuth auth;

  const AuthInheritedProvider({
    Key key,
    Widget child,
    this.auth,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static AuthInheritedProvider of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<AuthInheritedProvider>());
}
