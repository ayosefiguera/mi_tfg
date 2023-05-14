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
  Future<bool> createUser(User newUSer);

  /// Check [email] and [password] to login
  ///
  /// Only return[message][Error] otherwise return [null].
  Future<bool> loginUser(User user);

  //get User Name by given  id
  Future<User?> getUserById(String id);

  /// When user logout delete the idToken.
  Future logout();

  /// Find the idToken into Secure Storage.
  /// Return [String] the idToken or empty string.
  Future<String> getIdtoken();

  /// Find the idName into Secure Storage.
  /// Return [String] the idToken or empty string.
  Future<User> getUser();

  /// Update User's account.
  ///
  /// Return [bool] return if account was update succefully.
  Future<bool> updateUser(User user);

  /// Delete User's account.
  ///
  /// Return [bool] return if account was deleted succefully.
  Future<bool> deleteUser();
}
