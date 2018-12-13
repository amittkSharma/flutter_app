import 'package:flutter/material.dart';
import '../libraries/barcode-scanner.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final List<String> codes = new List<String>();
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

  List<ListTile> generateListTiles() {
    var list = new List<ListTile>();
    for (var key in widget.codes) {
      var tile = new ListTile(
        title: new Text(key),
        subtitle: new Text(new DateTime.now().toString()),
      );

      list.add(tile);
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Text(widget.codes.length.toString()),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.camera),
              tooltip: 'Camera Open!',
              onPressed: () => onCameraClicked(context)),
        ],
      ),
      body: Center(
        child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new ListView(children: generateListTiles())),
      ),
    );
  }
}
