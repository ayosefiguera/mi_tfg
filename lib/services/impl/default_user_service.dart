import 'package:eqlibrum/daos/impl/default_user_dao.dart';
import 'package:eqlibrum/daos/user_dao.dart';
import 'package:eqlibrum/models/models.dart';
import 'package:eqlibrum/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DefaultUserService extends ChangeNotifier implements UserService {
  final UserDAO userDAO = DefaultUserDAO();


  @override
  Future<String?> createUser(User newUser) async {
    return await getUserDao().createUser(newUser);
  }

  @override
  Future<String> getIdtoken() async {
    return await getUserDao().getIdtoken();
  }

  @override
  Future<User> getUser() async  {
    return await getUserDao().getUser();
  }

  @override
  Future<String?> loginUser(final User user) async {
    return await getUserDao().loginUser(user);
  }

  @override
  Future logout() async {
    getUserDao().logout();
  }

  @override
  FlutterSecureStorage get storage => throw UnimplementedError();

  UserDAO getUserDao() {
    return userDAO;
  }
}
