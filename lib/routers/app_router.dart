import 'package:flutter/material.dart';
import 'package:eqlibrum/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'login';

  static Map<String, Widget Function(BuildContext)> appRoutes = {
    'login': (context) => const LoginsScreen(),
    'singin': (context) => const SingInScreen(),
    'singup': (context) => const SingUpScreen(),
    'home': (context) => const HomeScreen(),
    'search': (context) => const SearchPsychologistScreen(),
    'schelude': (context) => const ScheludeScreen(),
    'notify': (context) => const NotifyListScreen(),
    'profile': (context) => const SettingsScreen(),
  };
}
