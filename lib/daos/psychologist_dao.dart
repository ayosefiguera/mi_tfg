import 'package:eqlibrum/models/psychologist.dart';

/// An interfac for the psychologist DAO including operations for retrieving
/// persistend Pyschologist model objects
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class PsychologistDAO {
  /// Return a list of psychologist models thar are currently persisted.
  /// If none are found an emty list is returned.
  /// Returns [List<Psychologist>] The list of Psychologist.
  Future<List<Psychologist>> findAllPsychologist();

  /// Create new Psychologist.
  /// [email] The email.
  /// [password] The password
  /// Only return [error]. otherwise return [null].
  Future<Psychologist> createPsychologist(Psychologist psychologist);

  /// Find Psychologist with a id given.
  /// 
  /// Only return [Psichologish] if found. otherwise return [null].
  Future<Psychologist?> findPsychologistById(String id);
}
