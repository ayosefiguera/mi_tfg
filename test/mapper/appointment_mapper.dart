import 'dart:ui';

import 'package:eqlibrum/constanst.dart';
import 'package:eqlibrum/dto/appointment_dto.dart';
import 'package:eqlibrum/mappers/impl/appointment_mapper.dart';
import 'package:eqlibrum/models/appointment.dart';
import 'package:eqlibrum/models/psychologist.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:eqlibrum/services/impl/default_pyschologist_service.dart';
import 'package:eqlibrum/services/impl/default_user_service.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';

class MockPsychologistService extends Mock
    implements DefaultPsychologistService {}

class MockUserService extends Mock implements DefaultUserService {}

@GenerateMocks([
  MockPsychologistService,
  DefaultUserService,
])
void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  late DefaultPsychologistService mockPsychologistService;
  late DefaultUserService mockUserService;

  List<Appointment> enityList = [];
  List<AppointmentDTO> dtoList = [];
  User user = User(name: "test", surname: "test");
  Psychologist psychologist = Psychologist(name: "test", surname: "test");
  Appointment enity = Appointment(
      date: DateTime.now(),
      userID: '1234',
      psychologistID: '1234',
      status: Constants.OPEN);
  AppointmentDTO dto = AppointmentDTO(
      date: DateTime.now(),
      userFullName: "test test",
      psychologistFullName: "test test",
      userID: '1234',
      psychologistID: '1234',
      status: Constants.OPEN);

  setUp(() {
    mockUserService = MockUserService();
    mockPsychologistService = MockPsychologistService();

    enityList.add(enity);
    dtoList.add(dto);
  });

  test('toDto', () async {
    AppointmentMapper mapper = AppointmentMapper();
    when(mockUserService.getUserById("1234")).thenAnswer((_) async => user);
    when(mockPsychologistService.getPsychologistById("1234"))
        .thenAnswer((_) async => psychologist);
    AppointmentDTO result = await mapper.toDTO(enity);
    expect(result.psychologistID, dto.psychologistID);
  });

  test('toEnity', () {
    AppointmentMapper mapper = AppointmentMapper();
    Appointment result = mapper.toEntity(dto);
    expect(result.psychologistID, enity.psychologistID);
  });

  test('toDtoList', () async {
    AppointmentMapper mapper = AppointmentMapper();
    List<AppointmentDTO> result = await mapper.toDTOList(enityList);
    expect(result.length, enityList.length);
  });
}
