import 'package:eqlibrum/models/psychologist.dart';
import 'package:eqlibrum/models/user.dart';

/// An interfac for the psychologist DAO including operations for retrieving 
/// persistend Pyschologist model objects
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class PsychologistDAO {

/// Return a list of psychologist models thar are currently persisted. 
/// If none are found an emty list is returned.
/// Returns [List<Psychologist>] The list of Psychologist.
  Future<List<Psychologist>> getAllPsychologist();

}
