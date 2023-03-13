import 'package:eqlibrum/widgets/botton_nav_container.dart';
import 'package:flutter/material.dart';
import 'package:eqlibrum/widgets/widgets.dart';

class SearchPsychologistScreen extends StatelessWidget {
  const SearchPsychologistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Welcome, {UserName}'), actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.person))
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.phone),
        ),
        bottomNavigationBar: BottonNavContainer(currentIndex: 0),
        body: const PsychologistTiles());
  }
}
