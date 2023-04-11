import 'dart:convert';

class PsychologistDTO {
  PsychologistDTO({String? id,
      required String email,
      required String name,
      required String surname,
      String? picture,
      String? summary,
      String? bio,
      int? vote
      }): _vote = vote, _bio = bio, _summary = summary, _picture = picture, _surname = surname, _name = name, _email = email, _id = id;


  String? _id;
  String _email;
  String _name;
  String _surname;
  String? _picture;
  String? _summary;
  String? _bio;
  int? _vote;

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get surname => _surname;

  set surname(String value) {
    _surname = value;
  }

  String? get picture => _picture;

  set picture(String? value) {
    _picture = value;
  }

  String? get summary => _summary;

  set summary(String? value) {
    _summary = value;
  }

  String? get bio => _bio;

  set bio(String? value) {
    _bio = value;
  }

  int? get vote => _vote;

  set vote(int? value) {
    _vote = value;
  }

}
