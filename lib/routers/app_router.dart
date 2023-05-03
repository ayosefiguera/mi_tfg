import 'package:eqlibrum/views/screens/register_psychologist_screen%20c.dart';
import 'package:flutter/material.dart';
import 'package:eqlibrum/views/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'welcome';

  static Map<String, Widget Function(BuildContext)> appRoutes = {
    'welcome': (context) => const WelcomeScreen(),
    'login': (context) => const LoginScreen(),
    'register': (context) => const RegisterScreen(),
    'registerPsychologist': (context) => const RegisterPsychologistScreen(),
    'home': (context) => const HomeScreen(),
    'search': (context) => const SearchPsychologistScreen(),
    'schelude': (context) => ScheludeScreen(),
    'multimedia': (context) => const MultimediaContentScreen(),
    'profile': (context) => const SettingsScreen(),
    'news': (context) => const MediaScreen(title: 'News'),
    'course': (context) => const MediaScreen(title: 'Course'),
    'podcast': (context) => const MediaScreen(title: 'Podcast'),
  };
}
