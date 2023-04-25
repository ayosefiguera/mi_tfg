import 'package:flutter/material.dart';

class BottonNavContainer extends StatelessWidget {
  final int currentIndex;

  const BottonNavContainer({
    super.key,
    this.currentIndex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, 'search');
              break;
            case 1:
              Navigator.pushNamed(context, 'home');
              break;
            case 2:
              Navigator.pushNamed(context, 'schelude');
              break;
            case 3:
              Navigator.pushNamed(context, 'notify');
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
