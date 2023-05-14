import 'package:eqlibrum/constanst.dart';
import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/facade/impl/default_local_repository_facade.dart';
import 'package:eqlibrum/facade/local_repository_facade.dart';
import 'package:eqlibrum/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottonNavContainer extends StatelessWidget {
  final int currentIndex;

  const BottonNavContainer({
    super.key,
    this.currentIndex = 1,
  });
  @override
  Widget build(BuildContext context) {
    final LocalRepositoryFacade localRepository =
        Provider.of<DefaultLocalRepositoryFacade>(context);
    UserDTO userDTO = localRepository.getCurrentUser();
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          switch (index) {
            case 0:
              (userDTO.rol == Constants.PSYCHOLOGIST)
                  ? Navigator.pushNamed(context, AppRoutes.appointmetslist)
                  : Navigator.pushNamed(context, AppRoutes.search);
              break;
            case 1:
              Navigator.pushNamed(context, AppRoutes.home);
              break;
            case 2:
              Navigator.pushNamed(context, AppRoutes.calendar);
              break;
            case 3:
              Navigator.pushNamed(context, AppRoutes.multimedia);
              break;
          }
        },
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: 'Calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_outlined), label: 'Multimedia'),
        ]);
  }
}
