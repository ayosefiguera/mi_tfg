import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';

abstract class UserFacade extends ChangeNotifier{
  // Validate login User.
  Future<bool> loginUser(UserDTO userDTO);
  // Delete idToke
  logout();
  //get User to work with data
  getUser();
  // Create NewUser.
  Future<bool> createUser(UserDTO userDTO);

  /// Get Token
  Future<String> getIdToken();

  /// Update User's account.
  ///
  /// Return [bool] return if account was update succefully.
  Future<bool> updateUser(UserDTO user);

  /// Delete User's account.
  ///  
  /// Return [bool] return if account was deleted succefully.
  Future<bool> deleteUser();
}
