//@ https://www.filledstacks.com/post/flutter-dependency-injection-a-beginners-guide/
//# Dependency injection Using
//# Pass through Constructor
//# InheritedWidget
//# Get-It
//# Provider
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

//# INJECTED CLASS: Which needed to be Injected as Dependancy OR Passed Around
class InfoObject { String get welcomeMessage => 'Hello From Dependancy Injection';}

//# INHERITEDWIDGET: Used for Injecting above InfoObject to decedents
class InheritedInjection extends InheritedWidget {
  final InfoObject _infoObject = InfoObject();
  final Widget child;

  InheritedInjection({Key key, this.child}) : super(key: key, child: child);

  InfoObject get infoObject => _infoObject;

  static InheritedInjection of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType()as InheritedInjection);
  }

  @override
  bool updateShouldNotify( InheritedInjection oldWidget) { return true;}
}

//# Get_It: Package for Injecting InfoObject to decedents, Simple Service Locator can
//#  be used instead of InheritedWidget or Provider to access objects e.g. inside UI
//# Documentation: https://pub.dev/documentation/get_it/latest/
//# EXAMPLE:
//# final getIt = GetIt.instance;
//# locator.registerFactory<RESTAPI>(() =>RestAPIImplementation());
//# locator.registerSingleton<AppModel>(AppModelImplementation());
//# locator.registerLazySingleton<RESTAPI>(() =>RestAPIImplementation());
final GetIt locator = GetIt.instance;
void setServiceLocator() { 
  locator.registerSingleton<InfoObject>(InfoObject());
  // getIt.registerSingleton<AppModel>(AppModel());
}

//# Doc: https://pub.dev/documentation/provider/latest/
//# PROVIDER: A generic implementation of InheritedWidget. It allows to expose
//# any kind of object, without having to manually write an InheritedWidget
void di() { setServiceLocator(); runApp(MyApp()); }

class MyApp extends StatelessWidget {
  final InfoObject infoObjectPassed;
  MyApp({Key key, this.infoObjectPassed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InheritedInjection(
      child: Provider(
        create: (context) => InfoObject(),
        child: MaterialApp(
          title: 'Dependency Injection',
          theme: ThemeData( primarySwatch: Colors.blue,),
          home: Scaffold( body: HomeView(),),
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);
  @override
 Widget build(BuildContext context) { return LikeButton();}
}

class LikeButton extends StatelessWidget {
  const LikeButton({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // var objectInfoInherited = InheritedInjection.of(context)._infoObject;
    // var objectInfoInherited = InheritedInjection.of(context).infoObject;
    var objectInfoProvider = Provider.of<InfoObject>(context); 
    return Center(child: Container( child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Text(objectInfoInherited.welcomeMessage),
        Text(objectInfoProvider.welcomeMessage),
        Text(locator<InfoObject>().welcomeMessage),
      ],
    ),));
  }
}