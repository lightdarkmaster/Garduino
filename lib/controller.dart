import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:garduino/watering_page.dart';

void main() {
  runApp(const ControllerPage());
}

class ControllerPage extends StatelessWidget {
  const ControllerPage({super.key});

  void sendCommand(String command) {
    // ignore: prefer_typing_uninitialized_variables
    var connection;
    connection?.output.add(utf8.encode(command));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controller'),
        backgroundColor: Colors.lightGreen,
      ),
      body: const MySwitchListTile(),
    );
  }
}

class MySwitchListTile extends StatefulWidget {
  const MySwitchListTile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MySwitchListTileState createState() => _MySwitchListTileState();
}

class _MySwitchListTileState extends State<MySwitchListTile> {
  //bool _switchValue = false;
  bool _fanOn = true;
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
              sendCommand(value ? '1' : '0');
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

  //add

  void sendCommand(String command) {
    // ignore: prefer_typing_uninitialized_variables
    var connection;
    connection?.output.add(utf8.encode(command));
  }
}

//add
