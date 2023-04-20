import 'dart:collection';
import 'dart:io';

import 'package:eqlibrum/facade/appointment_facade.dart';
import 'package:eqlibrum/models/appointment.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:eqlibrum/services/appointment_service.dart';
import 'package:eqlibrum/services/impl/defaul_appointment_service.dart';
import 'package:eqlibrum/services/impl/default_user_service.dart';
import 'package:eqlibrum/services/user_service.dart';
import 'package:eqlibrum/utils/utils.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:table_calendar/table_calendar.dart';

class DefaultAppointmentFacade extends ChangeNotifier
    implements AppointmentFacade {
  final storage = FlutterSecureStorage();

  final AppointmentService _appointmentService = DefaultAppointmentService();
  final UserService _userService = DefaultUserService();

  bool isLoading = false;

  final kAppointment = LinkedHashMap<DateTime, List<Appointment>>(
    equals: isSameDay,
    hashCode: getHashCode,
  );
  User user = User();

  DefaultAppointmentFacade() {
    loadAppointment();
  }

  @override
  loadAppointment() async {
    isLoading = true;
    notifyListeners();

    user = await _userService.getUser();
    List<Appointment> appointments =
        await _appointmentService.loadAppointment(user);

    try {
      appointments.forEach((element) {
        kAppointment.containsKey(element.date)
            ? kAppointment.update(element.date, (value) => [...value, element])
            : kAppointment.addAll({
                element.date: [element]
              });
      });
    } catch (e) {
      stderr.write(e);
    }
    isLoading = false;
    notifyListeners();
  }

  @override
  List<Appointment> getEventsForDay(DateTime day) {
    return kAppointment[day] ?? [];
  }
}
