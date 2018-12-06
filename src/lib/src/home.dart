import 'package:flutter/material.dart';

class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('Welcome to the home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.camera),
            tooltip: 'Camera Open!',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
