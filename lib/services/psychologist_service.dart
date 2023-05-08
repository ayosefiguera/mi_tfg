import 'package:eqlibrum/models/psychologist.dart';

/// Service for managing Pyschologist
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class PsychologistService {
  /// Get all existing psychologist.
  /// return [List] the list of al psychologist.
  Future<List<Psychologist>> getAllPsychologist();

  /// Create new user User.
  /// [Psychologist] The psychologist
  /// Only return [error]. otherwise return [null].
  Future<bool> createPsychologist(Psychologist newPsychologist);

  /// Find Psychologist with a id given.
  /// 
  /// Only return [Psichologish] if found. otherwise return [null].
  Future<Psychologist?> getPsychologistById(String id);
}
