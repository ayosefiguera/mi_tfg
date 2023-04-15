import 'package:eqlibrum/views/widgets/botton_nav_container.dart';
import 'package:eqlibrum/views/widgets/scaffold_app.dart';
import 'package:flutter/material.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';

class SearchPsychologistScreen extends StatelessWidget {
  const SearchPsychologistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(index: 0, child: const PsychologistTiles());
  }
}
