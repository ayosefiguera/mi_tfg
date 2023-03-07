import 'package:flutter/material.dart';
import 'package:eqlibrum/widgets/widgets.dart';

import '../themes/themes.dart';

class SingInScreen extends StatelessWidget {
  const SingInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 200,
                child: SizedBox(
                  width: 200,
                  child: Image(image: AssetImage('assets/eqlibrum_logo.png')),
                )),
            Positioned(
              bottom: 0,
              child:
                  SingFormsContainer(title: 'Wellcome back', child: _SingInForm()),
            )
          ],
        ),
      ),
    );
  }
}

// SingInForm
class _SingInForm extends StatelessWidget {
  const _SingInForm();
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFormField(
          obscureText: true,
          autocorrect: false,
          autofocus: true,
          decoration: InputDecoration(
              prefixIconColor: AppTheme.primary,
              prefixIcon: Icon(Icons.lock_outline_sharp),
              labelText: 'Password',
              hintText: '*****'),
        ),
        SizedBox(
          height: 8,
        ),
        const Text(
          'Forgot password?',
          style: TextStyle(color: AppTheme.primary),
        ),
        SizedBox(
          height: 16,
        ),
        Center(
          child: MaterialButton(
              minWidth: double.infinity,
              color: AppTheme.primary,
              elevation: 0,
              padding: EdgeInsets.symmetric(vertical: 10),
              shape: StadiumBorder(),
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
              child: const Text(
                'Sing in',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
        )
      ],
    ));
  }
}
