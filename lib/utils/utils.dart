import 'dart:collection';
import 'package:eqlibrum/models/models.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.


final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

