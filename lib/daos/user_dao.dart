import 'package:eqlibrum/models/models.dart';

/// An interface for user DAO including operations for retrieving 
/// persistend user model objects.
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class UserDAO {
  
  /// Create new User.
  /// [email] The email.
  /// [password] The password
  /// Only return [error]. otherwise return [null].
  Future<String?> createUser(User newUse);

  /// Check [email] and [password] to login
  ///
  /// Only return[message][Error] otherwise return [null].
  Future<String?> loginUser(User user);

  /// When user logout delete the idToken.
  Future logout();

  /// Find the idToken into Secure Storage.
  /// Return [String] the idToken or empty string.
  Future<String> getIdtoken();

  /// Get a user from secure data.
  /// 
  /// Return [String] the idToken or empty string.
  Future<User> getUser();
}
