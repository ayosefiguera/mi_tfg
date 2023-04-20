import 'package:eqlibrum/facade/appointment_facade.dart';
import 'package:eqlibrum/facade/impl/default_appointment_facade.dart';
import 'package:eqlibrum/models/appointment.dart';
import 'package:eqlibrum/views/themes/themes.dart';
import 'package:eqlibrum/views/widgets/scaffold_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:table_calendar/table_calendar.dart';
import 'package:eqlibrum/utils/utils.dart';

class ScheludeScreen extends StatelessWidget {
  const ScheludeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentsFacade = Provider.of<DefaultAppointmentFacade>(context);

    return ScaffoldApp(
      index: 2,
      child: appointmentsFacade.isLoading
          ? const Center(
              child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    color: AppTheme.primary,
                  )),
            )
          : TabletAppointment(appointmentsFacade: appointmentsFacade),
    );
  }
}

class TabletAppointment extends StatefulWidget {
  TabletAppointment({super.key, required this.appointmentsFacade});
  AppointmentFacade appointmentsFacade;

  @override
  _TabletAppointmentState createState() =>
      _TabletAppointmentState(appointmentsFacade: appointmentsFacade);
}

class _TabletAppointmentState extends State<TabletAppointment> {
  AppointmentFacade appointmentsFacade;

  _TabletAppointmentState({required this.appointmentsFacade});

  late ValueNotifier<List<Appointment>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _focusedDay = kToday;
  DateTime? _selectedDay = kToday;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents =
        ValueNotifier(appointmentsFacade.getEventsForDay(_selectedDay!));
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

      _selectedEvents.value = appointmentsFacade.getEventsForDay(seletedDay);
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
            eventLoader: appointmentsFacade.getEventsForDay,
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
              "${appointment.date.day}:${appointment.date.minute}",
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(
              width: 18,
            ),
            Column(
              children: [
                Text(
                  appointment.psychologistID,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ));
  }
}
