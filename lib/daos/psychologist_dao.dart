import 'package:eqlibrum/models/models.dart';

abstract class PychologistDao {

  /// Return a list of psychologist models that are currently persisted. If none are found an empty list is returned.
  /// 
  /// return [List] All the psychologist in the system
  Future<List<Psychologist>> getAllPsychologist();

}
