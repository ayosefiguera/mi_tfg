///
/// Service about auth.
///
abstract class UserDAO {
  
  /// Create new user User.
  /// [email] The email.
  /// [password] The password
  /// Only return [error]. otherwise return [null].
  Future<String?> createUser(String email, String password, String name);

  /// Check [email] and [password] to login
  ///
  /// Only return[message][Error] otherwise return [null].
  Future<String?> loginUser(String email, String password);

  /// When user logout delete the idToken.
  Future logout();

  /// Find the idToken into Secure Storage.
  /// Return [String] the idToken or empty string.
  Future<String> getIdtoken();

  /// Find the idName into Secure Storage.
  /// Return [String] the idToken or empty string.
  Future getUser();
}
