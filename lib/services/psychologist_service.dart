import 'dart:io';
import 'package:flutter/material.dart';
import 'package:eqlibrum/models/models.dart' show Psychologist;
import 'package:eqlibrum/apis/api_key.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class PsychologistService extends ChangeNotifier {
  final String _baseUrl = FirebaseData.url;
  final List<Psychologist> products = [];
  File? newPictureFile;
  late Psychologist selecteProduct;

  bool isLoading = false;
  bool isSaving = false;

  PsychologistService() {
    loadPsychologist();
  }

  Future<List<Psychologist>> loadPsychologist() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'psychologist.json');
    final response = await http.get(url);
    final Map<String, dynamic> productMap = json.decode(response.body);
    productMap.forEach((key, value) {
      final tempProduct = Psychologist.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    isLoading = false;
    notifyListeners();

    return products;
  }
}
