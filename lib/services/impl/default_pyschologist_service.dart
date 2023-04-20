import 'package:eqlibrum/daos/impl/default_psychologist_dao.dart';
import 'package:eqlibrum/daos/psychologist_dao.dart';
import 'package:eqlibrum/models/psychologist.dart';
import 'package:eqlibrum/services/psychologist_service.dart';

/// Default implementation of [PsychologistService]
class DefaultPsychologistService implements PsychologistService {

  final PsychologistDAO pychologistDao = DefaultPsychologistDAO();

  @override
  Future<List<Psychologist>> getAllPsychologist() async {
    List<Psychologist> psychologists = [];
    psychologists = await getPsycholoistDao().getAllPsychologist();
    return psychologists;
  }

  PsychologistDAO getPsycholoistDao() {
    return pychologistDao;
  }
}
