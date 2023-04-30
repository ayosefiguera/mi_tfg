import 'package:card_swiper/card_swiper.dart';
import 'package:eqlibrum/dto/psychologist_dto.dart';
import 'package:eqlibrum/facade/impl/default_pyshologist_facade.dart';
import 'package:eqlibrum/views/screens/screens.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:flutter/material.dart';

class PsychologistCardSwiper extends StatelessWidget {
  const PsychologistCardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPsychologistFacade =
        Provider.of<DefaultPsychologistFacade>(context);
    final psychologists = defaultPsychologistFacade.psychologistsDTO;
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Swiper(
        itemCount: psychologists.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.8,
        itemHeight: size.height * 0.2,
        itemBuilder: (_, int index) {
          final PsychologistDTO psychologist = psychologists[index];

          return GestureDetector(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PsychologistDetailScreen(
                          psychologist: psychologists[index])))
            },
            child: Hero(
              tag: psychologist.id!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(psychologist.picture!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
