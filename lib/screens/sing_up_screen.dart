import 'package:flutter/material.dart';
import 'package:eqlibrum/widgets/widgets.dart';

import '../themes/themes.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 150,
              child: SizedBox(
                width: 200,
                child: Image(image: AssetImage('assets/eqlibrum_logo.png')),
              )),
          Positioned(
            bottom: 0,
            child:
                SingFormsContainer(title: 'New Account', child: _SingInForm()),
          )
        ],
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
          decoration: const InputDecoration(
              prefixIconColor: AppTheme.primary,
              prefixIcon: Icon(Icons.email),
              labelText: 'Email',
              hintText: 'example@example.com'),
        ),

        const SizedBox(
          height: 8,
        ),
        TextFormField(
          keyboardType: TextInputType.name,
          autocorrect: false,
          decoration: const InputDecoration(
              prefixIconColor: AppTheme.primary,
              prefixIcon: Icon(Icons.person_2_outlined),
              labelText: 'User Name',
              hintText: 'Alberto cabrera '),
        ),
        const SizedBox(
          height: 8,
        ),

        TextFormField(
          obscureText: true,
          autocorrect: false,
          validator: ((value) {
            if (value != null && value.length >= 6) return null;
            return 'passsword must be 6 character';
          }),
          decoration: const InputDecoration(
              prefixIconColor: AppTheme.primary,
              prefixIcon: Icon(Icons.lock_outline_sharp),
              labelText: 'Password',
              hintText: '*****'),
        ),
        const SizedBox(
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
