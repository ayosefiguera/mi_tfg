import 'package:flutter/material.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'package:eqlibrum/routers/app_router.dart';
import 'package:eqlibrum/services/services.dart';
import 'package:eqlibrum/themes/themes.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const AppState()));
}

class AppState extends StatelessWidget {
  const AppState({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PsychologistController()),
        ChangeNotifierProvider(create: (_) => AppointmentController()),
      ],
      child: const Eqlibrum(),
    );
  }
}

class Eqlibrum extends StatelessWidget {
  const Eqlibrum({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EQlibrum',
      initialRoute: AppRoutes.initialRoute,
      theme: AppTheme.baseTheme,
      routes: AppRoutes.appRoutes,
    );
  }
}
