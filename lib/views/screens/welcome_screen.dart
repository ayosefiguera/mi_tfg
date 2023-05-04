import 'package:eqlibrum/Constanst.dart';
import 'package:eqlibrum/facade/impl/default_local_repository_facade.dart';
import 'package:eqlibrum/facade/impl/default_user_facade.dart';
import 'package:eqlibrum/views/screens/screens.dart';
import 'package:eqlibrum/views/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final localRepositoryFacade =
        Provider.of<DefaultLocalRepositoryFacade>(context, listen: false);
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      body: FutureBuilder(
        future: localRepositoryFacade.getIdtoken(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (!snapshot.hasData) {
            return const Text('wait');
          }
          if (snapshot.data != '') {
            Future.microtask(() {
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const HomeScreen(),
                      transitionDuration: const Duration(seconds: 5)));
            });
          }

          return const Registers();
        },
      ),
    );
  }
}

class Registers extends StatelessWidget {
  const Registers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            const SizedBox(
              width: 200,
              child: Image(image: AssetImage('assets/logo.png')),
            ),
            const SizedBox(
              height: 150,
            ),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'login');
                    },
                    child: const Text('Sing in')),
                const SizedBox(
                  height: 16,
                ),
                OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'register');
                    },
                    child: const Text('Sing up')),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              RegisterScreen(rol: Constants.PSYCHOLOGIST)));
                    },
                    child: const Text('Sing up as Psichologist')),
                const SizedBox(
                  height: 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
