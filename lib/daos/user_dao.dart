import 'package:eqlibrum/models/user.dart';

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
  Future<bool> createUser(User newUse);

  /// Check [email] and [password] to login
  ///
  /// Only return[message][Error] otherwise return [null].
  Future<bool> loginUser(User user);

  /// When user logout delete the idToken.
  Future logout();

  /// Find the idToken into Secure Storage.
  /// Return [String] the idToken or empty string.
  Future<String> getIdtoken();

  /// Get a user from secure data.
  ///
  /// Return [String] the idToken or empty string.
  Future<User> getUser();

  /// Update User's account.
  ///
  /// Return [bool] return if account was update succefully.
  Future<String?> updateUser(User user);

  /// Delete User.
  /// 
  /// Only return [error]. otherwise return [null].
  Future<String?> deleteUser();

  /// Find User with a id given.
  /// 
  /// Only return [user] if found. otherwise return [null].
  Future<User?> findUserById(String id);
}
