import 'package:eqlibrum/models/appointment.dart';
import 'package:eqlibrum/models/user.dart';
/// Service for managing appointment.
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class AppointmentService {
/// Get all existing appointment.
  Future <List<Appointment>> loadAppointment(User user);

}
