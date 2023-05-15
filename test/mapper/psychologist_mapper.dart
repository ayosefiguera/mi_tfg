import 'dart:ui';

import 'package:eqlibrum/dto/psychologist_dto.dart';
import 'package:eqlibrum/mappers/impl/pyschologist_mapper.dart';
import 'package:eqlibrum/models/psychologist.dart';

import 'package:test/test.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  List<Psychologist> enityList = [];
  List<PsychologistDTO> dtoList = [];
  Psychologist enity =
      Psychologist(id: 'test1', name: 'test1', surname: 'test1');
  PsychologistDTO dto =
      PsychologistDTO(id: 'test1', name: 'test1', surname: 'test1');
  setUp(() {
    enityList.add(enity);
    dtoList.add(dto);
  });

  test('toDto', () async {
    PsychologistMapper mapper = PsychologistMapper();
    PsychologistDTO result = mapper.toDTO(enity);
    expect(result.name, dto.name);
  });

  test('toEnity', () {
    PsychologistMapper mapper = PsychologistMapper();
    Psychologist result = mapper.toEntity(dto);
    expect(result.name, enity.name);
  });

  test('toDtoList', ()async {
    PsychologistMapper mapper = PsychologistMapper();
    List<PsychologistDTO> result =  mapper.toDTOList(enityList);
    expect(result.length, enityList.length);
  });
}
