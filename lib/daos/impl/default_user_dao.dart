import 'package:eqlibrum/daos/user_dao.dart';
import 'dart:convert';
import 'package:eqlibrum/apis/api_key.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

/// Default implementation to [UserDAO]
class DefaultUserDAO implements UserDAO {
  static const USER_TOKEN = 'idToken';
  final String _AuthBaseUrl = Auth.baseUrl;
  final String _FirebaseBaseUrl = FirebaseData.url;
  final String _key = Auth.key;
  final storage = new FlutterSecureStorage();

  @override
  Future<bool> createUser(final User newUser) async {
    const String encodeAuthPath = "/v1/accounts:signUp";

    final Map<String, dynamic> authData = {
      'email': newUser.email,
      'password': newUser.pass,
      'returnSecureToken': true
    };

    final urlAuth = Uri.https(_AuthBaseUrl, encodeAuthPath, {'key': _key});
    final resp = await http.post(urlAuth, body: json.encode(authData));

    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey(USER_TOKEN)) {
      User createdUser = await _createNewUser(newUser);
      _newLocalStorageDataUser(createdUser, decodeResp[USER_TOKEN]);
    } else {
      print(decodeResp['error']['message']);
      return false;
    }

    return true;
  }

  Future<User> _createNewUser(User newUser) async {
    final urlRegister =
        Uri.https(_FirebaseBaseUrl, 'users.json', {'key': _key});
    final response = await http.post(urlRegister, body: newUser.toJson());
    final decodeData = json.decode(response.body);
    newUser.id = decodeData['name'];
    return newUser;
  }

  _newLocalStorageDataUser(final User newUser, final String token) async {
    // Store userToken in secure storage.
    await storage.write(key: USER_TOKEN, value: token);
    await storage.write(key: 'userId', value: newUser.id ?? '');
    await storage.write(key: 'userName', value: newUser.name);
    await storage.write(key: 'userSurname', value: newUser.surname);
    await storage.write(key: 'userEmail', value: newUser.email);
    await storage.write(key: 'userPicture', value: newUser.picture ?? '');
  }

  @override
  Future<bool> loginUser(final user) async {
    const String encodePath = "/v1/accounts:signInWithPassword";

    String userToke = await getIdtoken();

    final Map<String, dynamic> authData = {
      'email': user.email,
      'password': user.pass,
      'returnSecureToken': true
    };

    final url = Uri.https(_AuthBaseUrl, encodePath, {'key': _key});
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey(USER_TOKEN)) {
      await storage.write(key: USER_TOKEN, value: decodeResp[USER_TOKEN]);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future logout() async {
    await storage.delete(key: USER_TOKEN);
  }

  @override
  Future<String> getIdtoken() async {
    String token = await storage.read(key: USER_TOKEN) ?? '';
    return token;
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

  @override
  Future<String?> deleteUser() async {
    const String encodePath = "/v1/accounts:delete";

    String userToke = await getIdtoken();
    final Map<String, dynamic> authData = {
      USER_TOKEN: userToke,
      'returnSecureToken': true
    };

    final url = Uri.https(_AuthBaseUrl, encodePath, {'key': _key});
    final response = await http.post(url, body: json.encode(authData));

    if (response.statusCode != 200) {
      final decodeResp = json.decode(response.body);
      return decodeResp['error']['message'];
    }

    final String respDelete = await _deleteUserData() ?? '';

    if (respDelete.isNotEmpty) {
      return respDelete;
    }
    _removeLocalStorageUserData();
    return '';
  }

  Future<String?> _deleteUserData() async {
    User user = await getUser();

    final urlDeleted =
        Uri.https(_FirebaseBaseUrl, 'users/${user.id}.json', {'key': _key});
    final response = await http.delete(urlDeleted, body: user.toJson());
    final decodeData = json.decode(response.body);
    print(decodeData);

    if (response == null) {
      return 'ERROR_DATA_NOT_FOUND';
    }
    return '';
  }

  void _removeLocalStorageUserData() async {
    // Store userToken in secure storage.
    await storage.delete(key: USER_TOKEN);
    await storage.delete(key: 'userId');
    await storage.delete(key: 'userName');
    await storage.delete(key: 'userSurname');
    await storage.delete(key: 'userEmail');
    await storage.delete(key: 'userPicture');
  }

  void _updateLocalStorageDataUser(final User updateUser) async {
    // Store userToken in secure storage.
    await storage.write(key: 'userName', value: updateUser.name);
    await storage.write(key: 'userSurname', value: updateUser.surname);
    await storage.write(key: 'userEmail', value: updateUser.email);
    await storage.write(key: 'userPicture', value: updateUser.picture ?? '');
  }

  @override
  Future<String?> updateUser(User user) async {
    String userToke = await getIdtoken();

    final urlUpdate = Uri.https(
        _FirebaseBaseUrl, 'users/${user.id}.json',  {'key': _key});
    final response = await http.put(urlUpdate, body: user.toJson());

    if (response.statusCode != 200) {
      return 'ERROR_TO_UPDATE_DATA';
    }

    final decodeData = json.decode(response.body);

    User updateUser = User.fromMap(decodeData);
    _updateLocalStorageDataUser(updateUser);

    return '';
  }
  
  @override
  Future<User?> findUserById(final String id) {
    // TODO: implement findUserById
    throw UnimplementedError();
  }
}
