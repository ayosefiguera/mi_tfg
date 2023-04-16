import 'package:eqlibrum/daos/impl/default_psychologist_dao.dart';
import 'package:eqlibrum/daos/psychologist_dao.dart';
import 'package:eqlibrum/services/services.dart';
import 'package:eqlibrum/models/models.dart' show Psychologist;

/// Default implementation of [PsychologistService]
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
class DefaultPsychologistService implements PsychologistService {

  final PsychologistDao pychologistDao = DefaultPsychologistDAO();

  @override
  Future<List<Psychologist>> getAllPsychologist() async {
    List<Psychologist> psychologists = [];
    psychologists = await getPsycholoistDao().getAllPsychologist();
    return psychologists;
  }

  PsychologistDao getPsycholoistDao() {
    return pychologistDao;
  }
}
