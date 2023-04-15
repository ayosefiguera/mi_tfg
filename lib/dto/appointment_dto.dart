import 'dart:convert';

class AppointmentDTO {
  AppointmentDTO(
      {required String title, required DateTime date_Key, bool? status, String? id}) : _status = status, _date_Key = date_Key, _title = title, _id = id;

  String? _id;

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }
  String _title;

  String get title => _title;

  set title(String value) {
    _title = value;
  }
  DateTime _date_Key;

  DateTime get date_Key => _date_Key;

  set date_Key(DateTime value) {
    _date_Key = value;
  }
  bool? _status;

  bool? get status => _status;

  set status(bool? value) {
    _status = value;
  }

  @override
  String toString() => "$title ${date_Key.hour}:${date_Key.minute}";
}
