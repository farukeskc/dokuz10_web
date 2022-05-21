// ignore: import_of_legacy_library_into_null_safe
import 'package:date_util/date_util.dart';
import 'package:dokuz10_web/provider/calendar_provider.dart';
import 'package:dokuz10_web/widgets/calendar_body_day_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarBody extends StatelessWidget {
  CalendarBody({Key? key}) : super(key: key);

  final ScrollController a = ScrollController();

  @override
  Widget build(BuildContext context) {
    final calendarProvider = Provider.of<CalendarProvider>(context);
    DateTime firstDayOfMonth = DateTime(
      calendarProvider.currentYear,
      calendarProvider.currentMonth,
      1,
    );
    DateTime firstDayOfCalendarBlock =
        firstDayOfMonth.subtract(Duration(days: firstDayOfMonth.weekday - 1));
    int daysInMonth = DateUtil().daysInMonth(
      calendarProvider.currentMonth,
      calendarProvider.currentYear,
    );
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.1,
        childAspectRatio: 30 / 18,
      ),
      itemCount: (daysInMonth + firstDayOfMonth.weekday > 35) ? 42 : 35,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        DateTime currentBlockDate =
            firstDayOfCalendarBlock.add(Duration(days: index));
        return CalendarBodyDayBoxWidget(date: currentBlockDate);
      },
    );
  }
}
