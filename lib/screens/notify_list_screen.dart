import 'package:eqlibrum/widgets/botton_nav_container.dart';
import 'package:flutter/material.dart';
import 'package:eqlibrum/widgets/widgets.dart';

class NotifyListScreen extends StatelessWidget {
  const NotifyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('notify'), actions: <Widget>[
          //TODO Create Hero profile.
          IconButton(onPressed: () {}, icon: Icon(Icons.person))
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //TODO Add navigation to phone jitsi room.
          },
          child: const Icon(Icons.phone),
        ),
        bottomNavigationBar: BottonNavContainer(currentIndex: 3),
        body: Container(
          child: const Text('notify'),
        ));
  }
}
