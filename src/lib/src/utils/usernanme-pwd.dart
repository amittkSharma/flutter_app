import 'package:flutter/material.dart';
import './snackbar.dart';

class UsernamePwdForm extends StatefulWidget {
  @override
  _UsernamePwdState createState() => new _UsernamePwdState();
}

class _UsernamePwdState extends State<UsernamePwdForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credentials'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.supervised_user_circle),
                labelText: 'Name *',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter username';
                }
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.security),
                labelText: 'Password *',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter the password';
                }
              },
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print('Done');
                    }
                  },
                  child: Text('Submit'),
                ))
          ],
        ),
      ),
    );
  }
}
