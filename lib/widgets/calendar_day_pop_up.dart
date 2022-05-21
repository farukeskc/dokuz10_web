import 'package:dokuz10_web/models/event.dart';
import 'package:dokuz10_web/models/user.dart';
import 'package:dokuz10_web/provider/field_provider.dart';
import 'package:dokuz10_web/provider/my_events_provider.dart';
import 'package:dokuz10_web/services/database.dart';
import 'package:dokuz10_web/shared/date_to_string.dart';
import 'package:dokuz10_web/widgets/day_calendar_widget.dart';
import 'package:dokuz10_web/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void calendarDayPopUp(BuildContext context, DateTime date) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      final _fieldProvider = Provider.of<FieldProvider>(context);
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            child: Responsive(
              mobile: Container(),
              tablet: Container(),
              desktop: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.81,
                  height: 700,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.01),
                            child: Text(
                              dateToString(date),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (_fieldProvider.currentField != index) {
                                      setState(() {
                                        _fieldProvider.changeField(index);
                                      });
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: (_fieldProvider.currentField == index)
                                            ? Colors.teal.withOpacity(0.5)
                                            : Colors.teal),
                                    width: 80,
                                    alignment: Alignment.center,
                                    child: Text("Saha "+(index+1).toString()),
                                  ),
                                );
                              },
                              itemCount: _fieldProvider.myFields.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                            ),
                            height: 50,
                          ),
                        ],
                      ),
                      DayCalendar(date: date),
                    ],
                  )),
            ),
          );
        }
      );
    },
  );
}

