import 'package:dokuz10_web/models/address.dart';

class FieldOwner {
  final String uid;
  String name;
  Address address;

  FieldOwner({
    required this.uid,
    required this.name,
    required this.address,
  });
}