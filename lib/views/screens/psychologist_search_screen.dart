import 'package:eqlibrum/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SearchPsychologistScreen extends StatelessWidget {
  const SearchPsychologistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldApp(index: 0, child: PsychologistTiles());
  }
}
