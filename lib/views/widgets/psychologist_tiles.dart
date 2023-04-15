import 'package:eqlibrum/facade/impl/default_pyshologist_facade.dart';
import 'package:eqlibrum/views/screens/screens.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:eqlibrum/views/widgets/widgets.dart';

class PsychologistTiles extends StatelessWidget {
  const PsychologistTiles({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPsychologistFacade = Provider.of<DefaultPsychologistFacade>(context);
    final psychologists = defaultPsychologistFacade.psychologists;

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
