import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => new _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: new ListView(
      children: <Widget>[
        DrawerHeader(
          child: new Text('App Header....'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: new Text('Item 1'),
          onTap: () => print('Item 1'),
        ),
        ListTile(
          title: new Text('Item 2'),
          onTap: () => print('Item 2'),
        ),
        ListTile(
          title: new Text('Item 3'),
          onTap: () => print('Item 3'),
        )
      ],
    ));
  }
}
