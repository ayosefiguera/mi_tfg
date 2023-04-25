import 'package:flutter/material.dart';

class NotificacionService {
  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackbar = SnackBar(
        content: Text(
      message,
      style: const TextStyle(color: Colors.amber, fontSize: 20),
    ));

    messengerKey.currentState!.showSnackBar(snackbar);
  }
}
