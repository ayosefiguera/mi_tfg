import 'dart:collection';

import 'package:eqlibrum/models/appointment.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';

// Facade for managing appointment
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class AppointmentFacade extends ChangeNotifier {
  /// Load alll appointment.
  /// return [LinkedHashMap<DateTime, List<Appointment>>] the list og all existing categories.

  loadAppointment();

  /// Get appointment with a
  ///
  /// return [List] the list of al psychologist.
  List<Appointment> getEventsForDay(DateTime day);
}
