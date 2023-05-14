import 'package:eqlibrum/constanst.dart';
import 'package:eqlibrum/views/themes/themes.dart';
import 'package:eqlibrum/views/widgets/media_swiper.dart';
import 'package:eqlibrum/views/widgets/next_appointment_widget.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eqlibrum/facade/impl/default_local_repository_facade.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
        index: 1,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Upconming appointments",
                      style: TextStyle(
                          fontSize: 16,
                          color: AppTheme.primaryDark,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: AppTheme.secundary,
                      ),
                      onPressed: () => Navigator.pushNamed(context, 'calendar'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                NextAppointment(),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "News, courses, and podcasts",
                  style: TextStyle(
                      fontSize: 18,
                      color: AppTheme.primaryDark,
                      fontWeight: FontWeight.bold),
                ),
                const BottonTable(),
                const SizedBox(
                  height: 18,
                ),
                const SwiperContainer(),
              ],
            ),
          ),
        ));
  }
}

class SwiperContainer extends StatelessWidget {
  const SwiperContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localRepositoryFacade =
        Provider.of<DefaultLocalRepositoryFacade>(context, listen: false);
    return FutureBuilder(
      future: localRepositoryFacade.getRol(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (!snapshot.hasData) {
          return const Text('wait');
        }
        if (snapshot.data == Constants.PSYCHOLOGIST) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Last news",
                    style: TextStyle(
                        fontSize: 18,
                        color: AppTheme.primaryDark,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'multimedia');
                      },
                      icon: const Icon(
                        Icons.newspaper,
                        color: AppTheme.secundary,
                      )),
                ],
              ),
              const MediaSwiper(),
            ],
          );
        }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Let's find your doctor",
                  style: TextStyle(
                      fontSize: 18,
                      color: AppTheme.primaryDark,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'search');
                    },
                    icon: const Icon(
                      Icons.search,
                      color: AppTheme.primaryDark,
                    )),
              ],
            ),
            const PsychologistCardSwiper(),
          ],
        );
      },
    );
  }
}
