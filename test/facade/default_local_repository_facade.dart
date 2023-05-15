import 'dart:ui';

import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/facade/impl/default_local_repository_facade.dart';
import 'package:eqlibrum/facade/impl/default_user_facade.dart';
import 'package:eqlibrum/facade/local_repository_facade.dart';
import 'package:eqlibrum/facade/user_facade.dart';
import 'package:eqlibrum/mappers/impl/user_mapper.dart';
import 'package:eqlibrum/models/user.dart';

import 'package:eqlibrum/services/impl/default_local_repository_service.dart';
import 'package:eqlibrum/services/impl/default_user_service.dart';
import 'package:eqlibrum/services/local_repository_service.dart';

import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';

class MockLocalRepository extends Mock implements LocalRepositoryService {}

class MockMapper extends Mock implements UserMapper {}

@GenerateMocks([LocalRepositoryService, UserMapper])
void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  late LocalRepositoryService mockLocalRepository;
  late UserMapper mockMapper;

  User user = User(id: 'test1', name: 'test1', surname: 'test1');
  UserDTO userDto = UserDTO(id: 'test1', name: 'test1', surname: 'test1');

  setUp(() {
    mockLocalRepository = MockLocalRepository();
    mockMapper = UserMapper();
  });

  //WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  test('getIdtoken_empty', () async {
    LocalRepositoryFacade localRepository = DefaultLocalRepositoryFacade();
    when(mockLocalRepository.getIdtoken())
        .thenAnswer((realInvocation) async => "");

    expect(localRepository.getIdtoken(), "");
  });

  test('getIdtoken', () async {
    LocalRepositoryFacade localRepository = DefaultLocalRepositoryFacade();
    when(mockLocalRepository.getIdtoken())
        .thenAnswer((realInvocation) async => "idToken");

    expect(localRepository.getIdtoken(), "idToken");
  });

  test('load_user', () async {
    LocalRepositoryFacade localRepository = DefaultLocalRepositoryFacade();
    when(mockLocalRepository.getUser())
        .thenAnswer((realInvocation) async => user);

    expect(localRepository.getUser(), userDto);
  });


  test("getCurrentUser", () async {
    DefaultLocalRepositoryFacade localRepository =
        DefaultLocalRepositoryFacade();
    localRepository.currentUser = userDto;
    UserDTO result = await localRepository.getUser();
    expect(result.name, userDto.name);
  });

    test("getROl", () async {
    DefaultLocalRepositoryFacade localRepository =
        DefaultLocalRepositoryFacade();
    localRepository.currentUser = userDto;
    UserDTO result = await localRepository.getUser();
    expect(result.rol, userDto.rol);
  });


}
