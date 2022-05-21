import 'package:flutter/material.dart';

Future timePicker(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return const TimePickerDialog(
        initialTime: TimeOfDay(hour: 12, minute: 0),
        initialEntryMode: TimePickerEntryMode.dial,
      );
    },
  );
}