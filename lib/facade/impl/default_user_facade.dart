import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/facade/user_facade.dart';
import 'package:eqlibrum/mappers/impl/user_mapper.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:eqlibrum/services/impl/default_user_service.dart';
import 'package:eqlibrum/services/user_service.dart';
import 'package:flutter/material.dart';

class DefaultUserFacade extends ChangeNotifier implements UserFacade {
  UserMapper mapper = UserMapper();
  UserService _userService = DefaultUserService();

  @override
  Future<bool> createUser(UserDTO newUserDTO) {
    return _getUserService().createUser(mapper.toEntity(newUserDTO));
  }

  @override
  Future<bool> getUser() async {
    return true;
  }

  @override
  Future<String> getUserNameById(final String id) async {
    User? user = await _getUserService().getUserById(id);
    return (user != null) ? "${user.name} ${user.surname}" : "";
  }

  @override
  logout() {
    _getUserService().logout();
  }

  @override
  Future<bool> loginUser(final userDTO) {
    notifyListeners();
    return _getUserService().loginUser(mapper.toEntity(userDTO));
  }

  @override
  Future<String> getIdToken() {
    return _getUserService().getIdtoken();
  }

  @override
  Future<bool> updateUser(final UserDTO userDTO) async {
    return _getUserService().updateUser(mapper.toEntity(userDTO));
  }

  @override
  Future<bool> deleteUser() async {
    return _getUserService().deleteUser();
  }

  UserService _getUserService() {
    return _userService;
  }

  void setUserService(UserService userService) {
    _userService = userService;
  }
}
