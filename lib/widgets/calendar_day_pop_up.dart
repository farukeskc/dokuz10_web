import 'package:dokuz10_web/shared/date_to_string.dart';
import 'package:dokuz10_web/widgets/day_calendar_widget.dart';
import 'package:dokuz10_web/widgets/responsive.dart';
import 'package:flutter/material.dart';

Future<void> calendarDayPopUp(BuildContext context, DateTime date) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: Responsive(
          mobile: Container(),
          tablet: Container(),
          desktop: Container(
              width: MediaQuery.of(context).size.width * 0.81,
              height: 700,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                      child: Text(
                        dateToString(date),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  DayCalendar(date: date)
                ],
              )),
        ),
      );
    },
  );
}
