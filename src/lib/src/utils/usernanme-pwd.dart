import 'package:flutter/material.dart';

class UsernamePwdForm extends StatefulWidget {
  @override
  _UsernamePwdState createState() => new _UsernamePwdState();
}

class _UsernamePwdState extends State<UsernamePwdForm> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text('Credentials'),
      ),
    ));
  }
}
