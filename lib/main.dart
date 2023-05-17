//import 'dart:html';
// import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:garduino/controller/home_screen.dart';

void main() {
  runApp(const MyApp());
}

///nag add ak dependencies flutter blue tas nag pub get
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garduino App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const HomePage(),
    );
  }
}
