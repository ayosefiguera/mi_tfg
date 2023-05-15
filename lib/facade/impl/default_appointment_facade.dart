import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:eqlibrum/constanst.dart';
import 'package:eqlibrum/dto/appointment_dto.dart';
import 'package:eqlibrum/facade/appointment_facade.dart';
import 'package:eqlibrum/mappers/impl/appointment_mapper.dart';
import 'package:eqlibrum/models/appointment.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:eqlibrum/services/appointment_service.dart';
import 'package:eqlibrum/services/impl/default_appointment_service.dart';
import 'package:eqlibrum/services/impl/default_local_repository_service.dart';
import 'package:eqlibrum/services/local_repository_service.dart';
import 'package:eqlibrum/services/notificacion_service.dart';
import 'package:eqlibrum/utils/utils.dart';
import 'package:table_calendar/table_calendar.dart';

class DefaultAppointmentFacade implements AppointmentFacade {
  AppointmentService _appointmentService = DefaultAppointmentService();
  LocalRepositoryService _localRepositoryService =
      DefaultLocalRepositoryService();
  AppointmentMapper mapper = AppointmentMapper();

  User user = User();

  var kAppointment = LinkedHashMap<DateTime, List<AppointmentDTO>>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  @override
  Future<bool> loadAppointment(String id) async {
    if (id == '') {
      user = await _getLocalRepositoryService().getUser();
      id = user.id!;
    }

    if (kAppointment.isNotEmpty) {
      return true;
    }

    List<Appointment> tempAppointments =
        await _getAppointmentService().loadAppointment(id);

    List<AppointmentDTO> appointments =
        await mapper.toDTOList(tempAppointments);

    try {
      for (var element in appointments) {
        kAppointment.containsKey(element.date)
            ? kAppointment.update(element.date!, (value) => [...value, element])
            : kAppointment.addAll({
                element.date!: [element]
              });
      }
    } catch (e) {
      stderr.write(e);
      return false;
    }
    return true;
  }

  @override
  List<AppointmentDTO> getEventsForDay(final DateTime day) {
    return kAppointment[day] ?? [];
  }

  @override
  Future<bool> requestAppointment(final AppointmentDTO appointment) async {
    user = await _getLocalRepositoryService().getUser();
    bool createValidation = false;

    if (appointment.date!.isBefore(DateTime.now())) {
    appointment.status = Constants.CLOSE;
    appointment.userID = user.id;
    await _getAppointmentService()
        .createAppointment(mapper.toEntity(appointment), appointment.userID!);
    await _getAppointmentService().updateAppointment(
        mapper.toEntity(appointment), appointment.psychologistID!);
    }
    return createValidation;
  }

  @override
  Future<bool> createNewAppointment(final DateTime dateTimeAppointment) async {
    
    bool createValidation = false;
    if(dateTimeAppointment.isAfter(DateTime.now())){
    user = await _getLocalRepositoryService().getUser();
    if (user.rol == Constants.PSYCHOLOGIST) {
      Appointment appointment = Appointment(
          psychologistID: user.id!,
          date: dateTimeAppointment,
          status: Constants.OPEN);
      createValidation = await _getAppointmentService()
          .createAppointment(appointment, user.id!);
    } else {
      NotificacionService.showSnackbar(
          "The user is unable to open new appointments");
    }
    }
    return createValidation;
  }

  @override
  Future<bool> deleteAppointment(
      final AppointmentDTO appointment, final String id) {
    return _getAppointmentService()
        .deleteAppointment(mapper.toEntity(appointment), id);
  }

  @override
  Future<bool> updateAppointment(final AppointmentDTO appointment, String id) {
    return _getAppointmentService()
        .updateAppointment(mapper.toEntity(appointment), id);
  }

  @override
  Future<bool> cancelAppointment(final AppointmentDTO appointment) async {
    User currentUser = await _getLocalRepositoryService().getUser();
    bool isSucces = false;

    if (appointment.userID != null && currentUser.id == appointment.userID) {
      String userId = appointment.userID!;
      appointment.status = Constants.OPEN;
      appointment.userID = null;
      isSucces = await deleteAppointment(appointment, userId);
    }

    if (appointment.userID != null &&
        currentUser.id == appointment.psychologistID) {
      appointment.status = Constants.CANCEL;
      isSucces &= await _getAppointmentService()
          .updateAppointment(mapper.toEntity(appointment), appointment.userID!);
    }

    if (appointment.userID == null &&
        currentUser.id == appointment.psychologistID) {
      appointment.status = Constants.CLOSE;
      isSucces &= await _getAppointmentService().updateAppointment(
          mapper.toEntity(appointment), appointment.psychologistID!);
    }

    isSucces &= await _getAppointmentService().updateAppointment(
        mapper.toEntity(appointment), appointment.psychologistID!);
    if (isSucces) {
      NotificacionService.showSnackbar("The date has been cancelled");
    } else {
      NotificacionService.showSnackbar(
          "The appointment could not be cancelled.");
    }
    return isSucces;
  }

  void setAppointmentService(AppointmentService appointmentService) {
    _appointmentService = appointmentService;
  }

  AppointmentService _getAppointmentService() {
    return _appointmentService;
  }

  void setLocalRepositoryService(
      LocalRepositoryService localRepositoryService) {
    _localRepositoryService = localRepositoryService;
  }

  LocalRepositoryService _getLocalRepositoryService() {
    return _localRepositoryService;
  }

  @override
  List<AppointmentDTO> getAppointmentList() {
    List<AppointmentDTO> appointments = [];
    kAppointment.forEach((key, value) {
      appointments.addAll(value);
    });
    appointments.sort((a, b) => a.date!.day - b.date!.day);
    return appointments;
  }
}
