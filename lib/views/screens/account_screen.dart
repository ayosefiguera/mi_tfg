import 'dart:io';

import 'package:eqlibrum/constanst.dart';
import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/facade/impl/default_local_repository_facade.dart';
import 'package:eqlibrum/facade/impl/default_pyshologist_facade.dart';
import 'package:eqlibrum/facade/impl/default_user_facade.dart';
import 'package:eqlibrum/facade/local_repository_facade.dart';
import 'package:eqlibrum/providers/login_form_provider.dart';
import 'package:eqlibrum/views/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final LocalRepositoryFacade localRepository =
        Provider.of<DefaultLocalRepositoryFacade>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Account"),
        ),
        body: FutureBuilder<bool>(
            future: localRepository.loadUser(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        color: AppTheme.primary,
                      )),
                );
              } else {
                if (snapshot.data == true) {
                  return AccountInfo(user: localRepository.getCurrentUser());
                } else {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
              }
            }));
  }
}

class AccountInfo extends StatefulWidget {
  final bool formMode = false;
  const AccountInfo({super.key, required this.user});
  final UserDTO user;

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  bool formMode = false;
  @override
  void initState() {
    formMode = widget.formMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void changeformMode() {
      setState(() => formMode = !formMode);
    }

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            (formMode)
                ? Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 10),
                    child: _UpdateForm(user: widget.user),
                  )
                : _DisplayData(user: widget.user),
            ElevatedButton(
                onPressed: () {
                  changeformMode();
                },
                child: (!formMode)
                    ? const Text('Update data')
                    : const Text('Back'))
          ],
        ),
      ),
    );
  }
}

class _UpdateForm extends StatelessWidget {
  final UserDTO user;
  const _UpdateForm({
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    loginForm.userDTO = user;

    InputDecoration inputDecoration(String label, String hint) {
      if (label.isEmpty) label = hint;
      return InputDecoration(
        prefixIconColor: AppTheme.primary,
        prefixIcon: const Icon(Icons.edit_note_rounded),
        labelText: label,
        hintText: hint,
        focusColor: AppTheme.primary.withAlpha(80),
      );
    }

    return Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              autocorrect: false,
              onChanged: (value) => loginForm.userDTO.name = value,
              decoration: inputDecoration(
                loginForm.userDTO.name!,
                'name',
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              autocorrect: false,
              onChanged: (value) => loginForm.userDTO.surname = value,
              decoration:
                  inputDecoration(loginForm.userDTO.surname ?? '', 'surname'),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              autocorrect: false,
              onChanged: (value) => loginForm.userDTO.summary = value,
              decoration:
                  inputDecoration(loginForm.userDTO.summary ?? '', 'summary'),
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: 6,
              maxLines: null,
              autocorrect: false,
              onChanged: (value) => loginForm.userDTO.bio = value,
              decoration: inputDecoration(loginForm.userDTO.bio ?? '', 'bio'),
            ),
            const SizedBox(
              height: 8,
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
                          if (loginForm.userDTO.rol == Constants.PSYCHOLOGIST) {
                            FocusScope.of(context).unfocus();
                            final defaultUserFacade =
                                Provider.of<DefaultPsychologistFacade>(context,
                                    listen: false);

                            if (!loginForm.isValidForm()) return;

                            loginForm.isLoading = true;

                            final bool operation = await defaultUserFacade
                                .updateUser(loginForm.userDTO);

                            if (operation) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacementNamed(
                                  context, 'profile');
                            } else {
                              stderr.writeln('Error to create login!!');
                            }

                            loginForm.isLoading = false;
                          } else {
                            FocusScope.of(context).unfocus();
                            final defaultUserFacade =
                                Provider.of<DefaultUserFacade>(context,
                                    listen: false);

                            if (!loginForm.isValidForm()) return;

                            loginForm.isLoading = true;

                            final bool operation = await defaultUserFacade
                                .updateUser(loginForm.userDTO);

                            if (operation) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacementNamed(
                                  context, 'profile');
                            } else {
                              stderr.writeln('Error to create login!!');
                            }

                            loginForm.isLoading = false;
                          }
                        },
                  child: Text(
                    loginForm.isLoading ? ' Loading' : 'Update',
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

class _DisplayData extends StatelessWidget {
  const _DisplayData({
    required this.user,
  });

  final UserDTO user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 40),
          child: Stack(children: [
            const Picture(),
            Positioned(
                top: 60,
                left: 20,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 40,
                    color: Colors.white70,
                  ),
                )),
            Positioned(
                top: 60,
                right: 20,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    size: 40,
                    color: Colors.white70,
                  ),
                ))
          ]),
        ),
        LabelInfo(
          label: 'Name:',
          info: "${user.name}",
        ),
        LabelInfo(
          label: 'Surname:',
          info: "${user.surname}",
        ),
        LabelInfo(
          label: 'Email:',
          info: "${user.email}",
        ),
        LabelInfo(
          label: 'UserID:',
          info: "${user.id}",
        ),
      ],
    );
  }
}

class Picture extends StatelessWidget {
  const Picture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 1234,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: const FadeInImage(
          width: 150,
          height: 150,
          placeholder: AssetImage('assets/no-image.jpg'),
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947_1280.jpg'),
        ),
      ),
    );
  }
}

class LabelInfo extends StatelessWidget {
  const LabelInfo({super.key, required this.info, required this.label});
  final String label;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              label,
              style: const TextStyle(
                  color: AppTheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 8),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: AppTheme.primary.withAlpha(80))),
              ),
              child: Text(info))
        ],
      ),
    );
  }
}
