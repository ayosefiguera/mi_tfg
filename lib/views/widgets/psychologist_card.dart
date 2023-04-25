import 'package:eqlibrum/dto/psychologist_dto.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';

class PsychologistCard extends StatelessWidget {
  const PsychologistCard({super.key, required this.psychologist});

  final PsychologistDTO psychologist;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      height: 150,
      width: double.infinity,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              width: 150,
              height: 150,
              placeholder: const AssetImage('assets/no-image.jpg'),
              fit: BoxFit.cover,
              image: NetworkImage('${psychologist.picture}'),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${psychologist.name} ${psychologist.surname}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  psychologist.summary ??= "",
                  style: const TextStyle(fontSize: 14),
                ),
                RecommendationRatio(vote: psychologist.vote)
              ],
            ),
          )
        ],
      ),
    );
  }
}
