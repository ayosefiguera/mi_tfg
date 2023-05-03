import 'package:eqlibrum/models/psychologist.dart';
import 'package:eqlibrum/models/user.dart';

/// An interface for user Local Repository including operations for retrieving
/// persistend user model objects.
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class LocalRepository {

  /// Create new Psychologist.
  /// Only return [error]. otherwise return [null].
  Future<bool> newLocalStorageSpychologist(Psychologist psychologist);

  /// Get a user from secure data.
  ///
  /// Return [String] the idToken or empty string.
  Future<User> findUser();

  /// When user logout delete the idToken.
  logout();

  /// Find the idToken into Secure Storage.
  /// Return [String] the idToken or empty string.
  Future<String> findIdtoken();

}
