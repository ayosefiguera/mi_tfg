import 'dart:collection';
import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

import 'package:eqlibrum/apis/api_key.dart' show FirebaseData;
import 'package:eqlibrum/utils/utils.dart';
import '../models/models.dart' show Appointment;

class AppointmentController extends ChangeNotifier {
  final String _baseUrl = FirebaseData.url;
  bool isLoading = false;

  final kAppointment = LinkedHashMap<DateTime, List<Appointment>>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  AppointmentController() {
    loadAppointment();
  }

  List<Appointment> getEventsForDay(DateTime day) {
    return kAppointment[day] ?? [];
  }

  Future<LinkedHashMap<DateTime, List<Appointment>>> loadAppointment() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'appointment.json');
    final response = await http.get(url);

    final Map<String, dynamic> appointmentMap = json.decode(response.body);
    appointmentMap.forEach((key, value) {
      final tempAppointment = Appointment.fromMap(value);

      tempAppointment.id = key;

      kAppointment.containsKey(tempAppointment.date_Key)
          ? kAppointment.update(
              tempAppointment.date_Key, (value) => [...value, tempAppointment])
          : kAppointment.addAll({
              tempAppointment.date_Key: [tempAppointment]
            });
    });
    isLoading = false;
    notifyListeners();
    return kAppointment;
  }
}
