// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';

class ventilationPage extends StatefulWidget {
  const ventilationPage(
      {Key? key,
      required this.sendMessage1,
      required this.sendMessage2,
      required this.sendMessage3,
      required this.sendMessage4,
      required this.sendMessage5,
      required this.sendMessage6,
      required this.sendMessage7,
      required this.sendMessage8,
      required this.sendMessage9})
      : super(key: key);
  final Function sendMessage1;
  final Function sendMessage2;
  final Function sendMessage3;
  final Function sendMessage4;
  final Function sendMessage5;
  final Function sendMessage6;
  final Function sendMessage7;
  final Function sendMessage8;
  final Function sendMessage9;

  @override
  _buzzerPageState createState() => _buzzerPageState();
}

// ignore: camel_case_types
class _buzzerPageState extends State<ventilationPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 10,
        ),
        Row(
          children: [
            GestureDetector(
              onTapUp: (_) => widget.sendMessage1(),
              child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black,
                  child: Text(
                    "On",
                    style: TextStyle(color: Colors.grey[400], fontSize: 20),
                  )),
            ),
            const SizedBox(
              width: 15,
            ),
            GestureDetector(
                onTapUp: (_) => widget.sendMessage2(),
                child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.black,
                    child: Text(
                      "OFF",
                      style: TextStyle(color: Colors.grey[400], fontSize: 20),
                    ))),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
