import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title, startTime, endTime, description, location, supervisor, contact, requirements, commitment, additionalInformation;

  const Event(
      this.title,
      this.startTime,
      this.endTime,
      this.description,
      this.location,
      this.supervisor,
      this.contact,
      this.requirements,
      this.commitment,
      this.additionalInformation


      );

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
);//..addAll(_kEventSource);


void addEvents(){
  Map <DateTime, List<Event>> rawData = Map();
  //data not stored in any order. No particular iteration order promised with class Map
  rawData[DateTime.now()] = [Event("Test Club", "10:00 am", "11:00 am", "This is a club", "Zoom Link", "Ms Person", "asfsf@gmail.com", "Have fun", "2", "Nothing"),
                             Event("Another Club", "11:00 am", "3:00 pm", "This is another club", "Room 25", "Mr Person", "asfsf@gmail.com", "Have fun", "2", "Nothing")];
  rawData[DateTime.utc(2021, 12, 13)] = [Event("Another Club", "11:00 am", "3:00 pm", "This is another club", "Room 190", "Nobody","asfsf@gmail.com", "Have fun", "2", "Nothing")];

  // rawData[DateTime.utc(2021, 12, 11)] = [Event("Spend lots of time deciphering bad documentation.")];
  // rawData[DateTime.utc(2021, 12, 13)] = [Event("Go to dinner at a nice restaurant cause we figured this out.")];
  kEvents.addAll(rawData);
  print(kEvents);
}


// kEvents.addEntries(DateTime.utc(kFirstDay.year, kFirstDay.month, 5), newEntries)
// final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
//     key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
//     value: (item) => List.generate(
//         item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
//   ..addAll({
//     kToday: [
//       Event('Today\'s Event 1'),
//       Event('Today\'s Event 2'),
//     ],
//   });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);