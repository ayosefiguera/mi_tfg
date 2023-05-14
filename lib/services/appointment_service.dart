import 'package:eqlibrum/models/appointment.dart';

/// Service for managing appointment.
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class AppointmentService {
  /// Get all existing appointment.
  Future<List<Appointment>> loadAppointment(String id);

  /// Create new Appointment.
  Future<Appointment> requestAppointment(Appointment appointment);

  /// Create new appointment.
  /// Returns [bool] the operation was successful or not.
  Future<bool> createAppointment(Appointment appointment, String id);

  /// update a existing appointment.
  /// Returns [bool] the operation was successful or not.

  Future<bool> updateAppointment(Appointment appointment, String id);

  /// Delete appointment.
  /// Returns [bool] the operation was successful or not.
   Future<bool> deleteAppointment(Appointment appointment, String id);
}
