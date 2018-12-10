import 'package:flutter/material.dart';
import './utils/snackbar.dart';
import './utils/navdrawer.dart';

class AppHome extends StatelessWidget {
  void onCameraClicked(BuildContext context) {
    var appSnackbar = new AppSnackbar();
    appSnackbar.appShowSnackBar(context, 'Camera Button is clicked...', 'Undo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new AppDrawer(),
      appBar: AppBar(
        title: Text('QRs List'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.camera),
              tooltip: 'Camera Open!',
              onPressed: () => this.onCameraClicked(context)),
        ],
      ),
      body: Center(child: Text('My Page!')),
    );
  }
}
