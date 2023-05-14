import 'package:eqlibrum/dto/user_dto.dart';

class PsychologistDTO extends UserDTO {
  PsychologistDTO(
      {this.id,
      this.email,
      this.name,
      this.surname,
      this.pass,
      this.picture,
      this.summary,
      this.bio,
      this.rol,
      this.vote})
      : super(
            id: id,
            email: email,
            name: name,
            surname: surname,
            pass: pass,
            picture: picture);

  String? id;
  String? email;
  String? name;
  String? surname;
  String? address;
  String? pass;
  String? picture;
  String? summary;
  String? bio;
  String? rol;
  int? vote;
}
