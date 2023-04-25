import 'package:eqlibrum/models/appointment.dart';
/// Service for managing appointment.
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class AppointmentService {
/// Get all existing appointment.
  Future <List<Appointment>> loadAppointment(String id);

/// Create new Appointment.
 Future<Appointment>createAppointment(Appointment appointment);

/// update a existing appointment.
 Future<bool> updateAppointment(Appointment appointment, String id);

}
