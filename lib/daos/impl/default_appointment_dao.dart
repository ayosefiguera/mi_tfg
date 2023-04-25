import 'dart:io';

import 'package:eqlibrum/apis/api_key.dart';
import 'package:eqlibrum/daos/appointment_dao.dart';
import 'package:eqlibrum/models/appointment.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Default implementation to [AppointmentDAO]
class DefaultAppointmentDAO implements AppointmentDAO {
  /// Find all psychologist by performin a ApiRest query.
  @override
  Future<List<Appointment>> loadAppointment(final id) async {
    const String baseUrl = FirebaseData.url;
    const storage = FlutterSecureStorage();
    List<Appointment> appointments = [];

    final url = Uri.https(baseUrl, 'appointments/$id.json',
        {'auth': await storage.read(key: 'userToken') ?? ''});
    final response = await http.get(url);
    try {
      Map<String, dynamic> resultMap = json.decode(response.body);

      resultMap.forEach((key, value) {
        final appointment = Appointment.fromMap(value);
        appointment.id = key;
        appointments.add(appointment);
      });
    } catch (e) {
      stderr.write(e);
    }
    return appointments;
  }

  /// debemos cambiar esto para que sean dos llamadas distintas, service se encargara de la logica.

  @override
  Future<Appointment> newAppointment(appointment) async {
    const String baseUrl = FirebaseData.url;
    const storage = FlutterSecureStorage();

    /// Create a user appointment.
    final url = Uri.https(baseUrl, 'appointments/${appointment.userID}.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final response = await http.post(url, body: appointment.toJson());
    final decodeData = json.decode(response.body);

    appointment.id = decodeData['name'];

    return appointment;
  }

  ///
  @override
  Future<bool> updateAppointment(final appointment, final id) async {
    const String baseUrl = FirebaseData.url;
    const storage = FlutterSecureStorage();

    final url = Uri.https(baseUrl, 'appointments/${id}/${appointment.id}.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final response = await http.put(url, body: appointment.toJson());
    final decodeData = json.decode(response.body);
    if (decodeData == null) {
      return false;
    }

    return true;
  }
}
