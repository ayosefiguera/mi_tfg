import 'package:eqlibrum/daos/appointment_dao.dart';
import 'package:eqlibrum/daos/impl/default_appointment_dao.dart';
import 'package:eqlibrum/models/appointment.dart';
import 'package:eqlibrum/services/appointment_service.dart';

///Default implementation of [AppointmentService]
class DefaultAppointmentService implements AppointmentService {
  AppointmentDAO _appointmentDAO = DefaultAppointmentDAO();

  @override
  Future<List<Appointment>> loadAppointment(String id) async {
    return await _getAppointmentDao().loadAppointment(id);
  }

  @override
  Future<Appointment> requestAppointment(final appointment) {
    return _getAppointmentDao().requestAppointment(appointment);
  }

  @override
  Future<bool> createAppointment(Appointment appointment) async {
    return _getAppointmentDao().createAppointment(appointment);
  }

  @override
  Future<bool> updateAppointment(final appointment, final id) {
    return _getAppointmentDao().updateAppointment(appointment, id);
  }

  @override
     Future<bool> deleteAppointment(final Appointment appointment, final String id){
    return _getAppointmentDao().deleteAppointment(appointment, id);
  }

  void setAppointmnetDao(AppointmentDAO appointmentDAO) {
    _appointmentDAO = appointmentDAO;
  }

  AppointmentDAO _getAppointmentDao() {
    return _appointmentDAO;
  }
}
