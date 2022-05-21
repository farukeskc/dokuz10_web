import 'package:dokuz10_web/models/event.dart';

class MyEventsProvider {
  List<Event> myEvents = [];

  void addEvent(Event event) {
    myEvents.add(event);
  }
}