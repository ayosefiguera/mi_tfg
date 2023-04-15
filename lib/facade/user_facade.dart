import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/providers/login_form_provider.dart';

abstract class UserFacade {
  
  // Validate login User.
  Future<String?> loginUser(String email, String password);
  // Delete idToke
  logout();
  //get User to work with data
  getUser();
  // Create NewUser.
  Future<String?> createUser(String email, String password, String name);
  /// Get Token
  
  Future<String> getIdToken();
}
