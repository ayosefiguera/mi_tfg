import 'dart:convert';

import 'package:eqlibrum/models/user.dart';

class Psychologist extends User {
  String? id;
  String? email;
  String? name;
  String? surname;
  int? birthdate;
  String? address;
  String? creditCard;
  int? timestamp;
  String? pass;
  String? picture;
  String? summary;
  String? bio;
  String? rol;
  int? vote;

  Psychologist(
      {this.id,
      this.email,
      this.name,
      this.surname,
      this.birthdate,
      this.address,
      this.creditCard,
      this.timestamp,
      this.pass,
      this.picture,
      this.summary,
      this.bio,
      this.rol,
      this.vote})
      : super(
            id: id,
            email: email,
            surname: surname,
            birthdate: birthdate,
            address: address,
            creditCard: creditCard,
            timestamp: timestamp,
            pass: pass,
            picture: picture);

  factory Psychologist.fromJson(String str) =>
      Psychologist.fromMap(json.decode(str));

  factory Psychologist.fromMap(Map<String, dynamic> json) => Psychologist(
      id: json["id"],
      email: json["email"],
      name: json["name"],
      surname: json["surname"],
      birthdate: json["age"],
      address: json["address"],
      creditCard: json["credit_card"],
      timestamp: json["timestamp"],
      pass: json["pass"],
      picture: json["picture"],
      summary: json["summary"],
      bio: json["bio"],
      rol: json["rol"],
      vote: json["vote"]);

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "name": name,
        "surname": surname,
        "date": birthdate,
        "address": address,
        "credit_card": creditCard,
        "timestamp": timestamp,
        "pass": pass,
        "picture": picture,
        "summary": summary,
        "bio": bio,
        "rol":rol,
        "vote": vote
      };
}
