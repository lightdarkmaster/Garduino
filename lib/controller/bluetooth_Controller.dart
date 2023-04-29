// ignore: file_names
import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class BluetoothController extends GetxController {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  Future scanDevices() async {
    flutterBlue.startScan(timeout: const Duration(seconds: 5));

    flutterBlue.stopScan();
  }

  Stream<List<ScanResult>> get scanResults => flutterBlue.scanResults;

  connectToDevice(BluetoothDevice device) {}
}

//connect to a device
//connect to a list of devices

Future<void> connectToDevice(BluetoothDevice device) async {
  await device.connect();
  // Do something after the device is connected
}
