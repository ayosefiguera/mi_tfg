class AppointmentDTO {
  AppointmentDTO(
      {this.id,
      this.psychologistID,
      this.psychologistFullName,
      this.userID,
      this.userFullName,
      this.date,
      this.status,});

  String? id;
  String? psychologistID;
  String? psychologistFullName;
  String? userID;
  String? userFullName;
  DateTime? date;
  String? status;
}
