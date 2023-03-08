import 'package:flutter/material.dart';
import 'package:eqlibrum/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'login';

  static Map<String, Widget Function(BuildContext)> appRoutes = {
    'login': (context) => const LoginsScreen(),
    'singin': (context) => const SingInScreen(),
    'singup': (context) => const SingUpScreen(),
    'home': (context) => const HomeScreen(),
    'detail': (context) => const PsychoDetailScreen(),
    'search': (context) => const SearchPsychoScreen(),
    //'schelude': (context) => const SearchPsychoScreen(),
    //'notify': (context) => const SearchPsychoScreen(),
    'profile': (context) => const SettingsScreen(),
  };
}
