import 'package:flutter/material.dart';

class AppSnackbar {
  appShowSnackBar(BuildContext context, String message, String btnText) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: btnText,
        onPressed: () => print('Close the snack bar from the button'),
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
