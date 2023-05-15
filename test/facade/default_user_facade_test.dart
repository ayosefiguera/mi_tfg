import 'dart:ui';

import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/facade/impl/default_user_facade.dart';
import 'package:eqlibrum/facade/user_facade.dart';
import 'package:eqlibrum/mappers/impl/user_mapper.dart';
import 'package:eqlibrum/models/user.dart';

import 'package:eqlibrum/services/impl/default_local_repository_service.dart';
import 'package:eqlibrum/services/impl/default_user_service.dart';

import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';

class MockUserService extends Mock implements DefaultUserService {}

class MockLocalRepositoryService extends Mock
    implements DefaultLocalRepositoryService {}

class MockMapper extends Mock implements UserMapper {}

@GenerateMocks([DefaultUserService, DefaultLocalRepositoryService, UserMapper])
void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  late DefaultUserService mockUserService;
  late DefaultLocalRepositoryService mockLocalRepository;
  late UserMapper mockMapper;

  User user = User(id: 'test1', name: 'test1', surname: 'test1');
  UserDTO userDto = UserDTO(id: 'test1', name: 'test1', surname: 'test1');

  setUp(() {
    mockUserService = MockUserService();
    mockLocalRepository = MockLocalRepositoryService();
    mockMapper = UserMapper();
  });

  //WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  test('createUser', () async {
    UserFacade userFacade = DefaultUserFacade();
    when(mockUserService.createUser(user)).thenAnswer((_) async => true);

    expect(userFacade.createUser(userDto), true);
  });

  test('getUserNameById', () async {
    DefaultUserFacade userFacade = DefaultUserFacade();
    when(mockUserService.getUserById("test1")).thenAnswer((_) async => user);
    userFacade.getUserNameById("test1");
    expect( userFacade.getUserNameById("test1"), "${user.name} ${user.surname}");
  });

    test('getUserNameById_notfound', () async {
    DefaultUserFacade userFacade = DefaultUserFacade();
    when(mockUserService.getUserById("test1")).thenAnswer((_) async => null);
    userFacade.getUserNameById("test1");
    expect( userFacade.getUserNameById(""), "");
  });
}
