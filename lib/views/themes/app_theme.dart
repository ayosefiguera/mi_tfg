import 'package:eqlibrum/constanst.dart';
import 'package:flutter/material.dart';

class AppTheme {
  //Text
  static const styleTextTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppTheme.primary,
  );

  static const Color primary = Color(0xff7cc2e3);
  static const Color secundary = Color.fromARGB(255, 119, 81, 224);
  static const Color primaryligth = Color.fromARGB(255, 180, 212, 226);
  static const Color gray = Color.fromARGB(255, 145, 161, 168);
  static const Color primaryDark = Color.fromARGB(255, 22, 90, 119);
  static const Color backgroundDark = Color.fromARGB(255, 54, 111, 138);

  static const Color open = Colors.lightGreen;
  static const Color close = Colors.black38;
  static const Color cancel = Colors.redAccent;

  static const Map<String, Color> appointmentStatus = {
    Constants.OPEN: open,
    Constants.CANCEL: cancel,
    Constants.CLOSE: close
  };


  static final ThemeData baseTheme = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0.5),
          selectedItemColor: secundary),

      //floatinAtionbutton
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, elevation: 0),

      //Elevation Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            shape: const StadiumBorder(),
            elevation: 0),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape: const StadiumBorder(),
            foregroundColor: primary,
            textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white38),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            side: const BorderSide(color: primary, width: 2),
            elevation: 0),
      ));
}
