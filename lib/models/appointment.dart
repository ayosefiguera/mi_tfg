import 'dart:convert';

class Appointment {
  Appointment(
      {required this.psychologistID, required this.date, this.status, this.id});

  String? id;
  String psychologistID;
  DateTime date;
  bool? status;

  factory Appointment.fromJson(String str) =>
      Appointment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Appointment.fromMap(Map<String, dynamic> json) => Appointment(
      id: json["id"],
      psychologistID: json["title"],
      date: DateTime.parse(json["date"]),
      status: json["status"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "psychologistID": psychologistID,
        "date": date,
        "status": status
      };

  @override
  String toString() => "$psychologistID ${date.hour}:${date.minute}";
}
