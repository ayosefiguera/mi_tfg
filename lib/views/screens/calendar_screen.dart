import 'package:eqlibrum/dto/appointment_dto.dart';
import 'package:eqlibrum/facade/appointment_facade.dart';
import 'package:eqlibrum/facade/impl/default_appointment_facade.dart';
import 'package:eqlibrum/views/themes/themes.dart';
import 'package:eqlibrum/views/widgets/appointment_card_widget.dart';
import 'package:eqlibrum/views/widgets/appointmet_dialog_widget.dart';
import 'package:eqlibrum/views/widgets/scaffold_app.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:eqlibrum/utils/utils.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({super.key});
  final AppointmentFacade appointmentFacade = DefaultAppointmentFacade();

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
        index: 2,
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
                  return _RequestAppointmentScreen(
                      appointmentFacade: appointmentFacade);
                } else {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
              }
            }));
  }
}

class _RequestAppointmentScreen extends StatefulWidget {
  const _RequestAppointmentScreen({required this.appointmentFacade});
  final AppointmentFacade appointmentFacade;

  @override
  // ignore: no_logic_in_create_state
  _TabletAppointmentState createState() => _TabletAppointmentState();
}

class _TabletAppointmentState extends State<_RequestAppointmentScreen> {
  _TabletAppointmentState();
  bool loading = true;
  late ValueNotifier<List<AppointmentDTO>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _focusedDay = kToday;
  DateTime? _selectedDay = kToday;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents =
        ValueNotifier(widget.appointmentFacade.getEventsForDay(_selectedDay!));
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

      _selectedEvents.value =
          widget.appointmentFacade.getEventsForDay(seletedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          TableCalendar<AppointmentDTO>(
            focusedDay: _focusedDay,
            firstDay: kFirstDay,
            lastDay: kLastDay,
            calendarFormat: _calendarFormat,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(outsideDaysVisible: false),
            eventLoader: widget.appointmentFacade.getEventsForDay,
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
              child: ValueListenableBuilder<List<AppointmentDTO>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return AppointmentCardWidget(
                      appointment: value[index]);
                },
              );
            },
          )),
          if (true)
            ElevatedButton.icon(
                onPressed: () {
                  _reateDialog(context, _focusedDay);
                },
                icon: const Icon(Icons.add),
                label: const Text("New Appointment"))
        ],
      ),
    );
  }
}

_reateDialog(BuildContext context, DateTime focuseDay) async {
  final AppointmentFacade appointmentFacade = DefaultAppointmentFacade();
  final String formattedMonth = DateFormat('y-dd-MM').format(focuseDay);
  String hour = "00";
  String min = "00";
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: const Text('New Appointment'),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(formattedMonth),
            const Divider(),
            const Text('Set the time:'),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                  child: TextFormField(
                    initialValue: hour,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    onChanged: (value) {
                      hour = value;
                    },
                  ),
                ),
                const Text(":"),
                SizedBox(
                  width: 20,
                  child: TextFormField(
                    initialValue: min,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    onChanged: (value) {
                      min = value;
                    },
                  ),
                ),
              ],
            ),
          ]),
          actions: [
            TextButton(
              onPressed: () async {
                DateTime apointment = DateTime(focuseDay.year, focuseDay.month,
                    focuseDay.day, int.parse(hour), int.parse(min));
                await appointmentFacade.createAppointment(apointment);
                // ignore: use_build_context_synchronously
                Navigator.popAndPushNamed(context, 'calendar');
              },
              child: const Text(
                'Create',
                style: TextStyle(fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () => {Navigator.pop(context)},
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        );
      });
}
