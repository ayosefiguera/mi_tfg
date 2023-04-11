import 'package:eqlibrum/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:eqlibrum/models/models.dart' show Psychologist;
import 'package:eqlibrum/apis/api_key.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

/// Service of psychologist data.
class PsychologistService extends ChangeNotifier {

  final String _baseUrl = FirebaseData.url;
  final List<Psychologist> psychologists = [];
  final storage = FlutterSecureStorage();

  bool isLoading = false;
  bool isSaving = false;

  PsychologistService() {
    getAllPsychologist();
  }

  /// Get all psychologist..
  /// [return] List of psychologist.

  Future<List<Psychologist>> getAllPsychologist() async {
    isLoading = true;
    notifyListeners();

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
      print(e);
    }

    isLoading = false;
    notifyListeners();

    return psychologists;
  }
}
