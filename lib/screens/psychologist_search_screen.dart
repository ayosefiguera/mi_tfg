import 'package:eqlibrum/widgets/botton_nav_container.dart';
import 'package:flutter/material.dart';
import 'package:eqlibrum/widgets/widgets.dart';

class SearchPsychologistScreen extends StatelessWidget {
  const SearchPsychologistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Welcome, {UserName}'), actions: <Widget>[
          //TODO Create Hero profile.
          IconButton(onPressed: () {}, icon: Icon(Icons.person))
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //TODO Add navigation to phone jitsi room.
          },
          child: const Icon(Icons.phone),
        ),
        bottomNavigationBar: BottonNavContainer(currentIndex: 0),
        body: Container(
          color: Color.fromARGB(255, 190, 190, 190),
          child: const PsychologistTiles(),
        ));
  }
}
