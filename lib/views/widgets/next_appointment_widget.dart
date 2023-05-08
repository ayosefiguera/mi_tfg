import 'package:eqlibrum/utils/utils.dart';
import 'package:eqlibrum/facade/appointment_facade.dart';
import 'package:eqlibrum/facade/impl/default_appointment_facade.dart';
import 'package:eqlibrum/models/appointment.dart';
import 'package:eqlibrum/utils/utils.dart';
import 'package:eqlibrum/views/themes/themes.dart';
import 'package:flutter/material.dart';

class NextAppointment extends StatelessWidget {
  NextAppointment({super.key});
  final AppointmentFacade appointmentFacade = DefaultAppointmentFacade();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: appointmentFacade.loadAppointment(''),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    color: AppTheme.primary,
                  )),
            );
          } else {
            if (snapshot.data == true) {
              return _NextAppointment(
                  appointment: appointmentFacade.getEventsForDay(kToday));
            } else {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
          }
        });
  }
}

class _NextAppointment extends StatelessWidget {
  _NextAppointment({required this.appointment});

  final List<Appointment> appointment;

  @override
  Widget build(BuildContext context) {
    Color statusColor = AppTheme.primary;
    return appointment.isEmpty
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppTheme.primary,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: const SizedBox(
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Not appointment today',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  ),
                )))
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppTheme.primary,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Next Appointment. Day: ${appointment[0].date.day}",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
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
                          "${appointment[0].date.day}:${appointment[0].date.minute}",
                          style: const TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Column(
                          children: [
                            Text(
                              appointment[0].psychologistID,
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
