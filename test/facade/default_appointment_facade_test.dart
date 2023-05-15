import 'dart:ui';

import 'dart:collection';

import 'package:eqlibrum/constanst.dart';
import 'package:eqlibrum/dto/appointment_dto.dart';
import 'package:eqlibrum/mappers/impl/appointment_mapper.dart';
import 'package:eqlibrum/models/appointment.dart';

import 'package:eqlibrum/services/impl/default_appointment_service.dart';
import 'package:eqlibrum/services/impl/default_local_repository_service.dart';

import 'package:eqlibrum/utils/utils.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:eqlibrum/facade/impl/default_appointment_facade.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';

class MockAppointmentService extends Mock
    implements DefaultAppointmentService {}

class MockLocalRepositoryService extends Mock
    implements DefaultLocalRepositoryService {}

class MockMapper extends Mock implements AppointmentMapper {}

@GenerateMocks([
  DefaultAppointmentService,
  DefaultLocalRepositoryService,
  AppointmentMapper
])
void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  var testkAppointment = LinkedHashMap<DateTime, List<AppointmentDTO>>(
      equals: isSameDay, hashCode: getHashCode);

  late DefaultAppointmentService mockAppointmentService;
  late DefaultLocalRepositoryService mockLocalRepository;
  late AppointmentMapper mockMapper;

  const String testId = 'id123';

  final Appointment testAppoinment = Appointment(
      psychologistID: testId, date: DateTime.now(), status: Constants.OPEN);
  final AppointmentDTO testAppoinmentDTO = AppointmentDTO(
      psychologistID: testId, date: DateTime.now(), status: Constants.OPEN);

  final List<Appointment> testList = [];
  testList.add(testAppoinment);

  final List<AppointmentDTO> testListDTO = [];
  testListDTO.add(testAppoinmentDTO);

  setUp(() {
    mockAppointmentService = MockAppointmentService();
    mockLocalRepository = MockLocalRepositoryService();
    mockMapper = AppointmentMapper();

    for (var element in testListDTO) {
      testkAppointment.containsKey(element.date)
          ? testkAppointment.update(
              element.date!, (value) => [...value, element])
          : testkAppointment.addAll({
              element.date!: [element]
            });
    }
  });

  //WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  test('loadAppointment_with_id', () async {
    when(mockAppointmentService.loadAppointment(testId))
        .thenAnswer((_) async => testList);

    when(mockMapper.toDTOList(testList)).thenAnswer((_) async => testListDTO);

    final appointmentFacade = DefaultAppointmentFacade();
    appointmentFacade.setAppointmentService(mockAppointmentService);
    appointmentFacade.setLocalRepositoryService(mockLocalRepository);

    expect(appointmentFacade.kAppointment.isEmpty, true);

    appointmentFacade.loadAppointment(testId);

    expect(appointmentFacade.kAppointment.isEmpty, false);
  });

  test('getAppointment_today', () async {
    final appointmentFacade = DefaultAppointmentFacade();
    appointmentFacade.kAppointment = testkAppointment;
    expect(appointmentFacade.getEventsForDay(DateTime.now()).length, 1);
  });
  test('getAppointment_otherDay', () async {
    final appointmentFacade = DefaultAppointmentFacade();
    appointmentFacade.kAppointment = testkAppointment;
    expect(
        appointmentFacade
            .getEventsForDay(DateTime.now().add(Duration(days: 1)))
            .length,
        0);
  });

  test('requestAppointment_After', () async {
    when(mockAppointmentService.createAppointment(testAppoinment, testId))
        .thenAnswer((_) => Future.value(true));

    when(mockMapper.toEntity(testAppoinmentDTO)).thenReturn(testAppoinment);

    final appointmentFacade = DefaultAppointmentFacade();
    appointmentFacade.setAppointmentService(mockAppointmentService);
    appointmentFacade.setLocalRepositoryService(mockLocalRepository);
    testAppoinmentDTO.date = DateTime.now().add(Duration(days: 1));
    appointmentFacade.requestAppointment(testAppoinmentDTO);
    expect(
        await appointmentFacade.requestAppointment(testAppoinmentDTO), false);
  });

  test('requestAppointment_Before', () async {
    when(mockAppointmentService.createAppointment(testAppoinment, testId))
        .thenAnswer((_) => Future.value(false));

    when(mockMapper.toDTOList(testList)).thenAnswer((_) async => testListDTO);

    final appointmentFacade = DefaultAppointmentFacade();
    appointmentFacade.setAppointmentService(mockAppointmentService);
    appointmentFacade.setLocalRepositoryService(mockLocalRepository);
    testAppoinmentDTO.date = DateTime.now().subtract(Duration(days: 1));
    appointmentFacade.requestAppointment(testAppoinmentDTO);
    expect(
        await appointmentFacade.requestAppointment(testAppoinmentDTO), false);
  });
}
