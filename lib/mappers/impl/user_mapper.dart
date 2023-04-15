import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/mappers/enity_mapper.dart';
import 'package:eqlibrum/models/models.dart';

class UserMapper implements EntityMapper<UserDTO, User> {
  
  UserDTO toDTO(User entity) {
    // TODO: implement toDTO
    throw UnimplementedError();
  }

  @override
  List<UserDTO>  toDTOList(List<User> entityList){
    // TODO: implement toDTOList
    throw UnimplementedError();
  }

  @override
  User toEntity(UserDTO dto) {
    // TODO: implement toEntity
    throw UnimplementedError();
  }

  @override
  User updateEntity(UserDTO dto, User baseEntity) {
    // TODO: implement updateEntity
    throw UnimplementedError();
  }

}
