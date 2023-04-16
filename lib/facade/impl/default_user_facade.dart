import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/facade/user_facade.dart';
import 'package:eqlibrum/mappers/impl/user_mapper.dart';
import 'package:eqlibrum/services/impl/default_user_service.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';

class DefaultUserFacade extends ChangeNotifier implements UserFacade {
  UserDTO userDTO = UserDTO();
  UserMapper mapper = UserMapper();

  DefaultUserFacade() {
    getUser();
  }

  final DefaultUserService defaultUserService = DefaultUserService();

  @override
  Future<String?> createUser(UserDTO newUserDTO) {
    return getUserService().createUser(mapper.toEntity(newUserDTO));
  }

  @override
  Future<UserDTO> getUser() async {
    userDTO = mapper.toDTO(await getUserService().getUser());
    return userDTO;
  }

  @override
  logout() {
    getUserService().logout();
  }

  @override
  Future<String?> loginUser(userDTO) {
    return getUserService().loginUser(mapper.toEntity(userDTO));
  }

  DefaultUserService getUserService() {
    return defaultUserService;
  }

  @override
  Future<String> getIdToken() {
    return getUserService().getIdtoken();
  }
}
