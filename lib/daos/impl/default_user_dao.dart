import 'package:eqlibrum/daos/user_dao.dart';
import 'dart:convert';
import 'package:eqlibrum/apis/api_key.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

/// Default implementation to [UserDAO]
class DefaultUserDAO implements UserDAO {
  final String _AutBaseUrl = Auth.baseUrl;
  final String _FirebaseBaseUrl = FirebaseData.url;
  final String _key = Auth.key;
  final storage = new FlutterSecureStorage();

  @override
  Future<String?> createUser(final User newUser) async {
    const String encodeAuthPath = "/v1/accounts:signUp";

    final Map<String, dynamic> authData = {
      'email': newUser.email,
      'password': newUser.email,
      'returnSecureToken': true
    };

    /// Create AuthControl Firebase
    final urlAuth = Uri.https(_AutBaseUrl, encodeAuthPath, {'key': _key});
    final resp = await http.post(urlAuth, body: json.encode(authData));

    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      User createdUser = await _createNewUser(newUser);
      _locaStorageDataUser(createdUser, decodeResp['idToken']);
    } else {
      return decodeResp['error']['message'];
    }
    return '';
  }

  Future<User> _createNewUser(User newUser) async {
    final urlRegister =
        Uri.https(_FirebaseBaseUrl, 'users.json', {'key': _key});
    final response = await http.post(urlRegister, body: newUser.toJson());
    final decodeData = json.decode(response.body);
    newUser.id = decodeData['name'];
    return newUser;
  }

    _locaStorageDataUser(final User newUser, final String token) async {
    // Store userToken in secure storage.
    await storage.write(key: 'userToken', value: token);
    await storage.write(key: 'userId', value: newUser.id ?? '');
    await storage.write(key: 'userName', value: newUser.name);
    await storage.write(key: 'userSurname', value: newUser.surname);
    await storage.write(key: 'userEmail', value: newUser.email);
    await storage.write(key: 'userPicture', value: newUser.picture ?? '');
  }

  @override
  Future<String?> loginUser(final user) async {
    const String encodePath = "/v1/accounts:signInWithPassword";
    final Map<String, dynamic> authData = {
      'email': user.email,
      'password': user.pass,
      'returnSecureToken': true
    };

    final url = Uri.https(_AutBaseUrl, encodePath, {'key': _key});
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
