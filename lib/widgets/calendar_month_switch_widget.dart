import 'package:dokuz10_web/provider/calendar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarMonthSwitch extends StatelessWidget {
  const CalendarMonthSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calendarProvider = Provider.of<CalendarProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            calendarProvider.decreaseMonth();
          },
          icon: const Icon(Icons.chevron_left),
        ),
        Text(calendarProvider.currentMonth.toString()+"/"),
        Text(calendarProvider.currentYear.toString()),
        IconButton(
          onPressed: () {
            calendarProvider.increaseMonth();
          },
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
