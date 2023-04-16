import 'dart:convert';

class User {
  String? id;
  String? email;
  String? name;
  String? surname;
  int? birthdate;
  String? address;
  String? creditCard;
  String? pass;
  String? picture;
  String? summary;
  int? timestamp;
  String? bio;
  int? vote;

  User(
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
      this.vote});

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
      id: json["id"],
      email: json["email"],
      name: json["name"],
      surname: json["surname"],
      birthdate: json["age"],
      address: json["address"],
      creditCard: json["credit_card"],
      timestamp: json["date_singup"],
      pass: json["pass"],
      picture: json["picture"],
      summary: json["summary"],
      bio: json["bio"],
      vote: json["vote"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "name": name,
        "surname": surname,
        "date": birthdate,
        "address": address,
        "credit_card": creditCard,
        "date_singup": timestamp,
        "pass": pass,
        "picture": picture,
        "summary": summary,
        "bio": bio,
        "vote": vote
      };
}
