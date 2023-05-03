import 'package:eqlibrum/daos/impl/default_local_repository.dart';
import 'package:eqlibrum/daos/local_repository.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:eqlibrum/services/local_repository_service.dart';

class DefaultLocalRepositoryService implements LocalRepositoryService {

  LocalRepository localRepository = DefaultLocalRepository();

  @override
  Future<String> getIdtoken()async {
    return getLocalRepository().findIdtoken();
  }

  @override
  Future<User> getUser()async{
    return getLocalRepository().findUser();
  }

  @override
  Future logout() async {
    getLocalRepository().logout();
  }

  setLocalRepository(LocalRepository localRepository) {
    localRepository = localRepository;
  }

  LocalRepository getLocalRepository() {
    return localRepository;
  }
}
