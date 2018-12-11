import 'package:flutter/material.dart';
import './libraries/barcode-scanner.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  List<String> codes = new List<String>();
  DetailsPage({this.title});

  @override
  _AppDetailsPage createState() => new _AppDetailsPage();
}

class _AppDetailsPage extends State<DetailsPage> {
  void onCameraClicked(BuildContext context) {
    AppBarcodeScanner().startBarcodeScanner().then((v) {
      print('scanned code is: $v');
      setState(() {
        widget.codes.add(v);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.camera),
              tooltip: 'Camera Open!',
              onPressed: () => this.onCameraClicked(context)),
        ],
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(widget.codes.length.toString()),
        ),
      ),
    );
  }
}
