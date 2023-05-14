import 'package:eqlibrum/daos/impl/default_user_dao.dart';
import 'package:eqlibrum/daos/user_dao.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:eqlibrum/services/notificacion_service.dart';
import 'package:eqlibrum/services/user_service.dart';

///Default implementation of
class DefaultUserService implements UserService {
  UserDAO _userDAO = DefaultUserDAO();

  @override
  Future<bool> createUser(User newUser) async {
    return await _getUserDao().createUser(newUser);
  }

  @override
  Future<bool> loginUser(final User user) async {
    return await _getUserDao().loginUser(user);
  }

  @override
  Future<User?> getUserById(String id) async {
    return await _getUserDao().findUserById(id) ;
  }

  @override
  Future<String> getIdtoken() async {
    return await _getUserDao().getIdtoken();
  }

  @override
  Future<User> getUser() async {
    return await _getUserDao().getUser();
  }

  @override
  Future logout() async {
    _getUserDao().logout();
  }

  @override
  Future<bool> updateUser(User user) async {
    String? updateRepsonse = await _getUserDao().updateUser(user);
    return true;
  }

  @override
  Future<bool> deleteUser() async {
    String response = await _getUserDao().deleteUser() ?? '';
    if (response.isEmpty) {
      NotificacionService.showSnackbar("Delete Proccess Complete");
      return true;
    }
    NotificacionService.showSnackbar(response);
    return false;
  }

  UserDAO _getUserDao() {
    return _userDAO;
  }

  void setUserDAO(UserDAO userDAO) {
    _userDAO = userDAO;
  }
  

}
