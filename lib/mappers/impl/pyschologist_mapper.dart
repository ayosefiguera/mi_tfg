import 'package:eqlibrum/constanst.dart';
import 'package:eqlibrum/dto/psychologist_dto.dart';
import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/mappers/enity_mapper.dart';
import 'package:eqlibrum/models/psychologist.dart';

class PsychologistMapper
    implements EntityMapper<PsychologistDTO, Psychologist> {
  // ignore: constant_identifier_names
  static const DEFAUL_PICTURE =
      "https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814_1280.jpg";
  @override
  PsychologistDTO toDTO(Psychologist entity) {
    PsychologistDTO target = PsychologistDTO();
    target.id = entity.id;
    target.name = entity.name;
    target.surname = entity.surname;
    target.picture = entity.picture ?? DEFAUL_PICTURE;
    target.name = entity.name;
    target.summary = entity.summary;
    target.bio = entity.bio;
    target.vote = entity.vote;

    return target;
  }

  @override
  List<PsychologistDTO> toDTOList(List<Psychologist> source) {
    List<PsychologistDTO> targetList = [];
    for (var element in source) {
      targetList.add(toDTO(element));
    }

    return targetList;
  }

  @override
  Psychologist toEntity(UserDTO source) {
    Psychologist target = Psychologist(
        id: source.id ?? '',
        name: source.name ?? '',
        email: source.email ?? '',
        surname: source.surname ?? '',
        pass: source.pass ?? '',
        rol: Constants.PSYCHOLOGIST,
        timestamp: DateTime.now().millisecondsSinceEpoch);
    return target;
  }
}
