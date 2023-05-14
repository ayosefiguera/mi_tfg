import 'package:eqlibrum/dto/appointment_dto.dart';
import 'package:eqlibrum/facade/appointment_facade.dart';
import 'package:eqlibrum/facade/impl/default_appointment_facade.dart';
import 'package:eqlibrum/views/themes/themes.dart';
import 'package:eqlibrum/views/widgets/appointment_card_widget.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppointmentListScreen extends StatelessWidget {
  AppointmentListScreen({super.key});
  final AppointmentFacade appointmentFacade = DefaultAppointmentFacade();

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      index: 0,
      child: FutureBuilder<bool>(
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
                return AppointmentList(
                    appointmentList: appointmentFacade.getAppointmentList());
              } else {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
            }
          }),
    );
  }
}

class AppointmentList extends StatelessWidget {
  final List<AppointmentDTO> appointmentList;
  const AppointmentList({super.key, required this.appointmentList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appointmentList.length,
      itemBuilder: (__, index) {
        return AppointmentCardWidget(appointment: appointmentList[index]);
      },
    );
    ;
  }
}
