import 'package:eqlibrum/Constanst.dart';
import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/facade/impl/default_user_facade.dart';
import 'package:eqlibrum/facade/impl/default_pyshologist_facade.dart';
import 'package:eqlibrum/providers/providers.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../themes/themes.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final String? rol;
  RegisterScreen({Key? key, this.rol});
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
            const Positioned(
                top: 150,
                child: SizedBox(
                  width: 200,
                  child: Image(image: AssetImage('assets/logoW.png')),
                )),
            Positioned(
              bottom: 0,
              child: ChangeNotifierProvider(
                create: (_) => LoginFormProvider(),
                child: SingFormsContainer(
                    title: 'New Account $rol', child: _RegisterForm(rol: rol)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// SingInForm
class _RegisterForm extends StatelessWidget {
  final String? rol;
  _RegisterForm({Key? key, this.rol});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    UserDTO userDTO = loginForm.userDTO;
    return Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
              onChanged: (value) => userDTO.email = value,
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
              onChanged: (value) => userDTO.name = value,
              decoration: const InputDecoration(
                  prefixIconColor: AppTheme.primary,
                  prefixIcon: Icon(Icons.person_2_outlined),
                  labelText: 'Name',
                  hintText: 'name'),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              autocorrect: false,
              onChanged: (value) => userDTO.surname = value,
              decoration: const InputDecoration(
                  prefixIconColor: AppTheme.primary,
                  prefixIcon: Icon(Icons.person_2_outlined),
                  labelText: 'Surname',
                  hintText: 'Surname'),
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
              onChanged: (value) => userDTO.pass = value,
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
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: const StadiumBorder(),
                  onPressed: loginForm.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus(); //Disable keyboard

                          if (rol == Constants.PSYCHOLOGIST) {
                            final defaultUserFacade =
                                Provider.of<DefaultUserFacade>(context,
                                    listen: false);
                            loginForm.isLoading = true;

                            final bool operation =
                                await defaultUserFacade.createUser(userDTO);

                            if (operation) {
                              Navigator.pushReplacementNamed(context, 'home');
                            } else {
                              stderr.writeln('Error to create login!!');
                            }

                            loginForm.isLoading = false;
                          } else {
                            final defaultUserFacade =
                                Provider.of<DefaultPsychologistFacade>(context,
                                    listen: false);
                            loginForm.isLoading = true;

                            final bool operation =
                                await defaultUserFacade.createUser(userDTO);

                            if (operation) {
                              Navigator.pushReplacementNamed(context, 'home');
                            } else {
                              stderr.writeln('Error to create login!!');
                            }

                            loginForm.isLoading = false;
                          }
                        },
                  child: Text(
                    loginForm.isLoading ? ' Loading' : 'Sing up',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            )
          ],
        ));
  }
}
