//import 'dart:html';
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:garduino/about.dart';
import 'package:garduino/controller.dart';
import 'package:flutter/services.dart';
import 'package:garduino/notifications.dart';
import 'package:garduino/settings.dart';

//import 'Gardendata.dart';
import 'dataGarden.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                image: DecorationImage(
                    image: AssetImage('assets/images/garden.PNG')),
              ),
              child: Text('')),
          ListTile(
            leading: const Icon(Icons.analytics),
            title: const Text('Garden Data'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const dataGarden()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_remote),
            title: const Text('Controller'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ControllerPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('About Us'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit'),
            onTap: () => SystemNavigator.pop(),
          ),
        ],
      ),
    );
  }
}

class ExitButton extends StatelessWidget {
  const ExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        SystemNavigator.pop();
      },
      child: const Text("close app"),
    );
  }
}
