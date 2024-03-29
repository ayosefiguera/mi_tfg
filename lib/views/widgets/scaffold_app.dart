import 'package:eqlibrum/facade/impl/default_local_repository_facade.dart';
import 'package:eqlibrum/facade/local_repository_facade.dart';
import 'package:eqlibrum/routers/app_router.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ScaffoldApp extends StatelessWidget {
  final Widget child;
  final int index;

  const ScaffoldApp({super.key, required this.child, required this.index});

  @override
  Widget build(BuildContext context) {
    final LocalRepositoryFacade localRepository =
        Provider.of<DefaultLocalRepositoryFacade>(context);
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
          title: localRepository.getLoadingStatus()
              ? const Text('Welcome')
              : Text('Welcome, ${localRepository.getCurrentUser().name}'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.profile);
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
