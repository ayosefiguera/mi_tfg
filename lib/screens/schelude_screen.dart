import 'package:eqlibrum/themes/themes.dart';
import 'package:eqlibrum/widgets/scaffold_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;

import 'package:eqlibrum/services/services.dart' show AppointmentController;
import 'package:eqlibrum/models/models.dart';

import 'package:table_calendar/table_calendar.dart';

import 'package:eqlibrum/utils/utils.dart';
import '../widgets/botton_nav_container.dart';

class ScheludeScreen extends StatelessWidget {
  const ScheludeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appointments = Provider.of<AppointmentController>(context);

    return ScaffoldApp(
      index: 2,
      child: appointments.isLoading
          ? const Center(
              child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    color: AppTheme.primary,
                  )),
            )
          : TabletAppointment(appointments: appointments),
    );
  }
}

class TabletAppointment extends StatefulWidget {
  TabletAppointment({super.key, required this.appointments});
  AppointmentController appointments;

  @override
  _TabletAppointmentState createState() =>
      _TabletAppointmentState(appointments: appointments);
}

class _TabletAppointmentState extends State<TabletAppointment> {
  AppointmentController appointments;

  _TabletAppointmentState({required this.appointments});

  late ValueNotifier<List<Appointment>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _focusedDay = kToday;
  DateTime? _selectedDay = kToday;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents =
        ValueNotifier(appointments.getEventsForDay(_selectedDay!));
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

      _selectedEvents.value = appointments.getEventsForDay(seletedDay);
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
            calendarFormat: _calendarFormat,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(outsideDaysVisible: false),
            eventLoader: appointments.getEventsForDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: _onDaySelected,
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
                  return _AppointmentCard(appointment: value[index]);
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
  const _AppointmentCard({required this.appointment});
  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    Color statusColor = appointment.status! ? AppTheme.primary : Colors.black54;

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: statusColor, style: BorderStyle.solid, width: 2)),
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
              "${appointment.date_Key.day}:${appointment.date_Key.minute}",
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(
              width: 18,
            ),
            Column(
              children: [
                Text(
                  appointment.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ));
  }
}
