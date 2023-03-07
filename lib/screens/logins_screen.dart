import 'package:eqlibrum/themes/themes.dart';
import 'package:flutter/material.dart';

class LoginsScreen extends StatelessWidget {
  const LoginsScreen({Key? key}) : super(key: key);

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
                child: Image(image: AssetImage('assets/eqlibrum_logo.png')),
              ),
              const SizedBox(
                height: 200,
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'singin');
                      },
                      child: const Text('Sing in')),
                  const SizedBox(
                    height: 16,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'singup');
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
