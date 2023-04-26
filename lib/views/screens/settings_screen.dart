import 'package:eqlibrum/facade/impl/default_user_facade.dart';
import 'package:eqlibrum/views/screens/legal_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String LEGAL_PAGE = 'legal_terms';
    const String PRIVACITY_PAGE = "privacity";

    final defaultUserFacade =
        Provider.of<DefaultUserFacade>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              const Text(
                'Configuración de cuenta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: const Text(
                      'información personal',
                      style: TextStyle(color: Colors.grey),
                    ),
                    leading: const Icon(Icons.person_2_outlined),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text(
                      'Metodos de pagos y cobros',
                      style: TextStyle(color: Colors.grey),
                    ),
                    leading: const Icon(Icons.credit_card_rounded),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Legal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: const Text(
                      'Terminos y servicios',
                      style: TextStyle(color: Colors.grey),
                    ),
                    leading: const Icon(Icons.balance),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LegalScreen(
                                page: LEGAL_PAGE,
                              )));
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Politica de privacidad',
                      style: TextStyle(color: Colors.grey),
                    ),
                    leading: const Icon(Icons.shield_outlined),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LegalScreen(
                                page: PRIVACITY_PAGE,
                              )));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Account Option',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              ListTile(
                title: const Text(
                  'Delete Account',
                  style: TextStyle(color: Colors.red),
                ),
                leading: const Icon(Icons.person_off_outlined),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  defaultUserFacade.logout();
                  Navigator.pushReplacementNamed(context, 'welcome');
                },
              ),
              ListTile(
                title: const Text(
                  'Close Session',
                  style: TextStyle(color: Colors.grey),
                ),
                leading: const Icon(Icons.exit_to_app_outlined),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  defaultUserFacade.logout();
                  Navigator.pushReplacementNamed(context, 'welcome');
                },
              ),
            ],
          ),
        ));
  }
}
