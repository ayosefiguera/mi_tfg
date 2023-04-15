import 'dart:convert';

class Appointment {
  Appointment(
      {required this.title, required this.date_Key, this.status, this.id});

  String? id;
  String title;
  DateTime date_Key;
  bool? status;

  factory Appointment.fromJson(String str) =>
      Appointment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Appointment.fromMap(Map<String, dynamic> json) => Appointment(
      id: json["id"],
      title: json["title"],
      date_Key: DateTime.parse(json["date_key"]),
      status: json["status"]);

  Map<String, dynamic> toMap() =>
      {"id": id, "title": title, "date_key": date_Key, "status": status};

  @override
  String toString() => "$title ${date_Key.hour}:${date_Key.minute}";
}
