import 'package:eqlibrum/dto/appointment_dto.dart';

// Facade for managing appointment
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class AppointmentFacade {
  /// Load alll appointment by id given.
  /// return [LinkedHashMap<DateTime, List<Appointment>>] the list og all existing categories.

  loadAppointment(String id);

  /// Get appointment with a
  ///
  /// return [List] the list of al psychologist.
  List<AppointmentDTO> getEventsForDay(DateTime day);

  Future<bool> requestAppointment(AppointmentDTO appointment);

  /// Create new appointment.
  /// Returns [bool] the operation was successful or not.
  Future<bool> createAppointment(DateTime dateAppointment);

  /// update a existing appointment.
  /// Returns [bool] the operation was successful or not.

  Future<bool> updateAppointment(AppointmentDTO appointment, String id);

  /// Delete appointment.
  /// Returns [bool] the operation was successful or not.
  Future<bool> deleteAppointment(AppointmentDTO appointment, String id);

  /// Delete appointment.
  /// Returns [bool] the operation was successful or not.
  Future<bool> cancelAppointment(AppointmentDTO appointment);
}
