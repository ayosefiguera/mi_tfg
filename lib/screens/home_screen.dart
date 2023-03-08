import 'package:flutter/material.dart';
import 'package:eqlibrum/themes/themes.dart';
import 'package:eqlibrum/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO theme
    return Scaffold(
        appBar: AppBar(title: Text('Welcome, Alberto'), actions: <Widget>[
          //TODO Create Hero profile.
          IconButton(onPressed: () {}, icon: Icon(Icons.person))
        ]),
        bottomNavigationBar: BottonNavContainer(
          currentIndex: 1,
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Upcoming Schelude",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.indigo.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                          color: AppTheme.primary, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                //TODO refactorizar
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            width: 60,
                            height: 60,
                            placeholder: AssetImage('assets/no-image.jpg'),
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://archivosarkham.com/wp-content/uploads/2021/12/carolyn-fern-card.jpg'),
                          ),
                        ),
                        Container(
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dr. Carolyn Ferm',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                maxLines: 2,
                                'Especialista en daños mentales y mitos.',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.videocam_outlined,
                                size: 28,
                                color: AppTheme.primary,
                              )),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(25),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.black54.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.schedule_outlined,
                            color: Colors.white70,
                          ),
                          Text(
                            "Sun, jan 19, 8:00am - 10:00am",
                            style: TextStyle(color: Colors.white70),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
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
                    IconButton(onPressed: () {}, icon: Icon(Icons.search))
                  ],
                ),
                //TODO Cambiar ppr un slider
                PsychoTiles(),
              ],
            ),
          ),
        ));
  }
}
