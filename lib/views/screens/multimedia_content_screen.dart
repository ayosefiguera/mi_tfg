import 'package:eqlibrum/views/widgets/media_swiper.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MultimediaContentScreen extends StatelessWidget {
  const MultimediaContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
        index: 3,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "News, courses, and podcasts",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo.shade900,
                      fontWeight: FontWeight.bold),
                ),
                const BottonTable(),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Last News",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo.shade900,
                      fontWeight: FontWeight.bold),
                ),
                const MediaSwiper(),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Last Course",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo.shade900,
                      fontWeight: FontWeight.bold),
                ),
                const MediaSwiper(),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Lats Podcast",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo.shade900,
                      fontWeight: FontWeight.bold),
                ),
                const MediaSwiper(),
              ],
            ),
          ),
        ));
  }
}
