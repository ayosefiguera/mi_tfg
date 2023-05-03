import 'package:eqlibrum/models/user.dart';

/// Local repository for managing user
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class LocalRepositoryService {

  /// When user logout delete the idToken.
  Future logout();

  /// Find the idToken into Secure Storage.
  /// Return [String] the idToken or empty string.
  Future<String> getIdtoken();

  /// Find the idName into Secure Storage.
  /// Return [String] the idToken or empty string.
  Future<User> getUser();

}
