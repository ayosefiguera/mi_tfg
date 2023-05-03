import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/facade/user_facade.dart';
import 'package:eqlibrum/mappers/impl/user_mapper.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:eqlibrum/services/impl/default_user_service.dart';
import 'package:flutter/material.dart';

class DefaultUserFacade extends ChangeNotifier implements UserFacade {
  UserDTO userDTO = UserDTO();
  UserMapper mapper = UserMapper();

  final DefaultUserService defaultUserService = DefaultUserService();

  @override
  Future<bool> createUser(UserDTO newUserDTO) {
    return getUserService().createUser(mapper.toEntity(newUserDTO));
  }

  @override
  Future<bool> getUser() async {
    userDTO = mapper.toDTO(await getUserService().getUser());
    return true;
  }

  @override
  logout() {
    getUserService().logout();
  }

  @override
  Future<bool> loginUser(final userDTO) {
    notifyListeners();
    return getUserService().loginUser(mapper.toEntity(userDTO));
  }

  DefaultUserService getUserService() {
    return defaultUserService;
  }

  @override
  Future<String> getIdToken() {
    return getUserService().getIdtoken();
  }

  @override
  Future<bool> updateUser(final UserDTO userDTO) async {
    return getUserService().updateUser(mapper.toEntity(userDTO));
  }

  @override
  Future<bool> deleteUser() async {
    return getUserService().deleteUser();
  }
}
