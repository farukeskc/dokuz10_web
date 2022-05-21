import 'package:dokuz10_web/models/constants.dart';
import 'package:flutter/material.dart';

class CalendarTopBar extends StatelessWidget {
  const CalendarTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CalendarTopBarDayContainer(text: "Pazartesi"),
        CalendarTopBarDayContainer(text: "Salı"),
        CalendarTopBarDayContainer(text: "Çarşamba"),
        CalendarTopBarDayContainer(text: "Perşembe"),
        CalendarTopBarDayContainer(text: "Cuma"),
        CalendarTopBarDayContainer(text: "Cumartesi"),
        CalendarTopBarDayContainer(text: "Pazar"),
      ],
    );
  }
}

// ignore: must_be_immutable
class CalendarTopBarDayContainer extends StatelessWidget {
  String text;
  CalendarTopBarDayContainer({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // width: 70,
        height: 40,
        alignment: Alignment.center,
        child: Text(
          text,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: myColor,
          ),
        ),
      ),
    );
  }
}
