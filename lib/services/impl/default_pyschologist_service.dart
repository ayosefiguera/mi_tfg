import 'package:eqlibrum/daos/impl/default_local_repository.dart';
import 'package:eqlibrum/daos/impl/default_psychologist_dao.dart';
import 'package:eqlibrum/daos/local_repository.dart';
import 'package:eqlibrum/daos/psychologist_dao.dart';
import 'package:eqlibrum/models/psychologist.dart';
import 'package:eqlibrum/services/notificacion_service.dart';
import 'package:eqlibrum/services/psychologist_service.dart';

/// Default implementation of [PsychologistService]
class DefaultPsychologistService implements PsychologistService {
  PsychologistDAO _pychologistDao = DefaultPsychologistDAO();
  LocalRepository _localReppository = DefaultLocalRepository();

  @override
  Future<List<Psychologist>> getAllPsychologist() async {
    List<Psychologist> psychologists = [];
    psychologists = await _getPsycholoistDao().findAllPsychologist();
    return psychologists;
  }

  @override
  Future<bool> createPsychologist(Psychologist newPsychologist) async {
    Psychologist createdPsychologist;
    try {
      createdPsychologist =
          await _getPsycholoistDao().createPsychologist(newPsychologist);
    } catch (error) {
      NotificacionService.showSnackbar('$error');
      return false;
    }

    _getLocalRepository().newLocalStorageSpychologist(createdPsychologist);

    return true;
  }

  @override
  Future<Psychologist?> getPsychologistById(final String id) {
    return _getPsycholoistDao().findPsychologistById(id);
  }
  
  PsychologistDAO _getPsycholoistDao() {
    return _pychologistDao;
  }

  setPsycholoistDao(PsychologistDAO psychologistDAO) {
    _pychologistDao = psychologistDAO;
  }

  LocalRepository _getLocalRepository() {
    return _localReppository;
  }

  setLocalRepository(LocalRepository localRepository) {
    _localReppository = localRepository;
  }

}
