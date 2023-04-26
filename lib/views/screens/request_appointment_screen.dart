import 'package:eqlibrum/facade/appointment_facade.dart';
import 'package:eqlibrum/facade/impl/default_appointment_facade.dart';
import 'package:eqlibrum/models/appointment.dart';
import 'package:eqlibrum/views/themes/themes.dart';
import 'package:eqlibrum/views/widgets/scaffold_app.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:eqlibrum/utils/utils.dart';
import 'package:intl/intl.dart';

class RequestAppointmentScreen extends StatelessWidget {
  RequestAppointmentScreen({super.key, required this.id});
  final String id;
  final AppointmentFacade appointmentFacade = DefaultAppointmentFacade();

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
        index: 2,
        child: FutureBuilder<bool>(
            future: appointmentFacade.loadAppointment(id),
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
                  return _RequestAppointmentScreen(
                      id: id, appointmentFacade: appointmentFacade);
                } else {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
              }
            }));
  }
}

class _RequestAppointmentScreen extends StatefulWidget {
  const _RequestAppointmentScreen(
      {super.key, required this.id, required this.appointmentFacade});
  final String id;
  final AppointmentFacade appointmentFacade;

  @override
  // ignore: no_logic_in_create_state
  _TabletAppointmentState createState() =>
      _TabletAppointmentState(id: id, appointmentFacade: appointmentFacade);
}

class _TabletAppointmentState extends State<_RequestAppointmentScreen> {
  _TabletAppointmentState({required this.id, required this.appointmentFacade});
  final AppointmentFacade appointmentFacade;
  final String id;
  bool loading = true;
  late ValueNotifier<List<Appointment>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _focusedDay = kToday;
  DateTime? _selectedDay = kToday;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents =
        ValueNotifier(appointmentFacade.getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime seletedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, seletedDay)) {
      setState(() {
        _selectedDay = seletedDay;
        _focusedDay = focusedDay;
      });

      _selectedEvents.value = appointmentFacade.getEventsForDay(seletedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          TableCalendar<Appointment>(
            focusedDay: _focusedDay,
            firstDay: kFirstDay,
            lastDay: kLastDay,
            calendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(outsideDaysVisible: false),
            eventLoader: appointmentFacade.getEventsForDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (date, ele) {
              _onDaySelected(date, ele);
            },
            onFormatChanged: (format) => {
              if (_calendarFormat != format)
                {
                  setState(() {
                    _calendarFormat = format;
                  })
                }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "Appointments",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
              child: ValueListenableBuilder<List<Appointment>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return _AppointmentCard(
                      appointmentFacade: appointmentFacade,
                      appointment: value[index]);
                },
              );
            },
          ))
        ],
      ),
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  const _AppointmentCard(
      {required this.appointment, required this.appointmentFacade});
  final AppointmentFacade appointmentFacade;
  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    Color statusColor =
        appointment.status! ? AppTheme.avaliable : AppTheme.notAvaliable;

    String formattedDate = DateFormat('dd-MMMM kk:mm').format(appointment.date);

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: statusColor,
            border: Border.all(
                color: statusColor, style: BorderStyle.solid, width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.event,
              color: Colors.white,
              size: 48,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              formattedDate,
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(
              width: 18,
            ),
            (appointment.status! && appointment.avaliable!)
                ? IconButton(
                    onPressed: () {
                      appointmentFacade.requestAppointment(appointment);
                    },
                    icon: const Icon(Icons.add),
                    iconSize: 32,
                    color: Colors.white,
                  )
                : IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.do_not_disturb_alt_outlined),
                    iconSize: 32,
                    color: Colors.white,
                  )
          ],
        ));
  }
}
