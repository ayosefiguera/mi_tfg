import 'dart:convert';

class Appointment {
  Appointment(
      {required this.psychologistID,
      this.userID,
      required this.date,
      required this.status,
      this.id});

  String? id;
  String psychologistID;
  String? userID;
  DateTime date;
  String? status;

  factory Appointment.fromJson(String str) =>
      Appointment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Appointment.fromMap(Map<String, dynamic> json) => Appointment(
      id: json["id"],
      psychologistID: json["psychologistID"],
      userID: json["userID"],
      date: DateTime.parse(json["date"]),
      status: json["status"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "psychologistID": psychologistID,
        "userID": userID,
        "date": date.toString(),
        "status": status,
      };

  @override
  String toString() => "$psychologistID $date";
}
