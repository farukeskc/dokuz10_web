import 'package:dokuz10_web/models/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> showMyDialog(BuildContext context) async {
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  TextEditingController _datePickerController = TextEditingController();
  DateTime? date;
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Yeni Maç Ekle'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () async {
                date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 21)),
                );
                _datePickerController.text = formatter.format(date!).toString().substring(0,10);
              },
              child: TextField(
                controller: _datePickerController,
                enabled: false,
                decoration: authInputDecoration.copyWith(
                  label: const Text("Tarih"),
                  suffixIcon: const Icon(Icons.calendar_month),
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Kaydet'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
