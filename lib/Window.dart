// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class windowPage extends StatefulWidget {
  const windowPage(
      {Key? key, required this.sendMessageA, required this.sendMessageK})
      : super(key: key);
  final Function sendMessageA;
  final Function sendMessageK;

  @override
  _ledPageState createState() => _ledPageState();
}

class _ledPageState extends State<windowPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
        ),
        InkWell(
          onTap: () {
            widget.sendMessageA();
          },
          child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
              child: Text(
                "Open",
                style: TextStyle(color: Colors.grey[400], fontSize: 20),
              )),
        ),
        const SizedBox(
          height: 50,
        ),
        InkWell(
            onTap: () {
              widget.sendMessageK();
            },
            child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
                child: Text(
                  "Close",
                  style: TextStyle(color: Colors.grey[400], fontSize: 20),
                ))),
      ],
    );
  }
}
