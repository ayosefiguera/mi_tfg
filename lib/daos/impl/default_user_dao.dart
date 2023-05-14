import 'package:eqlibrum/daos/user_dao.dart';
import 'dart:convert';
import 'package:eqlibrum/apis/api_key.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

/// Default implementation to [UserDAO]
class DefaultUserDAO implements UserDAO {
  // ignore: constant_identifier_names
  static const USER_TOKEN = 'idToken';
  // ignore: non_constant_identifier_names
  final String _AuthBaseUrl = Auth.baseUrl;
  // ignore: non_constant_identifier_names
  final String _FirebaseBaseUrl = FirebaseData.url;
  final String _key = Auth.key;
  final storage = const FlutterSecureStorage();

  @override
  Future<String> createCredentialAuth(final User newUser) async {
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
      return decodeResp[USER_TOKEN];
    } else {
      throw Exception(decodeResp['error']['message']);
    }
  }

  @override
  Future<User> createNewUser(final User newUser) async {
    final urlRegister =
        Uri.https(_FirebaseBaseUrl, 'users.json', {'key': _key});
    final response = await http.post(urlRegister, body: newUser.toJson());
    final decodeData = json.decode(response.body);
    if (response.statusCode == 200) {
      newUser.id = decodeData['name'];
      return newUser;
    } else {
      throw throw Exception(decodeData['error']['message']);
    }
  }

  @override
  Future<bool> loginUser(final user) async {
    const String encodePath = "/v1/accounts:signInWithPassword";

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
  Future<bool> deleteAuthUser(final String userToken) async {
    const String encodePath = "/v1/accounts:delete";
    final Map<String, dynamic> authData = {
      USER_TOKEN: userToken,
      'returnSecureToken': true
    };

    final url = Uri.https(_AuthBaseUrl, encodePath, {'key': _key});
    final response = await http.post(url, body: json.encode(authData));

    if (response.statusCode != 200) {
      final decodeResp = json.decode(response.body);
      throw decodeResp['error']['message'];
    }

    return true;
  }

  @override
  Future<bool> deleteUserData(final User user) async {
    final urlDeleted =
        Uri.https(_FirebaseBaseUrl, 'users/${user.id}.json', {'key': _key});
    final response = await http.delete(urlDeleted, body: user.toJson());

    if (response.statusCode != 200) {
      throw Exception("Erro data not found");
    }

    return true;
  }

  @override
  Future<User> updateUser(User user) async {
    final urlUpdate =
        Uri.https(_FirebaseBaseUrl, 'users/${user.id}.json', {'key': _key});
    final response = await http.put(urlUpdate, body: user.toJson());
    if (response.statusCode != 200) {
      throw Exception("Error User not found!!");
    }
    final decodeData = json.decode(response.body);
    User updateUser = User.fromMap(decodeData);
    return updateUser;
  }

  @override
  Future<User?> findUserById(final String id) async {
    final url = Uri.https(_FirebaseBaseUrl, 'users/$id.json', {'key': _key});
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> userMap = json.decode(response.body);
        User tempUser = User.fromMap(userMap);
        return tempUser;
      }
    } catch (e) {
      return null;
    }
  }
}
