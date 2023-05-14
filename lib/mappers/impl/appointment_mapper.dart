import 'package:eqlibrum/dto/appointment_dto.dart';
import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/facade/impl/default_local_repository_facade.dart';
import 'package:eqlibrum/facade/impl/default_pyshologist_facade.dart';
import 'package:eqlibrum/facade/impl/default_user_facade.dart';
import 'package:eqlibrum/facade/local_repository_facade.dart';
import 'package:eqlibrum/facade/psychologist_facade.dart';
import 'package:eqlibrum/facade/user_facade.dart';
import 'package:eqlibrum/models/appointment.dart';

class AppointmentMapper {
  LocalRepositoryFacade localRepository = DefaultLocalRepositoryFacade();
  UserFacade userFacade = DefaultUserFacade();
  PsychologistFacade psychologistFacade = DefaultPsychologistFacade();

  Future<AppointmentDTO> toDTO(Appointment source) async {
    AppointmentDTO target = AppointmentDTO();
    target.id = source.id;
    target.psychologistID = source.psychologistID;
    target.psychologistFullName =
        await getPsychologistName(source.psychologistID);
    target.userID = source.userID;
    target.userFullName = await getPatientName(source.userID);
    target.date = source.date;
    target.status = source.status;
    return target;
  }

  Future<List<AppointmentDTO>> toDTOList(List<Appointment> source) async {
    List<AppointmentDTO> targetList = [];
    for (var element in source) {
      targetList.add(await toDTO(element));
    }
    return targetList;
  }

  Appointment toEntity(AppointmentDTO source) {
    Appointment target = Appointment(
        psychologistID: source.psychologistID!,
        status: source.status,
        date: source.date!,
        userID: source.id);
    return target;
  }

  Future<String> getPsychologistName(String id) async {
    String name = "";
    UserDTO currentUser = localRepository.getCurrentUser();
    if (id == currentUser.id) {
      name = "${currentUser.name} ${currentUser.surname}";
    } else {
      name = await psychologistFacade.getPsychologistName(id);
    }
    return name;
  }

  Future<String> getPatientName(String? id) async {
    String name = "unasigned";
    /*if (id != null) {
      UserDTO currentUser = localRepository.getCurrentUser();
      if (id == currentUser.id) {
        name = "${currentUser.name} ${currentUser.surname}";
      } else {
        name = await userFacade.getUserNameById(id);
      }
    }*/
    return name;
  }
}
