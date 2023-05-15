import 'dart:ui';

import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/mappers/impl/user_mapper.dart';
import 'package:eqlibrum/models/user.dart';


import 'package:test/test.dart';


void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  List<User> userList = [];
  List<UserDTO> userDtoList = [];
  User user = User(id: 'test1', name: 'test1', surname: 'test1');
  UserDTO userDto = UserDTO(id: 'test1', name: 'test1', surname: 'test1');

  setUp(() {
    userList.add(user);
    userDtoList.add(userDto);
  });

  test('toDto', () {
    UserMapper mapper = UserMapper();
    expect(mapper.toDTO(user).name, userDto.name);
  });


  test('toEnity', () {
    UserMapper mapper = UserMapper();
    User result = mapper.toEntity(userDto);
    expect(result.name, userDto.name);
  });
}
