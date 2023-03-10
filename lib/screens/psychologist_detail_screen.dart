import 'package:eqlibrum/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:eqlibrum/themes/themes.dart';

class PsychologistDetailScreen extends StatelessWidget {
  const PsychologistDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO theme
    return Scaffold(
        appBar: AppBar(title: Text('Welcome, {UserName}'), actions: <Widget>[
          //TODO Create Hero profile.
          IconButton(onPressed: () {}, icon: Icon(Icons.person))
        ]),
        bottomNavigationBar: BottonNavContainer(
          currentIndex: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(children: [
              Positioned.fill(
                child: _Background(),
              ),
              _doctor_profile()
            ]),
          ),
        ));
  }
}

class _doctor_profile extends StatelessWidget {
  _doctor_profile({
    super.key,
  });

  //TODO: test
  String bio_profile =
      '''Soy Carolyn Ferm, psicóloga colegiada. Atiendo en un espacio especializado en la psicología clínica. Somos un centro que se adapta a cada situación y que ofrece un trato profesional y cálido en todo momento. De esta manera, atendemos a cada paciente desde la armonía y la aceptación incondicional.
          Ofrecemos servicios para la intervención infantojuvenil como para adultos y terapias de pareja. Concretamente, intervenimos en: mejora de habilidades sociales, gestión del estrés, trastornos de la ansiedad, fobias, acompañamiento en el duelo, trastornos del habla, tartamudez y miedo escénico, orientación para padres, trastorno por déficit de atención con o sin hiperactividad, altas capacidades y trastornos de la personalidad. Además, también ofrecemos la realización de informes periciales y mediación familiar.
          Todos los profesionales del centro somos especialistas en distintas áreas y nunca dejamos de formarnos. Nuestro centro se caracteriza por siempre adaptarse a la persona tanto en el proceso terapéutico como en sus horarios. Contamos con profesionales interdisciplinares como logopedas, psicopedagogos, etc.''';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(
                  'https://archivosarkham.com/wp-content/uploads/2021/12/carolyn-fern-card.jpg')),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          padding:
              const EdgeInsets.only(left: 18, right: 18, top: 24, bottom: 32),
          child: Column(
            children: [
              const Text('Dr. Carolyn Ferm',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Especialista en estres, ansiedad, mitos',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber),
                      Text('4.5 (14 pacientes)')
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.phone_in_talk_outlined,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.video_call,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.chat_bubble_outline_outlined,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                bio_profile,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        ElevatedButton(
            onPressed: () {}, child: const Text('Request for Appointment')),
        const SizedBox(
          height: 150,
        )
      ],
    );
  }
}

class _Background extends StatelessWidget {
  _Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              stops: [0.6, 0.9],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppTheme.primary, Color.fromARGB(55, 255, 255, 255)])),
    );
  }
}
