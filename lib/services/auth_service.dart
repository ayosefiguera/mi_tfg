import 'dart:convert';

import 'package:eqlibrum/apis/api_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = Auth.baseUrl;
  final String _key = Auth.key;
  final storage = new FlutterSecureStorage();

  /// Create the user using [email] and [password].
  ///
  /// Only return [error]. otherwise return [null].
  Future<String?> createUser(String email, String password) async {
    const String encodePath = "/v1/accounts:signUp";

    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };

    final url = Uri.https(_baseUrl, encodePath, {'key': _key});
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      // store idToken in secure storage.
      await storage.write(key: 'idToken', value: decodeResp['idToken']);
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }

  /// Check [email] and [password] to login
  ///
  /// Only return[message][Error] otherwise return [null].
  Future<String?> loginUser(String email, String password) async {
    print('${email} -> ${password}');
    const String encodePath = "/v1/accounts:signInWithPassword";
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
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

  Future logout() async {
    //Delete the idToken from secure storage.
    await storage.delete(key: 'idToken');
    return;
  }
}
