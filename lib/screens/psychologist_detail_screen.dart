import 'package:eqlibrum/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:eqlibrum/models/models.dart';
import 'package:eqlibrum/widgets/recommendation_vote_widget.dart';

class PsychologistDetailScreen extends StatelessWidget {
  PsychologistDetailScreen({Key? key, required this.psychologist})
      : super(key: key);

  Psychologist psychologist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Welcome, {UserName}'), actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.person))
        ]),
        bottomNavigationBar: BottonNavContainer(
          currentIndex: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
                children: [_psychologistProfile(psychologist: psychologist)]),
          ),
        ));
  }
}

class _psychologistProfile extends StatelessWidget {
  _psychologistProfile({super.key, required this.psychologist});

  Psychologist psychologist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 250,
          child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage('${psychologist.picture}'),
              alignment: AlignmentDirectional.topStart),
        ),
        _InfoProfile(psychologist: psychologist),
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

class _InfoProfile extends StatelessWidget {
  const _InfoProfile({
    super.key,
    required this.psychologist,
  });

  final Psychologist psychologist;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      padding: const EdgeInsets.only(left: 18, right: 18, top: 24, bottom: 32),
      child: Column(
        children: [
          Text('${psychologist.name} ${psychologist.surname}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 8,
          ),
          Text(
            psychologist.summary ??= "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RecommendationVoteWidget(vote: psychologist.vote),
              const _ComunicationMethodsEnableWidget(),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            psychologist.bio ??= "bio not enable",
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}

class _ComunicationMethodsEnableWidget extends StatelessWidget {
  const _ComunicationMethodsEnableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
