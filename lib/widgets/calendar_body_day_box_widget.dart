import 'package:dokuz10_web/provider/calendar_provider.dart';
import 'package:dokuz10_web/widgets/calendar_day_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CalendarBodyDayBoxWidget extends StatelessWidget {
  DateTime date;

  CalendarBodyDayBoxWidget({
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calendarProvider = Provider.of<CalendarProvider>(context);
    DateTime today = DateTime.now();
    today = DateTime(today.year, today.month, today.day);
    return GestureDetector(
      onTap: () {
        calendarDayPopUp(context, date);
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(date.day.toString()),
        decoration: BoxDecoration(
          color: (calendarProvider.currentYear == date.year &&
                  calendarProvider.currentMonth == date.month)
              ? (date == today)
                  ? Colors.teal
                  : Colors.teal.withOpacity(0.5)
              : Theme.of(context).colorScheme.onInverseSurface,
        ),
      ),
    );
  }
}
