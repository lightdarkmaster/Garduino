import 'package:garduino/controller_page.dart';
import 'package:garduino/connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import '../navbar.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key); //added

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Garduino',
      theme: ThemeData(
          colorScheme: const ColorScheme.dark(
              secondary: Color.fromARGB(248, 22, 255, 42),
              primary: Color.fromARGB(255, 23, 241, 16))),
      home: FutureBuilder(
        future: FlutterBluetoothSerial.instance.requestEnable(),
        builder: (BuildContext context, future) {
          if (future.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: SizedBox(
                height: double.infinity,
                child: Center(
                  child: Icon(
                    Icons.bluetooth_disabled,
                    size: 200,
                    color: Color.fromARGB(255, 136, 255, 38),
                  ),
                ),
              ),
            );
          } else {
            return const Home();
          }
        },
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text("Device List"),
      ),
      body: SelectBondedDevicePage(
        onCahtPage: (device1) {
          BluetoothDevice device = device1;
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ChatPage(
              server: device,
            );
          }));
        },
      ),
    ));
  }
}
