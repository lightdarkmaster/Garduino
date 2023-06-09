// ignore: file_names
// ignore_for_file: avoid_print

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

  connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      print('Connected');
      // Code to execute after the device is successfully connected
    } catch (e) {
      // Handle any connection errors
      // ignore: avoid_print
      print('Error connecting to device: $e');
    }
  }
}

//connect to a device
//connect to a list of devices

Future<void> connectToDevice(BluetoothDevice device) async {
  await device.connect();
}
