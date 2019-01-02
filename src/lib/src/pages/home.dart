import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import '../utils/navdrawer.dart';
import './details.dart';
import './wifi-connection.dart';
import './listpage.dart';

class AppHome extends StatelessWidget {
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();

  AppHome() {}

  void addNewItemsToDrawer(AppDrawer drawer) {
    drawer.drawerItems['Barcode Page'] = DetailsPage(title: 'Barcodes');
    drawer.drawerItems['QR Page'] = DetailsPage(title: 'QRs');
    drawer.drawerItems['WiFi Devices'] = WiFiPage();
    drawer.drawerItems['Http Example'] = ListPage();
  }

  Future<String> initConnectivity() async {
    String connectionStatus;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      connectionStatus = (await _connectivity.checkConnectivity()).toString();
    } catch (e) {
      print(e.toString());
      connectionStatus = 'Failed to get connectivity.';
    }

    print('....$connectionStatus');
    return connectionStatus;
  }

  @override
  Widget build(BuildContext context) {
    var appDrawer = new AppDrawer();
    addNewItemsToDrawer(appDrawer);
    return Scaffold(
      drawer: appDrawer,
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: FutureBuilder<String>(
        future: initConnectivity(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print('Error $snapshot.error');

          return snapshot.hasData
              ? Center(child: Text(snapshot.data))
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
