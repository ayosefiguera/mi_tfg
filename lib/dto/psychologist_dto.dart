import 'dart:convert';

class PsychologistDTO {
  PsychologistDTO(
      {this.id,
      this.name,
      this.surname,
      this.picture,
      this.summary,
      this.bio,
      this.vote});

  String? id;
  String? email;
  String? name;
  String? surname;
  String? picture;
  String? summary;
  String? bio;
  int? vote;

}
