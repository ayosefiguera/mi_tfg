import 'package:eqlibrum/daos/impl/default_user_dao.dart';
import 'package:eqlibrum/daos/user_dao.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:eqlibrum/services/notificacion_service.dart';
import 'package:eqlibrum/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

///Default implementation of
class DefaultUserService extends ChangeNotifier implements UserService {
  final UserDAO userDAO = DefaultUserDAO();

  @override
  Future<bool> createUser(User newUser) async {
    return await getUserDao().createUser(newUser);
  }

  @override
  Future<bool> loginUser(final User user) async {
    return await getUserDao().loginUser(user);
  }

  @override
  Future<String> getIdtoken() async {
    return await getUserDao().getIdtoken();
  }

  @override
  Future<User> getUser() async {
    return await getUserDao().getUser();
  }

  @override
  Future logout() async {
    getUserDao().logout();
  }

  UserDAO getUserDao() {
    return userDAO;
  }

  @override
  Future<bool> updateUser(User user) async {
    String? updateRepsonse = await getUserDao().updateUser(user);
    print(updateRepsonse);
    return true;
  }

  @override
  Future<bool> deleteUser() async {
    String response = await getUserDao().deleteUser() ?? '';
    if (response.isEmpty) {
      NotificacionService.showSnackbar("Delete Proccess Complete");
      return true;
    }
    NotificacionService.showSnackbar(response);
    return false;
  }
}
