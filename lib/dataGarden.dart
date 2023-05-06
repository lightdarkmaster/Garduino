// ignore: file_names
// ignore_for_file: avoid_print, duplicate_ignore

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

// ignore: camel_case_types
class dataGarden extends StatefulWidget {
  const dataGarden({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<dataGarden> {
  late BluetoothConnection connection;
  String temperature = '';
  String humidity = '';

  @override
  void initState() {
    super.initState();
    _connectToDevice();
  }

  Future<void> _connectToDevice() async {
    BluetoothDevice device = await FlutterBluetoothSerial.instance
        .getBondedDevices()
        .then((devices) {
      return devices.firstWhere(
          (device) => device.name == 'JDY-16'); //device.name == 'HC-05');
    });

    // ignore: duplicate_ignore
    await BluetoothConnection.toAddress(device.address).then((connection) {
      // ignore: avoid_print
      print('Connected to the device');
      setState(() {
        connection = connection;
      });

      connection.input?.listen((data) {
        String receivedData = utf8.decode(data);
        List<String> sensorData = receivedData.split(',');
        setState(() {
          temperature = sensorData[0];
          humidity = sensorData[1];
        });
      }).onDone(() {
        _disconnectFromDevice();
      });
    }).catchError((error) {
      print('Cannot connect to the device');
    });
  }

  void _disconnectFromDevice() {
    connection.dispose();
    connection;
    print('Disconnected from the device');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garden Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Temperature: $temperature °C',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              'Humidity: $humidity %',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Irradiance: $humidity',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Rain Status: $humidity ',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'PH Level: $humidity ',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.bluetooth_disabled),
      ),
    );
  }
}
