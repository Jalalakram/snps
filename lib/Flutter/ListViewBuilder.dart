import 'package:flutter/material.dart';

void listViewBuilder() => runApp(WorkingWithLongList());

class WorkingWithLongList extends StatelessWidget {
  // const WorkingWithLongList({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Working With Long List",
      // debugshowCheckedModeBanner: flase,
      home: Scaffold(
        backgroundColor: Colors.grey[500],
        appBar: AppBar(title: Text(":ong List")),
        body: getListview(),
      ),
    );
  }
}

//
 dataSource() {
  var items = List<String>.generate(500, (i) => "Item $i");
  return items;
}

Widget getListview() {
  List<String> allItems = dataSource();
  var listView = ListView.builder(
    itemCount: allItems.length,
    itemBuilder: (context, index){
      return ListTile(
        leading: Icon(Icons.ac_unit),
        title: Text(allItems[index]),
        subtitle: Text(allItems[index]),
        isThreeLine: true,
        dense: true,
        trailing: Icon(Icons.account_balance),
        enabled: true,
        onTap: () {
          // Scaffold.of(context).showBodyScrim(true, 2.0);
          
          Scaffold.of(context).showSnackBar( SnackBar( content: Text("Again Out of Den"), ));
          // Scaffold.of(context).showBottomSheet(
          //       (context) => Container(
          //             constraints: BoxConstraints.expand(height: 100),
          //             color: Colors.indigoAccent,
          //           ),
          // );
        },
      );
    }
  );
  return listView;
}