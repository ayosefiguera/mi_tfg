import 'package:eqlibrum/dto/appointment_dto.dart';
import 'package:eqlibrum/facade/appointment_facade.dart';
import 'package:eqlibrum/facade/impl/default_appointment_facade.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

void appointmentDialog(BuildContext context, AppointmentDTO appointment) async {
  final AppointmentFacade appointmentFacade = DefaultAppointmentFacade();

  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () => {Navigator.pop(context)},
              child: const Text(
                'Back',
                style: TextStyle(fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () async {
                appointmentFacade.cancelAppointment(appointment);
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel Appointment',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            )
          ],
          elevation: 5,
          title: const Text('Appointment Info'),
          content: _InfoAppointment(appointment: appointment),
        );
      });
}

class _InfoAppointment extends StatelessWidget {
  const _InfoAppointment({required this.appointment});

  final AppointmentDTO appointment;

  @override
  Widget build(BuildContext context) {
    final String formattedMonth =
        DateFormat('y-dd-MM hh:mm').format(appointment.date!);
    var textStyle =
        TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Doctor:",
          style: textStyle,
        ),
        Text(appointment.psychologistFullName!),
        const Divider(height: 30),
        Text(
          "Patient:",
          style: textStyle,
        ),
        Text(appointment.userFullName!),
        const Divider(height: 30),
        Text(
          "Appointment Date:",
          style: textStyle,
        ),
        Text(formattedMonth),
      ],
    );
  }
}
