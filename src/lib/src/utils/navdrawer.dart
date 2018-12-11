import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  final List<StatelessWidget> screens = [];

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
          title: new Text('QRs'),
          onTap: () => print('Item 1'),
        ),
        ListTile(
          title: new Text('Barcodes'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.screens[0]),
            );
          },
        ),
        ListTile(
          title: new Text('Others'),
          onTap: () => print('Item 3'),
        )
      ],
    ));
  }
}
