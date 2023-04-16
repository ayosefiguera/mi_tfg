import 'package:eqlibrum/models/models.dart' show Psychologist;

/// Service for managing Pyschologist
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class PsychologistService {
  
  /// Get all existing psychologist.
  /// return [List] the list of al psychologist.
  Future<List<Psychologist>> getAllPsychologist();
}
