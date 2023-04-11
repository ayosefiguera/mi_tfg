import 'package:eqlibrum/services/services.dart';
import 'package:flutter/material.dart';
import 'package:eqlibrum/screens/screens.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:eqlibrum/widgets/widgets.dart';

class PsychologistTiles extends StatelessWidget {
  const PsychologistTiles({super.key});

  @override
  Widget build(BuildContext context) {
    final psychologistService = Provider.of<PsychologistService>(context);
    final psychologists = psychologistService.psychologists;

    return ListView.builder(
        itemCount: psychologists.length,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PsychologistDetailScreen(psychologist: psychologists[index])));
              },
              child: PsychologistCard(psychologist: psychologists[index]),
            ));
  }
}
