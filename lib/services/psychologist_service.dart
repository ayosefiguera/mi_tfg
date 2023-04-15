import 'package:eqlibrum/models/models.dart' show Psychologist;


/// Service of psychologist data.
abstract class PsychologistService{

  /// Get all psychologist..
  /// [return] List of psychologist.

  Future<List<Psychologist>> getAllPsychologist();
}
