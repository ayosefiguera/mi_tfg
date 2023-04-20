import 'package:eqlibrum/models/user.dart';

/// Service for managing user
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class UserService {
  /// Create new user User.
  /// [email] The email.
  /// [password] The password
  /// Only return [error]. otherwise return [null].
  Future<String?> createUser(User newUSer);

  /// Check [email] and [password] to login
  ///
  /// Only return[message][Error] otherwise return [null].
  Future<String?> loginUser(User user);

  /// When user logout delete the idToken.
  Future logout();

  /// Find the idToken into Secure Storage.
  /// Return [String] the idToken or empty string.
  Future<String> getIdtoken();

  /// Find the idName into Secure Storage.
  /// Return [String] the idToken or empty string.
  Future<User> getUser();
}
