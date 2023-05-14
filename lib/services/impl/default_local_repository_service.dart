import 'package:eqlibrum/daos/impl/default_local_repository.dart';
import 'package:eqlibrum/daos/local_repository.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:eqlibrum/services/local_repository_service.dart';

class DefaultLocalRepositoryService implements LocalRepositoryService {
  LocalRepository _localRepository = DefaultLocalRepository();

  @override
  Future<String> getIdtoken() async {
    return _getLocalRepository().findLocalIdtoken();
  }

  @override
  Future<User> getUser() async {
    return _getLocalRepository().findLocalUser();
  }

  @override
  Future logout() async {
    _getLocalRepository().logout();
  }

  void setLocalRepository(LocalRepository localRepository) {
    _localRepository = localRepository;
  }

  LocalRepository _getLocalRepository() {
    return _localRepository;
  }
}
