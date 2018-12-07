import 'package:flutter/material.dart';

class AppHome extends StatelessWidget {
  void onCameraClicked(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Yay !, A camera is clicked'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () => print('Close the snack bar from the button'),
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('QRs List'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.camera),
              tooltip: 'Camera Open!',
              onPressed: () => this.onCameraClicked(context)),
        ],
      ),
    );
  }
}
