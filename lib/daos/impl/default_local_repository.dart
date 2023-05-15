import 'dart:io';

import 'package:eqlibrum/daos/local_repository.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DefaultLocalRepository implements LocalRepository {
  final storage = const FlutterSecureStorage();
  // ignore: constant_identifier_names
  static const USER_TOKEN = 'idToken';

  @override
  Future<bool> newLocalStorageSpychologist(final User psychologist) async {
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
  Future<bool> newLocalStorageUser(
      final User newUser, final String authToke) async {
    try {
      await storage.write(key: USER_TOKEN, value: authToke);
      await storage.write(key: 'userId', value: newUser.id ?? '');
      await storage.write(key: 'userName', value: newUser.name);
      await storage.write(key: 'userSurname', value: newUser.surname);
      await storage.write(key: 'userEmail', value: newUser.email);
      await storage.write(key: 'rol', value: newUser.rol);
      await storage.write(key: 'userPicture', value: newUser.picture ?? '');
    } catch (e) {
      stderr.write(e);
      return false;
    }
    return true;
  }

  @override
  Future<User> findLocalUser() async {
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
  Future<String> findLocalIdtoken() async {
    String token = await storage.read(key: USER_TOKEN) ?? '';
    return token;
  }

  @override
  logout() async {
    await storage.delete(key: USER_TOKEN);
  }

  @override
  Future deleteLocalUser() async {
    await storage.delete(key: USER_TOKEN);
    await storage.delete(key: 'userId');
    await storage.delete(key: 'userName');
    await storage.delete(key: 'userSurname');
    await storage.delete(key: 'userEmail');
    await storage.delete(key: 'userPicture');
    await storage.delete(key: 'rol');
    await storage.delete(key: 'summary');
    await storage.delete(key: 'bio');
  }

  @override
  Future updateLocalStorageDataUser(final User updateUser) async {
    await storage.write(key: 'userName', value: updateUser.name);
    await storage.write(key: 'userSurname', value: updateUser.surname);
    await storage.write(key: 'userEmail', value: updateUser.email);
    await storage.write(key: 'userPicture', value: updateUser.picture ?? '');
    await storage.write(key: 'rol', value: updateUser.rol ?? '');
    await storage.write(key: 'summary', value: updateUser.summary ?? '');
    await storage.write(key: 'bio', value: updateUser.bio ?? '');
  }
}
