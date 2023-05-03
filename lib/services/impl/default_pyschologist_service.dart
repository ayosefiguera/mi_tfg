import 'package:eqlibrum/daos/impl/default_local_repository.dart';
import 'package:eqlibrum/daos/impl/default_psychologist_dao.dart';
import 'package:eqlibrum/daos/local_repository.dart';
import 'package:eqlibrum/daos/psychologist_dao.dart';
import 'package:eqlibrum/models/psychologist.dart';
import 'package:eqlibrum/services/notificacion_service.dart';
import 'package:eqlibrum/services/psychologist_service.dart';

/// Default implementation of [PsychologistService]
class DefaultPsychologistService implements PsychologistService {

  PsychologistDAO pychologistDao = DefaultPsychologistDAO();
  LocalRepository localReppository = DefaultLocalRepository();

  @override
  Future<List<Psychologist>> getAllPsychologist() async {
    List<Psychologist> psychologists = [];
    psychologists = await getPsycholoistDao().findAllPsychologist();
    return psychologists;
  }


  @override
  Future<bool> createPsychologist(Psychologist newPsychologist) async {

    Psychologist createdPsychologist;
    try {
      createdPsychologist =
          await getPsycholoistDao().createPsychologist(newPsychologist);
    } catch (error) {
      NotificacionService.showSnackbar('$error');
      return false;
    }

    getLocalRepository().newLocalStorageSpychologist(createdPsychologist);

    return true;
  }

  PsychologistDAO getPsycholoistDao() {
    return pychologistDao;
  }

  LocalRepository getLocalRepository() {
    return localReppository;
  }

  setPsycholoistDao(PsychologistDAO psychologistDAO) {
     pychologistDao = psychologistDAO;
  }

  setLocalRepository(LocalRepository localRepository) {
    localReppository = localReppository;
  }

}
