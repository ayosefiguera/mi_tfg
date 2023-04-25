import 'package:eqlibrum/models/appointment.dart';

// Facade for managing appointment
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class AppointmentFacade {
  /// Load alll appointment.
  /// return [LinkedHashMap<DateTime, List<Appointment>>] the list og all existing categories.

  loadAppointment(String id);

  /// Get appointment with a
  ///
  /// return [List] the list of al psychologist.
  List<Appointment> getEventsForDay(DateTime day);

  Future<bool> requestAppointment(Appointment appointment);
}
