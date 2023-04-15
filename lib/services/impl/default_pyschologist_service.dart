import 'package:eqlibrum/daos/impl/default_psychologist_dao.dart';
import 'package:eqlibrum/daos/psychologist_dao.dart';
import 'package:eqlibrum/services/services.dart';
import 'package:eqlibrum/models/models.dart' show Psychologist;

/// Service of psychologist data.
class DefaultPsychologistService implements PsychologistService {
  final PychologistDao pychologistDao = DefaultPsychologistDAO();

  /// Get all psychologist..
  /// [return] List of psychologist.
  @override
  Future<List<Psychologist>> getAllPsychologist() async {
    List<Psychologist> psychologists = [];
    psychologists = await getPsycholoistDao().getAllPsychologist();
    return psychologists;
  }

  PychologistDao getPsycholoistDao() {
    return pychologistDao;
  }
}
