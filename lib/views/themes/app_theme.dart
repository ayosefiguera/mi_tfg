import 'package:flutter/material.dart';

class AppTheme {
  
  // Valores estaticos de nuestra paleta de colores.
  static const Color primary = Color(0xff7cc2e3);
  static const Color secundary = Color.fromARGB(255, 186, 124, 227);
  static const Color backgroundDark = Color.fromARGB(255, 54, 111, 138);


// Creamos nuestra diseño desde una copia del modelo base.
  static final ThemeData baseTheme = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0.5),
          selectedItemColor: secundary),

      //floatinAtionbutton
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: primary, elevation: 0),

      //Elevation Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            shape: const StadiumBorder(),
            elevation: 0),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape: const StadiumBorder(),
            foregroundColor: primary,
            textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white38),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            side: BorderSide(color: primary, width: 2),
            elevation: 0),
      ));
}
