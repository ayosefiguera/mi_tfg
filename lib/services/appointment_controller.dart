import 'dart:collection';
import 'dart:convert' show json;
import 'package:eqlibrum/models/appointment.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:eqlibrum/apis/api_key.dart' show FirebaseData;
import 'package:eqlibrum/utils/utils.dart';
 

class AppointmentController extends ChangeNotifier {
  final String _baseUrl = FirebaseData.url;
  final storage = FlutterSecureStorage();

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

    final url = Uri.https(_baseUrl, 'appointment.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final response = await http.get(url);

    final Map<String, dynamic> appointmentMap = json.decode(response.body);

    try {
      appointmentMap.forEach((key, value) {
        final tempAppointment = Appointment.fromMap(value);

        tempAppointment.id = key;

        kAppointment.containsKey(tempAppointment.date)
            ? kAppointment.update(tempAppointment.date,
                (value) => [...value, tempAppointment])
            : kAppointment.addAll({
                tempAppointment.date: [tempAppointment]
              });
      });
    } catch (e) {
      print(e);
    }

    isLoading = false;
    notifyListeners();
    return kAppointment;
  }
}
