import 'package:eqlibrum/facade/impl/default_pyshologist_facade.dart';
import 'package:eqlibrum/facade/psychologist_facade.dart';
import 'package:eqlibrum/utils/utils.dart';
import 'package:eqlibrum/facade/appointment_facade.dart';
import 'package:eqlibrum/facade/impl/default_appointment_facade.dart';
import 'package:eqlibrum/models/appointment.dart';
import 'package:eqlibrum/views/themes/themes.dart';
import 'package:eqlibrum/views/widgets/psychologist_card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:eqlibrum/utils/utils.dart';
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

  final List<Appointment> appointment;
  final AppointmentFacade appointmentFacade;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        margin: const EdgeInsets.symmetric(vertical: 8),
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

  final Appointment appointment;
  final PsychologistFacade psychologistFacade = DefaultPsychologistFacade();
  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    bool isOn = false;
    const textStyle =
        TextStyle(color: AppTheme.primaryDark, fontWeight: FontWeight.bold);
    final String formattedMonth =
        DateFormat('y-dd-MM hh:mm').format(appointment.date);
    if (now.isBefore(appointment.date)) {
      isOn = true;
    }
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: AppTheme.primaryligth,
          borderRadius: BorderRadius.circular(10)),
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
            FutureBuilder(
                future: psychologistFacade
                    .getPsychologistName(appointment.psychologistID),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (!snapshot.hasData) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Loading...'),
                        CircularProgressIndicator.adaptive(),
                      ],
                    );
                  }
                  if (snapshot.data != '') {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                                    Text("${snapshot.data}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          (isOn)
                              ? IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.phone,
                                    color: Colors.green,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.phone,
                                    color: Colors.grey,
                                  ),
                                )
                        ],
                      ),
                    );
                    ;
                  }
                  return Text("error");
                })
          ],
        ),
      ),
    );
  }
}
