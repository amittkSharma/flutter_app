import 'package:flutter/material.dart';
import './utils/snackbar.dart';
import './utils/navdrawer.dart';
import './details.dart';

class AppHome extends StatelessWidget {
  void onCameraClicked(BuildContext context) {
    var appSnackbar = new AppSnackbar();
    appSnackbar.appShowSnackBar(context, 'Camera Button is clicked...', 'Undo');
  }

  @override
  Widget build(BuildContext context) {
    var appDrawer = new AppDrawer();
    appDrawer.screens.add(DetailsPage());
    return Scaffold(
      drawer: appDrawer,
      appBar: AppBar(
        title: Text('Home Page'),
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
