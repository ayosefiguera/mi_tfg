import 'package:flutter/material.dart';

class BottonTable extends StatelessWidget {
  const BottonTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      child: Table(
        children: const [
          TableRow(children: [
            _BottonItem(
                name: 'News',
                icon: Icons.newspaper,
                background: Colors.purple,
                route: 'news'),
            _BottonItem(
                name: 'Course',
                icon: Icons.storage_rounded,
                background: Colors.blue,
                route: 'course'),
            _BottonItem(
                name: 'Podcast',
                icon: Icons.podcasts,
                background: Colors.teal,
                route: 'podcast'),
          ]),
        ],
      ),
    );
  }
}

class _BottonItem extends StatelessWidget {
  const _BottonItem({
    super.key,
    required this.name,
    required this.icon,
    required this.background,
    required this.route,
  });
  final String name;
  final String route;
  final IconData icon;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        height: 80,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: background.withAlpha(80),
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: background,
              radius: 20,
              child: Icon(
                icon,
                size: 18,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                  color: background, fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
