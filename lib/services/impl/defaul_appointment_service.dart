import 'package:eqlibrum/daos/appointment_dao.dart';
import 'package:eqlibrum/daos/impl/default_appointment_dao.dart';
import 'package:eqlibrum/models/appointment.dart';
import 'package:eqlibrum/services/appointment_service.dart';

///Default implementation of [AppointmentService]
class DefaultAppointmentService implements AppointmentService {
  final AppointmentDAO psychologistDAO = DefaultAppointmentDAO();
  @override
  Future<List<Appointment>> loadAppointment(String id) async {
    List<Appointment> result = await psychologistDAO.loadAppointment(id);
    return result;
  }

  @override
  Future<Appointment> createAppointment(final appointment) {
    return DefaultAppointmentDAO().newAppointment(appointment);
  }

  @override
  Future<bool> updateAppointment(final appointment, final id) {
    return DefaultAppointmentDAO().updateAppointment(appointment, id);
  }
}
