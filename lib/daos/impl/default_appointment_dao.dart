import 'dart:io';
import 'package:eqlibrum/constanst.dart';
import 'package:eqlibrum/apis/api_key.dart';
import 'package:eqlibrum/daos/appointment_dao.dart';
import 'package:eqlibrum/models/appointment.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Default implementation to [AppointmentDAO]
class DefaultAppointmentDAO implements AppointmentDAO {
  static const String baseUrl = FirebaseData.url;
  static const storage = FlutterSecureStorage();
  final String _key = Auth.key;

  @override
  Future<List<Appointment>> loadAppointment(final id) async {
    List<Appointment> appointments = [];

    final url = Uri.https(baseUrl, 'appointments/$id.json',
        {'auth': await storage.read(key: Constants.USER_TOKEN) ?? ''});
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

  @override
  Future<Appointment> requestAppointment(appointment) async {
    final url = Uri.https(
        baseUrl, 'appointments/${appointment.userID}.json', {'key': _key});
    final response = await http.post(url, body: appointment.toJson());
    final decodeData = json.decode(response.body);

    appointment.id = decodeData['name'];

    return appointment;
  }

  ///
  @override
  Future<bool> updateAppointment(final appointment, final id) async {
    final url = Uri.https(
        baseUrl, 'appointments/$id/${appointment.id}.json', {'key': _key});
    final response = await http.put(url, body: appointment.toJson());
    return response.statusCode == 200;
  }

  @override
  Future<bool> createAppointment(Appointment appointment) async {
    final url = Uri.https(baseUrl,
        'appointments/${appointment.psychologistID}.json', {'key': _key});
    final response = await http.post(url, body: appointment.toJson());
    final decodeData = json.decode(response.body);

    if (decodeData == null) {
      return false;
    }
    return true;
  }

  @override
  Future<bool> deleteAppointment(
      final Appointment appointment, final String id) async {
    final url = Uri.https(
        baseUrl, 'appointments/$id/${appointment.id}.json', {'key': _key});

    final response = await http.delete(url);
    return (response.statusCode == 200) ? true : false;
  }
}
