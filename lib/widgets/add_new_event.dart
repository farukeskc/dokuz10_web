import 'package:dokuz10_web/models/constants.dart';
import 'package:dokuz10_web/models/user.dart';
import 'package:dokuz10_web/provider/field_provider.dart';
import 'package:dokuz10_web/provider/my_events_provider.dart';
import 'package:dokuz10_web/services/database.dart';
import 'package:dokuz10_web/shared/date_to_string.dart';
import 'package:dokuz10_web/widgets/time_picker.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

Future<void> addNewEventDialog(
  BuildContext context,
  DateTime? date,
  TimeOfDay time,
) async {
  TextEditingController _datePickerController = TextEditingController();
  TextEditingController _timePickerController = TextEditingController();
  _datePickerController.text = dateToString(date!);
  _timePickerController .text = time.format(context);
  int? price;
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      final _myEvents = Provider.of<MyEventsProvider>(context);
      final _fieldProvider = Provider.of<FieldProvider>(context);
      final auth = Provider.of<UserModel>(context);
      return AlertDialog(
        title: const Text('Yeni Maç Ekle'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () async {
                // date = await showDatePicker(
                //   context: context,
                //   initialDate: DateTime.now(),
                //   firstDate: DateTime.now(),
                //   lastDate: DateTime.now().add(const Duration(days: 21)),
                // );
                // _datePickerController.text =
                //     dateToString(date!);
              },
              child: TextFormField(
                controller: _datePickerController,
                enabled: false,
                decoration: authInputDecoration.copyWith(
                  label: const Text("Tarih"),
                  suffixIcon: const Icon(Icons.calendar_month),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                // time = await timePicker(context);
                // _timePickerController.text = time.format(context);
              },
              child: TextFormField(
                controller: _timePickerController,
                enabled: false,
                decoration: authInputDecoration.copyWith(
                  label: const Text("Saat"),
                  suffixIcon: const Icon(Icons.access_time),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: authInputDecoration.copyWith(
                  label: const Text('Saatlik Ücret')),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                price = int.parse(value);
              },
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Kaydet'),
            onPressed: () async {
              date = DateTime(
                  date!.year, date!.month, date!.day, time.hour, time.minute);
              await DBS(uid: auth.uid).addNewEvent(_myEvents, date!, _fieldProvider.myFields[_fieldProvider.currentField], price!);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
