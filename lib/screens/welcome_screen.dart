import 'package:eqlibrum/themes/themes.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      body: SizedBox(
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
                height: 200,
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
