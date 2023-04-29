import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:garduino/controller/bluetooth_Controller.dart';
import 'package:garduino/navbar.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
          title: const Text('Garduino'), backgroundColor: Colors.lightGreen),
      body: GetBuilder<BluetoothController>(
          init: BluetoothController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: 80,
                      width: double.infinity,
                      color: Colors.lightGreen,
                      child: const Center(
                          child: Text("Connect to a Device",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )))),
                  const SizedBox(
                    height: 28,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => controller.scanDevices(),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.lightGreen,
                          minimumSize: const Size(250, 55),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)))),
                      child: const Text("Scan",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  StreamBuilder<List<ScanResult>>(
                      stream: controller.scanResults,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final data = snapshot.data![index];
                                return Card(
                                  elevation: 2,
                                  child: ListTile(
                                    title: Text(data.device.name),
                                    subtitle: Text(data.device.id.id),
                                    trailing: ElevatedButton(
                                      onPressed: () => controller
                                          .connectToDevice(data.device),
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.lightGreen,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                      ),
                                      child: const Text("Connect"),
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return const Center(
                            child: Text("No Device Found"),
                          );
                        }
                      })
                ],
              ),
            );
          }),
    );
  }
}

//problem is dire ko hiya maconnect ha JDY-16
//trying to use the wifi module
//WiFi module model "DT-06 TTL" with Bluetooth HC-06 Interface ESP-M2
