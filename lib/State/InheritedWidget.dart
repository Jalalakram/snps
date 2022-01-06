import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final String name;
  /// final BaseAuth auth;  // could be any object of class

  const Provider({
    Key key,
    Widget child,
    this.name,
    /// this.auth,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  /// deprecated: inheritFromWidgetOfExactType
  ///   static Provider of(BuildContext context) =>
  ///      (context.inheritFromWidgetOfExactType(Provider) as Provider);
 
  /// Use dependOnInheritedWidgetOfExactType and 
  /// instead of taking a Type as argument, the method is generic
  /// Brief <...>() instead of (...) as ...
    static Provider of(BuildContext context) =>
        context.dependOnInheritedWidgetOfExactType<Provider>();

  
}