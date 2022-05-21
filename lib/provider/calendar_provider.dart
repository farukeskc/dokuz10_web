import 'package:flutter/material.dart';

class CalendarProvider extends ChangeNotifier {
  int currentMonth = DateTime.now().month;
  int currentYear = DateTime.now().year;

  void increaseMonth() {
    if(currentMonth == 12) {
      currentYear++;
      currentMonth = 0;
    }
    currentMonth++;
    notifyListeners();
  }

  void decreaseMonth() {
    if(currentMonth == 1) {
      currentYear--;
      currentMonth = 13;
    }
    currentMonth--;
    notifyListeners();
  }
}