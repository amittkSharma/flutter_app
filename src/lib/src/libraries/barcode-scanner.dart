import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';

class AppBarcodeScanner {
  Future<String> startBarcodeScanner() async {
    try {
      String barcode = await BarcodeScanner.scan();
      return barcode;
    } catch (e) {
      throw new Error();
    }
  }
}
