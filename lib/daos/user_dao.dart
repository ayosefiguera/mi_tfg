import 'package:eqlibrum/models/user.dart';

/// An interface for user DAO including operations for retrieving
/// persistend user model objects.
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class UserDAO {
  /// Create new auth credential for the new user.
  /// [newUser] The userData.
  /// Only return [error]. otherwise throw error.
  Future<String> createCredentialAuth(User newUse);

  /// Delete auth credential:
  /// [UserToken] The credential token.
  Future<bool> deleteAuthUser(String userToken);
  
  /// Create new User in database.
  /// [newUser] The user data.
  /// return [bool]. the state operation.
  Future<User> createNewUser(User newUse);

  /// Delte User from database.
  /// [newUser] The user data.
  /// return [bool]. the state operation.
  Future<bool> deleteUserData(User newUse);

  /// Check [email] and [password] to login
  Future<bool> loginUser(User user);

  /// Update User's account.
  ///
  /// Return [User] return user updated
  Future<User> updateUser(User user);


  /// Find User with a id given.
  ///
  /// Only return [user] if found. otherwise return [null].
  Future<User?> findUserById(String id);
}
