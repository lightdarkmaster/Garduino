import 'package:flutter/material.dart';

class TimePickerPage extends StatefulWidget {
  const TimePickerPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimePickerPageState createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  late String _selectedTime;

  final List<String> _timeList = [
    '5:00 AM',
    '6:00 AM',
    '7:00 AM (recommended)',
    '4:00 PM',
    '5:00 PM (recommended)',
  ];

  @override
  void initState() {
    super.initState();
    _selectedTime = _timeList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Watering System'),
          backgroundColor: Colors.lightGreen),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: const Text('Select Time'),
              subtitle: DropdownButton(
                value: _selectedTime,
                items: _timeList
                    .map((time) => DropdownMenuItem(
                          value: time,
                          child: Text(time),
                        ))
                    .toList(),
                onChanged: (selectedTime) {
                  setState(() {
                    _selectedTime = selectedTime as String;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // ignore: avoid_print
                print('Selected Time: $_selectedTime');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightGreen,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              child: const Text('Water Now'),
            ),
          ],
        ),
      ),
    );
  }
}
