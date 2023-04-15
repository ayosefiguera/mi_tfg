import 'package:eqlibrum/daos/user_dao.dart';
import 'dart:convert';
import 'package:eqlibrum/apis/api_key.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

///
/// Service about auth.
///
class DefaultUserDAO implements UserDAO {
  final String _baseUrl = Auth.baseUrl;
  final String _key = Auth.key;
  final storage = new FlutterSecureStorage();
  var name = '';
  var email = '';

  /// Create new user User.
  /// [email] The email.
  /// [password] The password
  /// Only return [error]. otherwise return [null].
  Future<String?> createUser(String email, String password, String name) async {
    const String encodePath = "/v1/accounts:signUp";

    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(_baseUrl, encodePath, {'key': _key});
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      // Store idToken in secure storage.
      await storage.write(key: 'idToken', value: decodeResp['idToken']);
      await storage.write(key: 'idName', value: name);
      await storage.write(key: 'idEmail', value: email);
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }

  /// Check [email] and [password] to login
  ///
  /// Only return[message][Error] otherwise return [null].
  Future<String?> loginUser(String email, String password) async {
    const String encodePath = "/v1/accounts:signInWithPassword";

    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(_baseUrl, encodePath, {'key': _key});
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      await storage.write(key: 'idToken', value: decodeResp['idToken']);
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }

  /// When user logout delete the idToken.
  Future logout() async {
    await storage.delete(key: 'idToken');
    return;
  }

  /// Find the idToken into Secure Storage.
  /// Return [String] the idToken or empty string.
  Future<String> getIdtoken() async {
    final token = await storage.read(key: 'idToken') ?? '';
    return '';
  }

  /// Find the idName into Secure Storage.
  /// Return [String] the idToken or empty string.
  Future<Map>  getUser() async {
    var user =  Map(); 
    user['name'] = await storage.read(key: 'idName') ?? '';
    user['email'] = await storage.read(key: 'idEmail') ?? '';
    return user;
  }
}
