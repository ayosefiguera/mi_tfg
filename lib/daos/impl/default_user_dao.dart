import 'package:eqlibrum/daos/user_dao.dart';
import 'dart:convert';
import 'package:eqlibrum/apis/api_key.dart';
import 'package:eqlibrum/models/models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

/// Default implementation to [UserDAO]
class DefaultUserDAO implements UserDAO {
  final String _baseUrl = Auth.baseUrl;
  final String _key = Auth.key;
  final storage = new FlutterSecureStorage();

  @override
  Future<String?> createUser(final User newUser) async {
    const String encodePath = "/v1/accounts:signUp";

    final Map<String, dynamic> authData = {
      'email': newUser.email,
      'password': newUser.email,
      'returnSecureToken': true
    };

    /// Create AuthControl Firebase
    final url = Uri.https(_baseUrl, encodePath, {'key': _key});
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    /// Insert Firebase dataBase

    /// Save secureStorage
    if (decodeResp.containsKey('idToken')) {
      // Store userToken in secure storage.
      await storage.write(key: 'userToken', value: decodeResp['idToken']);
      await storage.write(key: 'userId', value: newUser.id ?? '');
      await storage.write(key: 'userName', value: newUser.name);
      await storage.write(key: 'userSurname', value: newUser.surname);
      await storage.write(key: 'userEmail', value: newUser.email);
      await storage.write(key: 'userPicture', value: newUser.picture ?? '');
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }

  @override
  Future<String?> loginUser(final user) async {
    const String encodePath = "/v1/accounts:signInWithPassword";

    final Map<String, dynamic> authData = {
      'email': user.email,
      'password': user.pass,
      'returnSecureToken': true
    };

    final url = Uri.https(_baseUrl, encodePath, {'key': _key});
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('userToken')) {
      await storage.write(key: 'userToken', value: decodeResp['userToken']);
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }

  @override
  Future logout() async {
    await storage.delete(key: 'userToken');
    return;
  }

  @override
  Future<String> getIdtoken() async {
    return await storage.read(key: 'userToken') ?? '';
  }

  @override
  Future<User> getUser() async {
    String id = await storage.read(key: 'userId') ?? '';
    String name = await storage.read(key: 'userName') ?? '';
    String surname = await storage.read(key: 'userSurname') ?? '';
    String email = await storage.read(key: 'userEmail') ?? '';
    User user = User(id: id, name: name, surname: surname, email: email);

    return user;
  }
}
