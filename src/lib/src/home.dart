import 'package:flutter/material.dart';
import './utils/navdrawer.dart';
import './details.dart';

class AppHome extends StatelessWidget {
  void addNewItemsToDrawer(AppDrawer drawer) {
    drawer.drawerItems['QR Details Page'] = DetailsPage(title: 'QR Details');
    drawer.drawerItems['Barcode Details Page'] =
        DetailsPage(title: 'Barcode Details');
    drawer.drawerItems['Misc Details Page'] =
        DetailsPage(title: 'Misc Details');
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
      body: Center(child: Text('My Page!')),
    );
  }
}
