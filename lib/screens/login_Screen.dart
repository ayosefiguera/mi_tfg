import 'package:flutter/material.dart';
import 'package:eqlibrum/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:eqlibrum/providers/login_form_provider.dart';

import '../providers/providers.dart';
import '../services/services.dart';
import '../themes/themes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                  child: Image(image: AssetImage('assets/logoW.png')),
                )),
            Positioned(
              bottom: 0,
              child: SingFormsContainer(
                title: 'Wellcome back',
                child: _LoginForm(),
                name: 'Ursula Downs',
              ),
            )
          ],
        ),
      ),
    );
  }
}

// SingInForm
class _LoginForm extends StatelessWidget {
  const _LoginForm();
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
        key: loginForm.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //email
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);
                return regExp.hasMatch(value ?? '') ? null : 'Invalid Email';
              },
              onChanged: (value) => loginForm.email = value,
              decoration: const InputDecoration(
                  prefixIconColor: AppTheme.primary,
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  hintText: 'example@example.com'),
            ),
            TextFormField(
              obscureText: true,
              autocorrect: false,
              onChanged: (value) => loginForm.password = value,
              decoration: const InputDecoration(
                  prefixIconColor: AppTheme.primary,
                  prefixIcon: Icon(Icons.lock_outline_sharp),
                  labelText: 'Password',
                  hintText: '*****'),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Forgot password?',
              style: TextStyle(color: AppTheme.primary),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: MaterialButton(
                  minWidth: double.infinity,
                  color: AppTheme.primary,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: const StadiumBorder(),
                  onPressed: loginForm.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus(); //Disable keyboard

                          final authService =
                              Provider.of<AuthService>(context, listen: false);

                          if (!loginForm.isValidForm()) return;

                          loginForm.isLoading = true;

                          final String? errorMessage = await authService
                              .loginUser(loginForm.email, loginForm.password);

                          if (errorMessage == null) {
                            Navigator.pushReplacementNamed(context, 'home');
                          } else {
                            print(errorMessage);
                          }

                          loginForm.isLoading = false;
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
