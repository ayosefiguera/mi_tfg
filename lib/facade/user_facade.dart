import 'package:eqlibrum/dto/user_dto.dart';

abstract class UserFacade {
  // Validate login User.
  Future<String?> loginUser(UserDTO userDTO);
  // Delete idToke
  logout();
  //get User to work with data
  getUser();
  // Create NewUser.
  Future<String?> createUser(UserDTO userDTO);

  /// Get Token
  Future<String> getIdToken();
}
