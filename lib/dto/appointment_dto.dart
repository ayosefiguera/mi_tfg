class AppointmentDTO {
  AppointmentDTO(
      {required this.psychologistID,
      required this.date,
      this.status,
      this.id,
      required this.avaliable});

  String? id;
  String psychologistID;
  DateTime date;
  bool? status;
  bool avaliable;

  @override
  String toString() => "$psychologistID ${date.hour}:${date.minute}";
}
