import 'package:flutter/material.dart';

class NotificacionService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackbar = SnackBar(
        content: Text(
      message,
      style: TextStyle(color: Colors.amber, fontSize: 20),
    ));

    messengerKey.currentState!.showSnackBar(snackbar);
  }
}
