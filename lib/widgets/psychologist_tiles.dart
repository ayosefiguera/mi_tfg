import 'package:flutter/material.dart';
import 'package:eqlibrum/screens/screens.dart';

class PsychologistTiles extends StatelessWidget {
  const PsychologistTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const PsychologistDetailScreen()));
              },
              child: Container(
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
                      child: const FadeInImage(
                        width: 150,
                        height: 150,
                        placeholder: AssetImage('assets/no-image.jpg'),
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://archivosarkham.com/wp-content/uploads/2021/12/carolyn-fern-card.jpg'),
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
                          const Text(
                            'Dr. Carolyn Fern',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Especialista en Depresión, Ansiedad, Pareja...',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Row(
                            children: const [
                              Icon(Icons.star, color: Colors.amber),
                              Text('4.5 (14 pacientes)')
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}

//TODO need refactor