import 'package:dokuz10_web/widgets/add_new_event.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DayCalendar extends StatelessWidget {
  DateTime date;

  DayCalendar({
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.2,
          childAspectRatio: 3 / 1.22,
        ),
        itemCount: 16,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          index = (index + 12) % 24;
          TimeOfDay time = TimeOfDay(hour: index, minute: 0);
          return GestureDetector(
            onTap: () async {
              await addNewEventDialog(context, date, time);
            },
            child: Container(
              color: Colors.amber,
              child: Text(time.format(context)),
            ),
          );
        },
      ),
    );
  }
}
