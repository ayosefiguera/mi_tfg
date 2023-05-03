import 'dart:io';

import 'package:eqlibrum/daos/local_repository.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DefaultLocalRepository implements LocalRepository {
  final storage = new FlutterSecureStorage();
  static const PSYCHOLOGIST = "psychologist";
  static const USER_TOKEN = 'idToken';


  @override
  Future<bool> newLocalStorageSpychologist(User psychologist) async {
    try {
      await storage.write(key: 'userId', value: psychologist.id ?? '');
      await storage.write(key: 'userName', value: psychologist.name);
      await storage.write(key: 'userSurname', value: psychologist.surname);
      await storage.write(key: 'userEmail', value: psychologist.email);
      await storage.write(key: 'rol', value: psychologist.rol);
      await storage.write(
          key: 'userPicture', value: psychologist.picture ?? '');
    } catch (e) {
      stderr.write(e);
      return false;
    }
    return true;
  }

  @override
  Future<User> findUser() async {
    String id = await storage.read(key: 'userId') ?? '';
    String name = await storage.read(key: 'userName') ?? '';
    String surname = await storage.read(key: 'userSurname') ?? '';
    String rol = await storage.read(key: 'rol') ?? '';
    String email = await storage.read(key: 'userEmail') ?? '';
    String picture = await storage.read(key: 'picture') ?? '';
    String summary = await storage.read(key: 'summary') ?? '';
    String bio = await storage.read(key: 'bio') ?? '';

    User user = User(
        id: id,
        name: name,
        surname: surname,
        email: email,
        rol: rol,
        picture: picture,
        summary: summary,
        bio: bio);

    return user;
  }
  
  @override
  Future<String> findIdtoken() async {
    String token = await storage.read(key: USER_TOKEN) ?? '';
    return token;
  }
  
  @override
  logout() async {
    await storage.delete(key: USER_TOKEN);
  }

}
