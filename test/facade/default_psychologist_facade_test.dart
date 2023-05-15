import 'dart:ui';

import 'package:eqlibrum/dto/psychologist_dto.dart';
import 'package:eqlibrum/facade/impl/default_pyshologist_facade.dart';
import 'package:eqlibrum/mappers/impl/pyschologist_mapper.dart';
import 'package:eqlibrum/models/psychologist.dart';

import 'package:eqlibrum/services/impl/default_local_repository_service.dart';
import 'package:eqlibrum/services/impl/default_pyschologist_service.dart';

import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';

class MockPsychologistService extends Mock
    implements DefaultPsychologistService {}

class MockLocalRepositoryService extends Mock
    implements DefaultLocalRepositoryService {}

class MockMapper extends Mock implements PsychologistMapper {}

@GenerateMocks([DefaultPsychologistService, DefaultLocalRepositoryService, PsychologistMapper])
void main() {
  DartPluginRegistrant.ensureInitialized();

  late DefaultPsychologistService mockPsychologistService;
  late DefaultLocalRepositoryService mockLocalRepository;
  late PsychologistMapper mockMapper;
  List<Psychologist> testListPsychologist = [];
  List<PsychologistDTO> testListPsychologistDTO = [];

  Psychologist psychologist =
      Psychologist(id: 'test1', name: 'test1', surname: 'test1');
  testListPsychologist.add(psychologist);
  PsychologistDTO psychologistDTO =
      PsychologistDTO(id: 'test1', name: 'test1', surname: 'test1');
  testListPsychologistDTO.add(psychologistDTO);

  setUp(() {
    mockPsychologistService = MockPsychologistService();
    mockLocalRepository = MockLocalRepositoryService();
    mockMapper = PsychologistMapper();
  });

  DartPluginRegistrant.ensureInitialized();

  test('getAllPsychologist', () async {
    DefaultPsychologistFacade psychologistFacade = DefaultPsychologistFacade();
    expect(psychologistFacade.psychologistsDTO.length, 0);

    when(mockPsychologistService.getAllPsychologist())
        .thenAnswer((_) async => testListPsychologist);

    when(mockMapper.toDTOList(testListPsychologist))
        .thenAnswer((_) => testListPsychologistDTO);
    psychologistFacade.getAllPsychologist();
    expect(psychologistFacade.psychologistsDTO.length,
        testListPsychologistDTO.length);
  });

  test('getPsychologistName', () async {
    DefaultPsychologistFacade psychologistFacade = DefaultPsychologistFacade();

    when(mockPsychologistService.getPsychologistById("test1"))
        .thenAnswer((_) async => psychologist);
    when(mockMapper.toDTO(psychologist)).thenAnswer((_) => psychologistDTO);

    expect(psychologistFacade.getPsychologistName("test1"),
        "${psychologistDTO.name} ${psychologistDTO.surname}");
  });
}
