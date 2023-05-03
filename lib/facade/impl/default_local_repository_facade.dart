import 'package:eqlibrum/facade/local_repository_facade.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:eqlibrum/services/impl/default_local_repository_service.dart';
import 'package:eqlibrum/services/local_repository_service.dart';
import 'package:flutter/material.dart';

class DefaultLocalRepositoryFacade extends ChangeNotifier implements LocalRepositoryFacade  {
  User currentUser = User();

  LocalRepositoryService localRepositoryService = DefaultLocalRepositoryService();

  @override
  Future<String> getIdtoken() async {
    return getLocalRepository().getIdtoken();
  }

  @override
  Future<User> getUser() async {
    currentUser = await getLocalRepository().getUser();
    return currentUser;
  }

  @override
  Future logout() async {
    getLocalRepository().logout();
  }

  setLocalRepository(LocalRepositoryService localRepositoryService) {
    localRepositoryService = localRepositoryService;
  }

  LocalRepositoryService getLocalRepository() {
    return localRepositoryService;
  }
}
