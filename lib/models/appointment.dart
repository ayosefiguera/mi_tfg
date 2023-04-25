import 'dart:convert';

class Appointment {
  Appointment(
      {required this.psychologistID,
      this.userID,
      required this.date,
      this.status,
      this.id,
      required this.avaliable});

  String? id;
  String psychologistID;
  String? userID;
  DateTime date;
  bool? status;
  bool? avaliable;

  factory Appointment.fromJson(String str) =>
      Appointment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Appointment.fromMap(Map<String, dynamic> json) => Appointment(
      id: json["id"],
      psychologistID: json["psychologistID"],
      userID: json["userID"],
      date: DateTime.parse(json["date"]),
      status: json["status"],
      avaliable: json["avaliable"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "psychologistID": psychologistID,
        "userID": userID,
        "date": date.toString(),
        "status": status,
        "avaliable": avaliable ?? false
      };

  @override
  String toString() => "$psychologistID $date";
}
