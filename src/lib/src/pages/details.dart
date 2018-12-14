import 'package:flutter/material.dart';
import '../libraries/barcode-scanner.dart';
import '../interfaces/IBarcode.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final List<Barcode> codes = new List<Barcode>();
  DetailsPage({this.title});

  @override
  _AppDetailsPage createState() => new _AppDetailsPage();
}

class _AppDetailsPage extends State<DetailsPage> {
  void onCameraClicked(BuildContext context) {
    AppBarcodeScanner().startBarcodeScanner().then((obtainedCode) {
      var newCode = new Barcode();
      newCode.code = obtainedCode;
      newCode.timeStamp = new DateTime.now().toLocal();
      setState(() {
        widget.codes.add(newCode);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title + ' (' + widget.codes.length.toString() + ')'),
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
            child: new ListView.separated(
              separatorBuilder: (context, index) => Divider(
                    color: Colors.red,
                  ),
              itemCount: widget.codes.length,
              itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(widget.codes[index].code),
                      subtitle: Text(widget.codes[index].timeStamp.toString()),
                    ),
                  ),
            )),
      ),
    );
  }
}
