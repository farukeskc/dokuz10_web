import 'package:dokuz10_web/models/event.dart';
import 'package:dokuz10_web/provider/field_provider.dart';
import 'package:dokuz10_web/provider/my_events_provider.dart';
import 'package:dokuz10_web/widgets/add_new_event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DayCalendar extends StatefulWidget {
  DateTime date;

  DayCalendar({
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  State<DayCalendar> createState() => _DayCalendarState();
}

class _DayCalendarState extends State<DayCalendar> {
  @override
  Widget build(BuildContext context) {
    final _myEvents = Provider.of<MyEventsProvider>(context);
    final _fieldProvider = Provider.of<FieldProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.2,
          childAspectRatio: 3 / 1.22,
        ),
        itemCount: 16,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          Event? eventThisHour;
          index = (index + 12) % 24;
          TimeOfDay time = TimeOfDay(hour: index, minute: 0);
          for (Event element in _myEvents.myEvents) {
            if (element.date ==
                    DateTime(widget.date.year, widget.date.month, widget.date.day, time.hour,
                        time.minute) &&
                element.field ==
                    (_fieldProvider.myFields[_fieldProvider.currentField]).id) {
              eventThisHour = element;
              break;
            }
          }
          return GestureDetector(
            onTap: () async {
              if (eventThisHour == null) {
                await addNewEventDialog(context, widget.date, time);
                setState(() {

                });
              }
            },
            child: Container(
              color: eventThisHour != null ? Colors.red : Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(time.format(context)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
