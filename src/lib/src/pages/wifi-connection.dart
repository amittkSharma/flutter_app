import 'package:flutter/material.dart';
import 'package:wifi/wifi.dart';
import '../interfaces/IWifiConnection.dart';

class WiFiPage extends StatefulWidget {
  @override
  _WiFiState createState() => new _WiFiState();
}

class _WiFiState extends State<WiFiPage> {
  List<WifiConnection> wifiConnections = new List<WifiConnection>();

  void startScanningDevices(BuildContext context) async {
    print('Start scanning devices');
    List<dynamic> ssidList = await Wifi.list('');
    ssidList.forEach((ssid) => setState(() {
          var connection = new WifiConnection();
          connection.isConnected = ssid == 'HaLlMaRk' ? true : false;
          connection.ssid = ssid;
          wifiConnections.add(connection);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose A Network'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.wifi),
              tooltip: 'Scan Wifi connections..',
              onPressed: () => startScanningDevices(context)),
        ],
      ),
      body: Center(
        child: new ListView.separated(
          separatorBuilder: (context, index) => Divider(
                color: Colors.red,
              ),
          itemCount: wifiConnections.length,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(wifiConnections[index].ssid),
                  subtitle: Text(wifiConnections[index].isConnected.toString()),
                  onTap: () {
                    print(wifiConnections[index]);
                  },
                  trailing: Icon(
                    wifiConnections[index].isConnected
                        ? Icons.cast_connected
                        : Icons.signal_wifi_off,
                    color: wifiConnections[index].isConnected
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
