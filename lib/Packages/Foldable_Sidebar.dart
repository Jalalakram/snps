//@ https://www.youtube.com/watch?v=XBwB5BGBD8Y

// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';

void foldableSidebar() { runApp(MyApp()); }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FSBStatus drawerStatus;

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(

        body: FoldableSidebarBuilder(
          drawerBackgroundColor: Colors.deepOrange,
          drawer: CustomDrawer(closeDrawer: (){
            setState(() {
              drawerStatus = FSBStatus.FSB_CLOSE;
            });
          },),
          screenContents: FirstScreen(),
          status: drawerStatus,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrange,
            child: const Icon(Icons.menu,color: Colors.white,),
            onPressed: () {
              setState(() {
                drawerStatus = drawerStatus == FSBStatus.FSB_OPEN ? FSBStatus.FSB_CLOSE : FSBStatus.FSB_OPEN;
              });
            }),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withAlpha(200),
      child: const Center(child: Text("Click on FAB to Open Drawer",style: TextStyle(fontSize: 20,color: Colors.white),),),
    );
  }
}


class CustomDrawer extends StatelessWidget {

  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withAlpha(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.settings, size: 100,),
                  SizedBox(
                    height: 10,
                  ),
                  Text("RetroPortal Studio")
                ],
              )),
          ListTile(
            onTap: (){
              debugPrint("Tapped Profile");
            },
            leading: const Icon(Icons.person),
            title: const Text(
              "Your Profile",
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped settings");
            },
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Payments");
            },
            leading: const Icon(Icons.payment),
            title: const Text("Payments"),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Notifications");
            },
            leading: const Icon(Icons.notifications),
            title: const Text("Notifications"),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Log Out");
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Log Out"),
          ),
        ],
      ),
    );
  }
}



