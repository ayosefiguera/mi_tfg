import 'package:eqlibrum/daos/impl/default_local_repository.dart';
import 'package:eqlibrum/daos/impl/default_pages_dao.dart';
import 'package:eqlibrum/facade/impl/defaul_legal_page_facade.dart';
import 'package:eqlibrum/facade/impl/default_appointment_facade.dart';
import 'package:eqlibrum/facade/impl/default_local_repository_facade.dart';
import 'package:eqlibrum/facade/impl/default_pyshologist_facade.dart';
import 'package:eqlibrum/facade/impl/default_user_facade.dart';
import 'package:eqlibrum/providers/providers.dart';
import 'package:eqlibrum/services/impl/defaul_legal_pages_services.dart';
import 'package:eqlibrum/services/notificacion_service.dart';
import 'package:flutter/material.dart';

import 'package:intl/date_symbol_data_local.dart' show initializeDateFormatting;
import 'package:provider/provider.dart';

import 'package:eqlibrum/routers/app_router.dart';
import 'package:eqlibrum/views/themes/themes.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const AppState()));
}

class AppState extends StatelessWidget {
  const AppState({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DefaultPsychologistFacade()),
        ChangeNotifierProvider(create: (_) => DefaultUserFacade()),
        ChangeNotifierProvider(create: (_) => LoginFormProvider()),
        ChangeNotifierProvider(create: (_) => DefaultLegalPageFacade()),
        ChangeNotifierProvider(create: (_) => DefaultLocalRepositoryFacade()),
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
      scaffoldMessengerKey: NotificacionService.messengerKey,
    );
  }
}
