import 'dart:io';

import 'package:eqlibrum/daos/psychologist_dao.dart';
import 'package:eqlibrum/models/psychologist.dart';
import 'package:eqlibrum/apis/api_key.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class DefaultPsychologistDAO implements PychologistDao {
  final String _baseUrl = FirebaseData.url;
  final storage = FlutterSecureStorage();

  @override
  Future<List<Psychologist>> getAllPsychologist() async {
    final List<Psychologist> psychologists = [];
    try {
      final url = Uri.https(_baseUrl, 'psychologist.json',
          {'auth': await storage.read(key: 'idToken') ?? ''});

      final response = await http.get(url);
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
}