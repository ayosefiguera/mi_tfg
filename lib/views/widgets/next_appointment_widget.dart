import 'package:eqlibrum/dto/appointment_dto.dart';
import 'package:eqlibrum/utils/utils.dart';
import 'package:eqlibrum/facade/appointment_facade.dart';
import 'package:eqlibrum/facade/impl/default_appointment_facade.dart';
import 'package:eqlibrum/views/screens/meet_screen.dart';
import 'package:eqlibrum/views/themes/themes.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:card_swiper/card_swiper.dart';

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
                  appointmentFacade: appointmentFacade,
                  appointment: appointmentFacade.getEventsForDay(kToday));
            } else {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
          }
        });
  }
}

class _NextAppointment extends StatelessWidget {
  const _NextAppointment(
      {required this.appointmentFacade, required this.appointment});

  final List<AppointmentDTO> appointment;
  final AppointmentFacade appointmentFacade;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return (appointment.isEmpty)
        ? Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: AppTheme.primaryligth,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: const [
                  Text(
                    "Not appointment today",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryDark,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ])))
        : SizedBox(
            width: double.infinity,
            child: Swiper(
              itemCount: appointment.length,
              layout: SwiperLayout.STACK,
              itemWidth: size.width * 0.85,
              itemHeight: size.height * 0.14,
              itemBuilder: (_, int index) =>
                  _CardAppointment(appointment: appointment[index]),
            ));
  }
}

class _CardAppointment extends StatelessWidget {
  _CardAppointment({
    required this.appointment,
  });

  final AppointmentDTO appointment;
  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    bool isOn = false;
    const textStyle =
        TextStyle(color: AppTheme.primaryDark, fontWeight: FontWeight.bold);
    final String formattedMonth =
        DateFormat('y-dd-MM hh:mm').format(appointment.date!);
    if (now.isBefore(appointment.date!)) {
      isOn = true;
    }
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: AppTheme.primaryligth,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "Next appointment",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryDark,
              ),
              textAlign: TextAlign.left,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    color: Colors.white,
                    height: 60,
                    width: 60,
                    child: const Icon(
                      Icons.calendar_month,
                      color: AppTheme.secundary,
                      size: 40,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          const Text(
                            "Date",
                            style: textStyle,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(formattedMonth),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          const Text(
                            "Dr/a:",
                            style: textStyle,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text("${appointment.psychologistFullName}"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          const Text(
                            "Patient:",
                            style: textStyle,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(appointment.userFullName ?? "no asignet"),
                        ],
                      ),
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    color: Colors.white,
                    height: 60,
                    width: 60,
                    child: IconButton(
                      onPressed: () {
                        if (isOn) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MeetingScreen(appointment: appointment)));
                        }
                      },
                      icon: (isOn)
                          ? const Icon(
                              Icons.phone,
                              color: AppTheme.open,
                            )
                          : const Icon(
                              Icons.phone,
                              color: AppTheme.close,
                            ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
