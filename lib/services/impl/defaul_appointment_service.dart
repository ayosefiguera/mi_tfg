import 'package:eqlibrum/daos/appointment_dao.dart';
import 'package:eqlibrum/daos/impl/default_appointment_dao.dart';
import 'package:eqlibrum/models/appointment.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:eqlibrum/services/appointment_service.dart';

///Default implementation of [AppointmentService]
class DefaultAppointmentService implements AppointmentService {
  final AppointmentDAO psychologistDAO = DefaultAppointmentDAO();
  @override
  Future<List<Appointment>> loadAppointment(User user) async {
    List<Appointment> result = await psychologistDAO.loadAppointment(user);
    return result;
  }
}
