import 'package:flutter/material.dart';

typedef void OnPressedEventFn();

class AppSnackbar {
  appShowSnackBar(BuildContext context, String message, String btnText,
      OnPressedEventFn f) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: btnText,
        onPressed: f,
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
