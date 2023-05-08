import 'package:eqlibrum/daos/pages_dao.dart';
import 'package:eqlibrum/models/LegalPage.dart';
import 'package:eqlibrum/apis/api_key.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

/// Default implemtation to [PsychologistDao]
class DefaultPagesDAO implements PagesDao {
  final String _baseUrl = FirebaseData.url;
  final storage = FlutterSecureStorage();

  /// Find all psychologist by performin a ApiRest query.
  @override
  Future<LegalPage> getPage(final String page) async {
    final url = Uri.https(_baseUrl, '/pages/$page.json',
        {'auth': await storage.read(key: 'idToken') ?? ''});
    final response = await http.get(url);
    final Map<String, dynamic> pageMap = json.decode(response.body);

    final LegalPage currentPage = LegalPage.fromMap(pageMap);

    return currentPage;
  }
}
