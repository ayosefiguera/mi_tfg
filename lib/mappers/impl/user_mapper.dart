import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/mappers/enity_mapper.dart';
import 'package:eqlibrum/models/models.dart';

class UserMapper implements EntityMapper<UserDTO, User> {
  @override
  UserDTO toDTO(User source) {
    UserDTO target = UserDTO();
    target.id = source.id;
    target.name = source.name;
    target.surname = source.surname;
    target.picture = source.picture;
    target.summary = source.summary;
    return target;
  }

  @override
  List<UserDTO> toDTOList(List<User> entityList) {
    // TODO: implement toDTOList
    throw UnimplementedError();
  }

  @override
  User toEntity(UserDTO source) {
    User target = User(
        name: source.name ?? '',
        email: source.email ?? '',
        surname: source.surname ?? '',
        pass: source.pass ?? '',
        timestamp: DateTime.now().millisecondsSinceEpoch);
    return target;
  }

  @override
  User updateEntity(UserDTO dto, User baseEntity) {
    // TODO: implement updateEntity
    throw UnimplementedError();
  }
}
