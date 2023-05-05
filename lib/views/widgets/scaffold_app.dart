import 'package:eqlibrum/daos/impl/default_local_repository.dart';
import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/facade/impl/default_local_repository_facade.dart';
import 'package:eqlibrum/facade/impl/default_user_facade.dart';
import 'package:eqlibrum/facade/local_repository_facade.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ScaffoldApp extends StatelessWidget {
  final Widget child;
  final int index;

  const ScaffoldApp({super.key, required this.child, required this.index});

  @override
  Widget build(BuildContext context) {
    final defaulUserFacade = Provider.of<DefaultLocalRepositoryFacade>(context);
    UserDTO userDTO = defaulUserFacade.currentUser;
    return Scaffold(
      appBar: AppBar(title: Text('Welcome, ${userDTO.name}'), actions: <Widget>[
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'profile');
            },
            icon: const Icon(Icons.person))
      ]),
      bottomNavigationBar: BottonNavContainer(
        currentIndex: index,
      ),
      body: child,
    );
  }
}
