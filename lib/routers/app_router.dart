import 'package:flutter/material.dart';
import 'package:eqlibrum/views/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'welcome';

  static Map<String, Widget Function(BuildContext)> appRoutes = {
    'welcome': (context) => const WelcomeScreen(),
    'login': (context) => const LoginScreen(),
    'register': (context) => const RegisterScreen(),
    'home': (context) => const HomeScreen(),
    'search': (context) => const SearchPsychologistScreen(),
    'schelude': (context) => const ScheludeScreen(),
    'notify': (context) => const NotifyListScreen(),
    'profile': (context) => const SettingsScreen(),
  };
}
