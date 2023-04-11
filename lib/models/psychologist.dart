import 'dart:convert';

class Psychologist {

  String? _id;
  String _email;
  String _name;
  String _surname;
  int? _birthdate;
  String? _address;
  String? _creditCard;
  String _pass;
  String? _picture;
  String? _summary;
  String _date_singup;
  String? _bio;
  int? _vote;

  Psychologist(
      {String? id,
      required String email,
      required String name,
      required String surname,
      int? birthdate,
      String? address,
      String? creditCard,
      required String date_singup,
      required String pass,
      String? picture,
      String? summary,
      String? bio,
      int? vote
      }) : _vote = vote, _bio = bio, _summary = summary, _picture = picture, _pass = pass, _date_singup = date_singup, _creditCard = creditCard, _address = address, _birthdate = birthdate, _surname = surname, _name = name, _email = email, _id = id;

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

  int? get birthdate => _birthdate;

  set birthdate(int? value) {
    _birthdate = value;
  }

  String? get address => _address;

  set address(String? value) {
    _address = value;
  }

  String? get creditCard => _creditCard;

  set creditCard(String? value) {
    _creditCard = value;
  }

  String get date_singup => _date_singup;

  set date_singup(String value) {
    _date_singup = value;
  }

  String get pass => _pass;

  set pass(String value) {
    _pass = value;
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

  factory Psychologist.fromJson(String str) =>
      Psychologist.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Psychologist.fromMap(Map<String, dynamic> json) => Psychologist(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        surname: json["surname"],
        birthdate: json["age"],
        address: json["address"],
        creditCard: json["credit_card"],
        date_singup: json["date_singup"],
        pass: json["pass"],
        picture: json["picture"],
        summary:json["summary"],
        bio:json["bio"],
        vote:json["vote"]
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "name": name,
        "surname": surname,
        "date": birthdate,
        "address": address,
        "credit_card": creditCard,
        "date_singup": date_singup,
        "pass": pass,
        "picture": picture,
        "summary": summary,
        "bio": bio,
        "vote":vote
      };
}
