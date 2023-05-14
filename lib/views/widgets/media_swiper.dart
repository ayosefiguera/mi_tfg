import 'package:card_swiper/card_swiper.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MediaSwiper extends StatelessWidget {
  const MediaSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Swiper(
        itemCount: 5,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.85,
        itemHeight: size.height * 0.22,
        itemBuilder: (_, int index) => MediaCardWidget(),
      ),
    );
  }
}
