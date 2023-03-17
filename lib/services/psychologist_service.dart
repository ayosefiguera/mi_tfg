import 'package:flutter/material.dart';
import 'package:eqlibrum/models/models.dart' show Psychologist;
import 'package:eqlibrum/apis/api_key.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

/**
 * This class is a controller of psychologist
 * 
 * extends from ChangeNotifier servicing all data to diferent part of
 * the app.
 */

class PsychologistService extends ChangeNotifier {
  final String _baseUrl = FirebaseData.url;
  final List<Psychologist> psychologists = [];

  bool isLoading = false;
  bool isSaving = false;

  PsychologistService() {
    loadPsychologist();
  }

  /**
   * LoadPsycgologist loars a list of psychologist from the database.
   * return List of psychologist
   */
  
  Future<List<Psychologist>> loadPsychologist() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'psychologist.json');
    final response = await http.get(url);
    final Map<String, dynamic> psychologistMap = json.decode(response.body);
    psychologistMap.forEach((key, value) {
      final tempPsychologist = Psychologist.fromMap(value);
      tempPsychologist.id = key;
      psychologists.add(tempPsychologist);
    });

    isLoading = false;
    notifyListeners();

    return psychologists;
  }
}
