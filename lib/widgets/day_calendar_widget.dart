import 'package:dokuz10_web/models/event.dart';
import 'package:dokuz10_web/provider/field_provider.dart';
import 'package:dokuz10_web/provider/my_events_provider.dart';
import 'package:dokuz10_web/widgets/add_new_event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
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
    DateTime firstHourOfDay =
        DateTime(widget.date.year, widget.date.month, widget.date.day, 12, 0);
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
          // TimeOfDay time = TimeOfDay(hour: index, minute: 0);
          DateTime boxDate = firstHourOfDay.add(Duration(hours: index));
          for (Event element in _myEvents.myEvents) {
            if (element.date == boxDate &&
                element.field ==
                    (_fieldProvider.myFields[_fieldProvider.currentField]).id) {
              eventThisHour = element;
              break;
            }
          }
          return GestureDetector(
            onTap: () async {
              if (eventThisHour == null && boxDate.isAfter(DateTime.now())) {
                await addNewEventDialog(context, boxDate);
                setState(() {});
              }
            },
            child: Container(
              color: eventThisHour != null
                  ? Colors.red
                  : Theme.of(context).colorScheme.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TimeOfDay(hour: boxDate.hour, minute: boxDate.minute)
                              .format(context),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        Text(
                          ((eventThisHour?.price != null)
                              ? "Ücret: " +
                                  eventThisHour!.price.toString() +
                                  ' ₺'
                              : ''),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        Text(
                          (eventThisHour?.details != null)
                              ? eventThisHour!.details
                              : (eventThisHour == null &&
                                      boxDate.isAfter(DateTime.now()))
                                  ? 'dokuz10 mobilde kullanıcıları tarafından seçilebilir.'
                                  : '',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 10),
                        ),
                      ],
                    ),
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
