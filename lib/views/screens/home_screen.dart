import 'package:eqlibrum/Constanst.dart';
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
                    Text(
                      "Upconming appointments",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.indigo.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(8)),
                      ),
                      onPressed: () => Navigator.pushNamed(context, 'schelude'),
                      child: const Text(
                        'See all',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
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
                Text(
                  "News, courses, and podcasts",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo.shade900,
                      fontWeight: FontWeight.bold),
                ),
                const BottonTable(),
                const SizedBox(
                  height: 18,
                ),
                const swiper_container(),
              ],
            ),
          ),
        ));
  }
}

class swiper_container extends StatelessWidget {
  const swiper_container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localRepositoryFacade =
        Provider.of<DefaultLocalRepositoryFacade>(context, listen: false);
    return FutureBuilder(
      future: localRepositoryFacade.whatRol(),
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
                  Text(
                    "Last news",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.indigo.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'multimedia');
                      },
                      icon: const Icon(Icons.newspaper)),
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
                Text(
                  "Let's find your doctor",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo.shade900,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'search');
                    },
                    icon: const Icon(Icons.search)),
              ],
            ),
            const PsychologistCardSwiper(),
          ],
        );
      },
    );
  }
}
