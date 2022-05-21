import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dokuz10_web/models/event.dart';
import 'package:dokuz10_web/models/field.dart';
import 'package:dokuz10_web/provider/field_provider.dart';
import 'package:dokuz10_web/provider/my_events_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DBS {
  final String uid;

  DBS({
    required this.uid,
  });

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future register(String mail, String name) async {
    await users.doc(uid).set({
      "mail": mail,
      "name": name,
      "role": "fieldOwner",
    });
  }

  Future addNewEvent(MyEventsProvider _myEvents, DateTime date, Field field, int price) async {
    _myEvents.addEvent(Event(date: date, price: price, field: field.id));
    await users.doc(uid).collection("fields").doc(field.id).collection("events").add({
      "date": date,
      "field": field.id,
      "price": price,
    });
  }

  Future<void> getEvents(BuildContext context) async {
    print('getEvents');
    final _myEvents = Provider.of<MyEventsProvider>(context);
    final _fieldProvider = Provider.of<FieldProvider>(context);
    _myEvents.myEvents.clear();
    _fieldProvider.myFields.clear();
    await users.doc(uid).collection("fields").get().then((value) async {
      for (var field in value.docs) {
        Map fieldMap = field.data();
        Field _field = Field(id: field.id, width: fieldMap['width'], height: fieldMap['height'], roofed: fieldMap['roofed']);
        _fieldProvider.addField(_field);
        await users
            .doc(uid)
            .collection("fields")
            .doc(field.id)
            .collection("events")
            .get()
            .then((value) {
          for (var event in value.docs) {
            Map data = event.data();
            _myEvents.addEvent(
                Event(date: data['date'].toDate(), price: data['price'], field: data['field']));
          }
        });
      }
    });
  }
}
