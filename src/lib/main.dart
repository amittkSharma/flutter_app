import 'package:flutter/material.dart';
import './src/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home page'),
        ),
        body: AppHome(),
      ),
    );
  }
}
