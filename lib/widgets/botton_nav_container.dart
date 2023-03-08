import 'package:flutter/material.dart';

class BottonNavContainer extends StatelessWidget {
  int currentIndex;

  BottonNavContainer({
    super.key,
    this.currentIndex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        //TODO add uiProvider to navigate page.
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, 'search');
              break;
            case 1:
              Navigator.pushNamed(context, 'home');
              break;
          }
        },
        type: BottomNavigationBarType.fixed, // needed for 4 or more icons
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: 'schelude'),
          BottomNavigationBarItem(
              icon: Icon(Icons.mark_email_unread_outlined), label: 'notify'),
        ]);
  }
}
