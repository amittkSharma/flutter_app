import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:core';

class BLEDevice {
  ScanResult scanResult;
  String deviceStatus;
}

class BluetoothDevicesList extends StatefulWidget {
  @override
  _BluetoothDevicesListState createState() => new _BluetoothDevicesListState();
}

class _BluetoothDevicesListState extends State<BluetoothDevicesList> {
  StreamSubscription _scanSubscription;
  StreamSubscription _deviceConnection;
  FlutterBlue _flutterBlue = FlutterBlue.instance;
  Map<DeviceIdentifier, BLEDevice> devices = new Map();
  Stream<ScanResult> subscription;

  onScanBluetoothDevices() {
    _scanSubscription = _flutterBlue
        .scan(
      timeout: const Duration(seconds: 10),
    )
        .listen((scanResult) {
      if (!devices.containsKey(scanResult.device.id)) {
        var bleDevice = new BLEDevice();
        bleDevice.deviceStatus = 'Disconnected';
        bleDevice.scanResult = scanResult;
        setState(() {
          devices[scanResult.device.id] = bleDevice;
        });
      }
    }, onDone: stopScan);
  }

  void stopScan() {
    _scanSubscription?.cancel();
    _deviceConnection?.cancel();
  }

  @override
  void dispose() {
    _scanSubscription?.cancel();
    _scanSubscription = null;
    _deviceConnection?.cancel();
    _deviceConnection = null;
    super.dispose();
  }

  connectToDevice(BLEDevice device) async {
    _deviceConnection = _flutterBlue
        .connect(device.scanResult.device, timeout: const Duration(seconds: 10))
        .listen((s) {
      if (s == BluetoothDeviceState.connected) {
        setState(() {
          device.deviceStatus = 'Connected';
        });
      }
    }, onDone: stopScan);
  }

  List<Widget> getTextWidgets(Map<DeviceIdentifier, BLEDevice> devices) {
    List<Widget> widgets = devices.values
        .map((device) => new ListTile(
              title: Text(device.scanResult.device.id.toString()),
              subtitle: Text(device.scanResult.device.name.toString()),
              trailing: Text(device.deviceStatus.toString()),
              onTap: () {
                connectToDevice(device);
              },
            ))
        .toList();
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bluetooth Devices'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.bluetooth_searching),
                tooltip: 'Camera Open!',
                onPressed: () => onScanBluetoothDevices()),
          ],
        ),
        body: FutureBuilder(
            future: onScanBluetoothDevices(),
            builder: (context, snapshot) {
              if (snapshot.hasError)
                print('Error in scanning bluetooth device ${snapshot.error}');

              return Center(
                  child: ListView.separated(
                      padding: EdgeInsets.all(8.0),
                      separatorBuilder: (context, index) => Divider(
                            color: Colors.red,
                          ),
                      itemCount: this.devices.length,
                      itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.all(8.0),
                          child: getTextWidgets(this.devices)[index])));
            }));
  }
}
