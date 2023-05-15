--- comment nganhi mga changes han code ----------------





----- how to push to repo ----------------
git add --all 
git commit -m "Message the changes" 
git push origin master


------ notfify if there are any changes ---

-------- problem list here ----------------
1. cannot connect to the bluetooth JDY-16 (HC05 module).
2. app deisgn modification
3. arduino bluetooth serial monitor problem.


original code of bluetoothcontroller is


  Future scanDevices() async {
    flutterBlue.startScan(timeout: const Duration(seconds: 5));
    flutterBlue.stopScan();
    
  }

  ////



  the whole code is

  // ignore: file_names
import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class BluetoothController extends GetxController {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  BluetoothDevice? targetDevice;

  Future scanDevices() async {
    flutterBlue.startScan(timeout: const Duration(seconds: 5));
    flutterBlue.stopScan();
  }

  Stream<List<ScanResult>> get scanResults => flutterBlue.scanResults;

  connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();
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

//

