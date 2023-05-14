import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/facade/local_repository_facade.dart';
import 'package:eqlibrum/mappers/impl/user_mapper.dart';
import 'package:eqlibrum/services/impl/default_local_repository_service.dart';
import 'package:eqlibrum/services/local_repository_service.dart';
import 'package:flutter/material.dart';

class DefaultLocalRepositoryFacade extends ChangeNotifier
    implements LocalRepositoryFacade {
  UserDTO _currentUser = UserDTO();
  bool _isLoading = false;

  LocalRepositoryService _localRepositoryService =
      DefaultLocalRepositoryService();

  DefaultLocalRepositoryFacade() {
    changeloadingtStatus(true);
    getUser();
    changeloadingtStatus(false);
  }

  @override
  Future<String> getIdtoken() async {
    return _getLocalRepository().getIdtoken();
  }

  @override
  Future<UserDTO> getUser() async {
    if (_currentUser.id == null) {
      _currentUser = UserMapper().toDTO(await _getLocalRepository().getUser());
    }
    return _currentUser;
  }

  @override
  Future<bool> loadUser() async {
    if (_currentUser.id == null) {
      _currentUser = UserMapper().toDTO(await _getLocalRepository().getUser());
    }
    return (_currentUser.id != null) ? true : false;
  }

  @override
  Future logout() async {
    _getLocalRepository().logout();
  }

  Future<String?> getName() async {
    if (_currentUser.id == null) {
      _currentUser = UserMapper().toDTO(await _getLocalRepository().getUser());
    }
    return _currentUser.name;
  }

  @override
  Future<String> getRol() async {
    _currentUser = await getUser();
    return _currentUser.rol ?? '';
  }

  @override
  UserDTO getCurrentUser() {
    return _currentUser;
  }

  setLocalRepository(LocalRepositoryService localRepositoryService) {
    _localRepositoryService = localRepositoryService;
  }

  LocalRepositoryService _getLocalRepository() {
    return _localRepositoryService;
  }

  @override
  void changeloadingtStatus(final bool state) {
    _isLoading = state;
    notifyListeners();
  }

  @override
  bool getLoadingStatus() {
    return _isLoading;
  }
}
