import 'package:flutter/material.dart';
import '../utils/navdrawer.dart';
import './details.dart';
import './wifi-connection.dart';
import './listpage.dart';

class AppHome extends StatelessWidget {
  void addNewItemsToDrawer(AppDrawer drawer) {
    drawer.drawerItems['Barcode Page'] = DetailsPage(title: 'Barcodes');
    drawer.drawerItems['QR Page'] = DetailsPage(title: 'QRs');
    drawer.drawerItems['WiFi Devices'] = WiFiPage();
    drawer.drawerItems['Http Example'] = ListPage();
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
      body: Center(child: Text('Landing Page...')),
    );
  }
}
