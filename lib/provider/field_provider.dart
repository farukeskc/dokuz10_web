import 'package:dokuz10_web/models/field.dart';

class FieldProvider {
  List<Field> myFields = [];
  int currentField = 0;

  void changeField(int index) {
    currentField = index;
  }

  void addField(Field field) {
    myFields.add(field);
  }
}