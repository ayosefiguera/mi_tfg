import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';

abstract class UserFacade extends ChangeNotifier{
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
