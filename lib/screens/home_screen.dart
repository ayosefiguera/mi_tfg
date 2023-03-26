import 'package:eqlibrum/models/models.dart';
import 'package:eqlibrum/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:eqlibrum/themes/themes.dart';
import 'package:eqlibrum/widgets/widgets.dart';
import 'package:provider/provider.dart' show Provider;

import '../services/services.dart' show AppointmentController;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appointments = Provider.of<AppointmentController>(context);

    return Scaffold(
        appBar: AppBar(title: Text('Welcome, Alberto'), actions: <Widget>[
          //TODO Create Hero profile.
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'profile');
              },
              icon: Icon(Icons.person))
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
                        padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                      ),
                      onPressed: () => Navigator.pushNamed(context, 'schelude'),
                      child: const Text(
                        'See all',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                appointments.isLoading
                    ? const Center(
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator(
                              color: AppTheme.primary,
                            )),
                      )
                    : _NextAppointment(
                        appointment: appointments.getEventsForDay(kToday)),
                SizedBox(
                  height: 18,
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
                PsychologistTiles(),
              ],
            ),
          ),
        ));
  }
}

class _NextAppointment extends StatelessWidget {
  const _NextAppointment({super.key, required this.appointment});

  final List<Appointment> appointment;

  @override
  Widget build(BuildContext context) {
    //#Todo slider.
    Color statusColor = AppTheme.primary;

    return appointment.isEmpty
        ? Container(child: Text("No appointment today"))
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppTheme.primary,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Next Appointment. Day: ${appointment[0].date_Key.day} of ${appointment[0].date_Key.month}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: statusColor,
                            style: BorderStyle.solid,
                            width: 2)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.access_time_outlined,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "${appointment[0].date_Key.day}:${appointment[0].date_Key.minute}",
                          style: const TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Column(
                          children: [
                            Text(
                              appointment[0].title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          );
  }
}
