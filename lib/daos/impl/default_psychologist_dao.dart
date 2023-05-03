import 'dart:io';
import 'package:eqlibrum/daos/psychologist_dao.dart';
import 'package:eqlibrum/models/psychologist.dart';
import 'package:eqlibrum/apis/api_key.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

/// Default implemtation to [PsychologistDao]
class DefaultPsychologistDAO implements PsychologistDAO {
  static const USER_TOKEN = 'idToken';
  final String _AuthBaseUrl = Auth.baseUrl;
  final String _FirebaseBaseUrl = FirebaseData.url;
  final String _key = Auth.key;
  final storage = new FlutterSecureStorage();

  /// Find all psychologist by performin a ApiRest query.
  @override
  Future<List<Psychologist>> findAllPsychologist() async {
    final List<Psychologist> psychologists = [];
    try {
      final url = Uri.https(_FirebaseBaseUrl, 'psychologist.json',
          {'auth': await storage.read(key: 'idToken') ?? ''});

      final response = await http.get(url);
      print(response.statusCode);
      final Map<String, dynamic> psychologistMap = json.decode(response.body);

      if (psychologistMap.length > 1) {
        psychologistMap.forEach((key, value) {
          final tempPsychologist = Psychologist.fromMap(value);
          tempPsychologist.id = key;
          psychologists.add(tempPsychologist);
        });
      }
    } catch (e) {
      stderr.writeln('$e');
    }
    return psychologists;
  }

  @override
  Future<Psychologist> createPsychologist(
      final Psychologist newPsychologist) async {
    const String encodeAuthPath = "/v1/accounts:signUp";

    final Map<String, dynamic> authData = {
      'email': newPsychologist.email,
      'password': newPsychologist.pass,
      'returnSecureToken': true
    };

    final urlAuth = Uri.https(_AuthBaseUrl, encodeAuthPath, {'key': _key});
    final resp = await http.post(urlAuth, body: json.encode(authData));

    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey(USER_TOKEN)) {
      final urlRegister =
          Uri.https(_FirebaseBaseUrl, 'psychologist.json', {'key': _key});

      final response =
          await http.post(urlRegister, body: newPsychologist.toJson());
      final decodeData = json.decode(response.body);
      newPsychologist.id = decodeData['name'];
      
    } else {
      if (decodeResp.containsKey('error')) {
        throw Exception(decodeResp['error']['message']);
      }
      throw Exception("Error while create new account");
    }
    await storage.write(key: USER_TOKEN, value: decodeResp[USER_TOKEN]);
    return newPsychologist;
  }
}
