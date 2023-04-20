import 'package:eqlibrum/models/appointment.dart';
import 'package:eqlibrum/models/user.dart';

/// An interfac for the appointment DAO including operations for retrieving 
/// persistend appointment model objects
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class AppointmentDAO {

/// Return a list of appointmet models thar are currently persisted. 
/// If none are found an emty list is returned.
/// Returns [List<Appointment>] The list of Appointment.
  Future<List<Appointment>> loadAppointment(User user);

}
