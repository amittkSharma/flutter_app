import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  final Map<String, StatefulWidget> drawerItems = new Map();

  @override
  _AppDrawerState createState() => new _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List<ListTile> generateListTiles(Map<String, StatefulWidget> drawerItems) {
    var list = new List<ListTile>();
    for (var key in drawerItems.keys) {
      var tile = new ListTile(
          title: new Text(key),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => drawerItems[key]),
            );
          });

      list.add(tile);
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: new ListView(children: generateListTiles(widget.drawerItems)));
  }
}
