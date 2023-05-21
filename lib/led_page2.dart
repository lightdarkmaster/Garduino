// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class wateringPage extends StatefulWidget {
  const wateringPage(
      {Key? key, required this.sendMessageA, required this.sendMessageK})
      : super(key: key);
  final Function sendMessageA;
  final Function sendMessageK;

  @override
  // ignore: library_private_types_in_public_api
  _wateringState createState() => _wateringState();
}

class _wateringState extends State<wateringPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
        ),
        GestureDetector(
          onTapDown: (_) => widget.sendMessageA(),
          onTapUp: (_) => widget.sendMessageK(),
          child: const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
              child: Icon(Icons.water_drop)),
        ),
      ],
    );
  }
}
