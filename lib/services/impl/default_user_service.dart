import 'package:eqlibrum/daos/impl/default_local_repository.dart';
import 'package:eqlibrum/daos/impl/default_user_dao.dart';
import 'package:eqlibrum/daos/local_repository.dart';
import 'package:eqlibrum/daos/user_dao.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:eqlibrum/services/notificacion_service.dart';
import 'package:eqlibrum/services/user_service.dart';

///Default implementation of
class DefaultUserService implements UserService {
  UserDAO _userDAO = DefaultUserDAO();
  LocalRepository _localRepository = DefaultLocalRepository();

  @override
  Future<bool> createUser(User newUser) async {
    late String usertoken;
    try {
      usertoken = await _getUserDao().createCredentialAuth(newUser);
      User createdUser = await _getUserDao().createNewUser(newUser);
      print(createdUser);
      _getLocalRepository().newLocalStorageUser(createdUser, usertoken);
    } catch (error) {
      NotificacionService.showSnackbar("$error");
      return false;
    }
    return true;
  }

  @override
  Future<bool> loginUser(final User user) async {
    return await _getUserDao().loginUser(user);
  }

  @override
  Future<User?> getUserById(String id) async {
    return await _getUserDao().findUserById(id);
  }

  @override
  Future<String> getIdtoken() async {
    return await _getLocalRepository().findLocalIdtoken();
  }

  @override
  Future<User> getUser() async {
    return await _getLocalRepository().findLocalUser();
  }

  @override
  Future logout() async {
    _getLocalRepository().logout();
  }

  @override
  Future<bool> updateUser(User user) async {
    try {
      User UpdatedUser = await _getUserDao().updateUser(user);
      await _getLocalRepository().updateLocalStorageDataUser(UpdatedUser);
    } catch (error) {
      NotificacionService.showSnackbar("$error");
      return false;
    }
    return true;
  }

  @override
  Future<bool> deleteUser() async {
    String userToken = await _getLocalRepository().findLocalIdtoken();
    User user = await _getLocalRepository().findLocalUser();
    try {
      await _getUserDao().deleteAuthUser(userToken);
      await _getUserDao().deleteUserData(user);
      await _getLocalRepository().deleteLocalUser();
    } catch (error) {
      NotificacionService.showSnackbar("$error");
      return false;
    }
    return true;
  }

  UserDAO _getUserDao() {
    return _userDAO;
  }

  void setUserDAO(UserDAO userDAO) {
    _userDAO = userDAO;
  }

  LocalRepository _getLocalRepository() {
    return _localRepository;
  }

  void setLocalRepository(LocalRepository localRepository) {
    _localRepository = localRepository;
  }
}
