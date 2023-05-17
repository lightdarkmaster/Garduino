// ignore_for_file: library_private_types_in_public_api
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:garduino/watering_page.dart';
import 'package:garduino/controller/bluetooth_controller.dart';

void main() {
  runApp(const ControllerPage());
}

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  _ControllerPageState createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  BluetoothDevice? targetDevice;

  @override
  void initState() {
    super.initState();
    connectToDevice();
  }

  Future<void> connectToDevice() async {
    try {
      FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
      Stream<ScanResult> scanStream = flutterBlue.scan(
        timeout: const Duration(seconds: 5),
      );

      scanStream.listen((scanresult) async {
        // ignore: unnecessary_null_comparison
        if (scanresult.device.name != null &&
            scanresult.device.name.isNotEmpty) {
          targetDevice = scanresult.device.name as BluetoothDevice?;
          await targetDevice!.connect();
          sendCommand('1');
          await flutterBlue
              .stopScan(); // Stop scanning after finding the target device
        }
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error connecting to device: $e');
    }
  }

  void sendCommand(String command) async {
    // ignore: unrelated_type_equality_checks
    if (targetDevice?.state == BluetoothDeviceState.connected) {
      List<int> data = utf8.encode(command);

      List<BluetoothService> services = await targetDevice!.discoverServices();
      for (BluetoothService service in services) {
        for (BluetoothCharacteristic characteristic
            in service.characteristics) {
          if (characteristic.properties.write) {
            await characteristic.write(data);
          }
        }
      }
      print('device connected');
    } else {
      print('Device not connected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controller'),
        backgroundColor: Colors.lightGreen,
      ),
      body: MySwitchListTile(
        sendCommand: sendCommand,
      ),
    );
  }
}

class MySwitchListTile extends StatefulWidget {
  final Function(String) sendCommand;

  const MySwitchListTile({Key? key, required this.sendCommand})
      : super(key: key);

  @override
  _MySwitchListTileState createState() => _MySwitchListTileState();
}

class _MySwitchListTileState extends State<MySwitchListTile> {
  bool _fanOn = false;
  bool _openWindow = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: const Text('Ventilation Fan'),
          subtitle:
              const Text('This is a switch to turn ON the ventilation Fans'),
          trailing: Switch(
            value: _fanOn,
            onChanged: (bool value) {
              setState(() {
                _fanOn = value;
              });
              widget.sendCommand(value ? '1' : '0');
            },
          ),
        ),
        ListTile(
          title: const Text('Open Window'),
          subtitle: const Text(
              'This is a switch to open the window (to enable airflow)'),
          trailing: Switch(
            value: _openWindow,
            onChanged: (bool value) {
              setState(() {
                _openWindow = value;
              });
              widget.sendCommand(value ? 'W' : 'C');
            },
          ),
        ),
        ListTile(
          title: const Text('Watering System'),
          subtitle: const Text('set time to water your plants'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TimePickerPage()),
            );
          },
        ),
      ],
    );
  }
}
