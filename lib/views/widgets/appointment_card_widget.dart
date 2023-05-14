import 'package:eqlibrum/dto/appointment_dto.dart';
import 'package:eqlibrum/facade/appointment_facade.dart';
import 'package:eqlibrum/views/themes/themes.dart';
import 'package:eqlibrum/views/widgets/appointmet_dialog_widget.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class AppointmentCardWidget extends StatelessWidget {
  const AppointmentCardWidget(
      {required this.appointment});
  final AppointmentDTO appointment;

  @override
  Widget build(BuildContext context) {
    Color statusColor = AppTheme.appointmentStatus[appointment.status]!;

    final String formattedMonth =
        DateFormat('dd-MMMM').format(appointment.date!);
    final String formattedDay = DateFormat('kk:mm').format(appointment.date!);
    const TextStyle styleText = TextStyle(color: Colors.white70, fontSize: 18);

    return GestureDetector(
      onTap: () => appointmentDialog(context, appointment),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: statusColor,
              border: Border.all(
                  color: statusColor, style: BorderStyle.solid, width: 2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.event,
                    color: Colors.white,
                    size: 48,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(formattedMonth, style: styleText),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 18,
                  ),
                  const Icon(
                    Icons.watch_later_outlined,
                    color: Colors.white,
                    size: 48,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    formattedDay,
                    style: styleText,
                  ),
                ],
              )
            ],
          )),
    );
  }
}