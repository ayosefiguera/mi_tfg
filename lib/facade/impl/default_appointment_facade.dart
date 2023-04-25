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
import 'package:table_calendar/table_calendar.dart';

class DefaultAppointmentFacade implements AppointmentFacade {
  final AppointmentService _appointmentService = DefaultAppointmentService();
  final UserService _userService = DefaultUserService();

  bool isLoading = false;
  User user = User();

  final kAppointment = LinkedHashMap<DateTime, List<Appointment>>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  @override
  Future<bool> loadAppointment(String id) async {
    if (id.isEmpty) {
      user = await _userService.getUser();
      id = user.id!;
    }

    if (kAppointment.isNotEmpty) {
      return true;
    }

    isLoading = true;

    List<Appointment> appointments =
        await _appointmentService.loadAppointment(id);

    try {
      for (var element in appointments) {
        kAppointment.containsKey(element.date)
            ? kAppointment.update(element.date, (value) => [...value, element])
            : kAppointment.addAll({
                element.date: [element]
              });
      }
    } catch (e) {
      stderr.write(e);
      return false;
    }
    isLoading = false;
    return true;
  }

  @override
  List<Appointment> getEventsForDay(final DateTime day) {
    return kAppointment[day] ?? [];
  }

  @override
  Future<bool> requestAppointment(final Appointment appointment) async {
    user = await _userService.getUser();
    appointment.avaliable = false;
    appointment.userID = user.id;

    await _appointmentService.updateAppointment(
        appointment, appointment.userID!);
    await _appointmentService.updateAppointment(
        appointment, appointment.psychologistID);

    return true;
  }
}
