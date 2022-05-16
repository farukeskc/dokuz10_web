import 'package:cloud_firestore/cloud_firestore.dart';

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
}
