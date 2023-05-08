import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/facade/local_repository_facade.dart';
import 'package:eqlibrum/mappers/impl/user_mapper.dart';
import 'package:eqlibrum/services/impl/default_local_repository_service.dart';
import 'package:eqlibrum/services/local_repository_service.dart';
import 'package:flutter/material.dart';

class DefaultLocalRepositoryFacade extends ChangeNotifier
    implements LocalRepositoryFacade {
  UserDTO currentUser = UserDTO();

  LocalRepositoryService _localRepositoryService =
      DefaultLocalRepositoryService();

  DefaultLocalRepositoryFacade() {
    getUser();
  }

  @override
  Future<String> getIdtoken() async {
    return _getLocalRepository().getIdtoken();
  }

  @override
  Future<UserDTO> getUser() async {
    if (currentUser.id == null) {
      currentUser = UserMapper().toDTO(await _getLocalRepository().getUser());
    }
    return currentUser;
  }

  @override
  Future<bool> loadUser() async {

    if (currentUser.id == null) {
      currentUser = UserMapper().toDTO(await _getLocalRepository().getUser());
    }
     
    return (currentUser.id != null)? true:false;
  }

  @override
  Future logout() async {
    _getLocalRepository().logout();
  }

  @override
  Future<String?> getName() async {
    if (currentUser.id == null) {
      currentUser = UserMapper().toDTO(await _getLocalRepository().getUser());
    }
    return currentUser.name;
  }

  @override
  Future<String> whatRol() async {
    currentUser = await getUser();
    return currentUser.rol ?? '';
  }

  setLocalRepository(LocalRepositoryService localRepositoryService) {
    _localRepositoryService = localRepositoryService;
  }

  LocalRepositoryService _getLocalRepository() {
    return _localRepositoryService;
  }
}
