// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class Psychologist {
  Psychologist({
    this.id,
    required this.email,
    required this.name,
    required this.surname,
    this.date,
    this.address,
    this.creditCard,
    required this.dateSingup,
    required this.pass,
  });

  String? id;
  String email;
  String name;
  String surname;
  int? date;
  String? address;
  String? creditCard;
  String dateSingup;
  String pass;

  factory Psychologist.fromJson(String str) =>
      Psychologist.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Psychologist.fromMap(Map<String, dynamic> json) => Psychologist(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        surname: json["surname"],
        date: json["age"],
        address: json["address"],
        creditCard: json["credit_card"],
        dateSingup: json["date_singup"],
        pass: json["pass"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "name": name,
        "surname": surname,
        "date": date,
        "address": address,
        "credit_card": creditCard,
        "date_singup": dateSingup,
        "pass": pass,
      };
}
