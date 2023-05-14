import 'package:flutter/material.dart';
import 'package:eqlibrum/views/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'welcome';
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String register = 'register';
  static const String home = 'home';
  static const String search = 'search';
  static const String calendar = 'calendar';
  static const String multimedia = 'multimedia';
  static const String profile = 'profile';
  static const String news = 'news';
  static const String course = 'course';
  static const String podcast = 'podcast';
  static const String appointmetslist = 'appointmentlist';


  static Map<String, Widget Function(BuildContext)> appRoutes = {
     welcome: (context) => const WelcomeScreen(),
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    home: (context) => const HomeScreen(),
    search: (context) => const SearchPsychologistScreen(),
    calendar: (context) => CalendarScreen(),
    multimedia: (context) => const MultimediaContentScreen(),
    profile: (context) => const SettingsScreen(),
    news: (context) => const MediaScreen(title: 'News'),
    course: (context) => const MediaScreen(title: 'Course'),
    podcast: (context) => const MediaScreen(title: 'Podcast'),
    appointmetslist: (context) => const AppointmentListScreen(),
  };
}
