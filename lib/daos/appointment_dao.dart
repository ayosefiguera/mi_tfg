import 'package:eqlibrum/models/appointment.dart';

/// An interfac for the appointment DAO including operations for retrieving
/// persistend appointment model objects
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class AppointmentDAO {
  /// Return a list of appointmet models thar are currently persisted.
  /// If none are found an emty list is returned.
  /// Returns [List<Appointment>] The list of Appointment.
  Future<List<Appointment>> loadAppointment(String id);

  /// User Request a existing Appointment
  /// Returns [bool] the operation was successful or not.
  Future<Appointment> requestAppointment(Appointment appointment);

  /// Create new appointment.
  /// Returns [bool] the operation was successful or not.
  Future<bool> createAppointment(Appointment appointment, String id);

  /// Update existing appointment.
  /// Returns [bool] the operation was successful or not.
  Future<bool> updateAppointment(Appointment appointment, String id);

  /// Delete appointment.
  /// Returns [bool] the operation was successful or not.
  Future<bool> deleteAppointment(Appointment appointment, String id);
}
