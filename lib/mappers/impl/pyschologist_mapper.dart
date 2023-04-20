import 'package:eqlibrum/dto/psychologist_dto.dart';
import 'package:eqlibrum/mappers/enity_mapper.dart';
import 'package:eqlibrum/models/psychologist.dart';

class PsychologistMapper
    implements EntityMapper<PsychologistDTO, Psychologist> {
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
      target.picture = element.picture;
      target.name = element.name;
      target.summary = element.summary;
      target.bio = element.bio;
      target.vote = element.vote;

      targetList.add(target);
    });

    return targetList;
  }

  @override
  Psychologist toEntity(PsychologistDTO dto) {
    // TODO: implement toEntity
    throw UnimplementedError();
  }

  @override
  Psychologist updateEntity(PsychologistDTO dto, Psychologist baseEntity) {
    // TODO: implement updateEntity
    throw UnimplementedError();
  }
}
