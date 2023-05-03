import 'package:eqlibrum/dto/psychologist_dto.dart';
import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/mappers/enity_mapper.dart';
import 'package:eqlibrum/models/psychologist.dart';

class PsychologistMapper
    implements EntityMapper<PsychologistDTO, Psychologist> {
  static const DEFAUL_PICTURE =
      "https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814_1280.jpg";
  static const PSYCHOLOGIST = "psychologist";
  PsychologistDTO toDTO(Psychologist entity) {
    throw UnimplementedError();
  }

  @override
  List<PsychologistDTO> toDTOList(List<Psychologist> source) {
    List<PsychologistDTO> targetList = [];
    source.forEach((element) {
      PsychologistDTO target = PsychologistDTO();
      target.id = element.id;
      target.name = element.name;
      target.surname = element.surname;
      target.picture = element.picture ?? DEFAUL_PICTURE;
      target.name = element.name;
      target.summary = element.summary;
      target.bio = element.bio;
      target.vote = element.vote;
      targetList.add(target);
    });

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
        rol: PSYCHOLOGIST,
        timestamp: DateTime.now().millisecondsSinceEpoch);
    return target;
  }

  @override
  Psychologist updateEntity(PsychologistDTO dto, Psychologist baseEntity) {
    // TODO: implement updateEntity
    throw UnimplementedError();
  }
}
