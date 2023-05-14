import 'package:eqlibrum/dto/user_dto.dart';

/// Local repository for managing user
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class LocalRepositoryFacade {
  /// When user logout delete the idToken.
  Future logout();

  /// Find the idToken into Secure Storage.
  /// Return [String] the idToken or empty string.
  Future<String> getIdtoken();

  /// Find the idName into Secure Storage.
  /// Return [UserDTO] the userdata.
  Future<UserDTO> getUser();

  /// Get the rol from Secure Storage.
  /// Return [String] the idToken or empty string.
  Future<String> getRol();

  /// Check is user is load.
  /// Return [bool] the idToken or empty string.
  Future<bool> loadUser();

  /// Get the currentUser storage in menber variable..
  UserDTO getCurrentUser();

  /// change the state loading.
  void changeloadingtStatus(bool state) ;

  /// Get the state loading.
  bool getLoadingStatus();
}
