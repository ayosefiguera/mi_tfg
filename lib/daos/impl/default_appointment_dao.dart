import 'package:eqlibrum/apis/api_key.dart';
import 'package:eqlibrum/daos/appointment_dao.dart';
import 'package:eqlibrum/models/appointment.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:flutter/services.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Default implementation to [AppointmentDAO]
class DefaultAppointmentDAO implements AppointmentDAO {
  /// Find all psychologist by performin a ApiRest query.
  @override
  Future<List<Appointment>> loadAppointment(User user) async {
    const String _baseUrl = FirebaseData.url;
    const String _key = Auth.key;
    final _storage = FlutterSecureStorage();
    List<Appointment> appointments = [];

    final url = Uri.https(_baseUrl, 'appointments/${user.id}.json',
        {'auth': await _storage.read(key: 'token') ?? ''});
    final response = await http.get(url);
    if (json.decode(response.body) != null) {
      Map<String, dynamic> result = json.decode(response.body);
      result.forEach((key, value) {
        Appointment appointment = Appointment(
            psychologistID: value['psychologistID'],
            date: DateTime.parse(value['date']),
            status: value['status']);
        appointments.add(appointment);
      });
    }

    return appointments;
  }
}
