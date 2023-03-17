import 'dart:convert';

class Psychologist {
  Psychologist(
      {this.id,
      required this.email,
      required this.name,
      required this.surname,
      this.birthdate,
      this.address,
      this.creditCard,
      required this.date_singup,
      required this.pass,
      this.picture,
      this.summary,
      this.bio,
      this.vote

      });

  String? id;
  String email;
  String name;
  String surname;
  int? birthdate;
  String? address;
  String? creditCard;
  String date_singup;
  String pass;
  String? picture;
  String? summary;
  String? bio;
  int? vote;


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
