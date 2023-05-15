import 'dart:convert';

class User {
  String? id;
  String? email;
  String? name;
  String? surname;
  String? address;
  String? creditCard;
  String? pass;
  String? picture;
  int? timestamp;
  String? rol;
  String? summary;
  String? bio;

  User(
      {this.id,
      this.email,
      this.name,
      this.surname,
      this.address,
      this.creditCard,
      this.timestamp,
      this.bio,
      this.summary,
      this.pass,
      this.rol,
      this.picture});

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        surname: json["surname"],
        address: json["address"],
        creditCard: json["credit_card"],
        timestamp: json["date_singup"],
        pass: json["pass"],
        rol: json["rol"],
        picture: json["picture"],
        bio: json["bio"],
        summary: json["summary"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "name": name,
        "surname": surname,
        "address": address,
        "credit_card": creditCard,
        "date_singup": timestamp,
        "pass": pass,
        "picture": picture,
        "rol": rol,
        "bio": bio,
        "summary": summary,
      };
}
