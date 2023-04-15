import 'package:eqlibrum/daos/impl/default_user_dao.dart';
import 'package:eqlibrum/daos/user_dao.dart';
import 'package:eqlibrum/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DefaultUserService extends ChangeNotifier implements UserService {
  final UserDAO userDAO = DefaultUserDAO();


  @override
  Future<String?> createUser(String email, String password, String name) async {
    return await getUserDao().createUser(email, password, name);
  }

  @override
  Future<String> getIdtoken() async {
    return await getUserDao().getIdtoken();
  }

  @override
  Future<Map<dynamic,dynamic>> getUser() async {
    return await getUserDao().getUser();
  }

  @override
  Future<String?> loginUser(String email, String password) async {
    return await getUserDao().loginUser(email, password);
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
