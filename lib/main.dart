import 'package:flutter/material.dart';
import 'package:eqlibrum/routers/app_router.dart';
import 'package:eqlibrum/themes/themes.dart';
//import 'package:provider/provider.dart';

void main() => runApp(const Eqlibrum());

/**
class AppState extends StatelessWidget {
  const AppState({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [], //Los providers o controlladores se iniciara aqui.
      child: const Eqlibrum(),
    );
  }
}
*/

class Eqlibrum extends StatelessWidget {
  const Eqlibrum({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mqlibrum',
      initialRoute: AppRoutes.initialRoute,
      theme: AppTheme.baseTheme,
      routes: AppRoutes.appRoutes,
    );
  }
}
