import 'package:eqlibrum/facade/impl/default_appointment_facade.dart';
import 'package:eqlibrum/models/appointment.dart';
import 'package:eqlibrum/utils/utils.dart';
import 'package:eqlibrum/views/widgets/scaffold_app.dart';
import 'package:eqlibrum/views/themes/themes.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  DefaultAppointmentFacade appointmentFacade = DefaultAppointmentFacade();
    return ScaffoldApp(
        index:1,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Upconming appointments",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.indigo.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                      ),
                      onPressed: () => Navigator.pushNamed(context, 'schelude'),
                      child: const Text(
                        'See all',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                appointmentFacade.isLoading
                    ? const Center(
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator(
                              color: AppTheme.primary,
                            )),
                      )
                    : _NextAppointment(
                        appointment: appointmentFacade.getEventsForDay(kToday)),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Let's find your doctor",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.indigo.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                  ],
                ),
                const PsychologistTiles(),
              ],
            ),
          ),
        ));
  }
}

class _NextAppointment extends StatelessWidget {
  const _NextAppointment({required this.appointment});

  final List<Appointment> appointment;

  @override
  Widget build(BuildContext context) {
    Color statusColor = AppTheme.primary;

    return appointment.isEmpty
        ? const Text("No appointment today")
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
                    "Next Appointment. Day: ${appointment[0].date.day} of ${appointment[0].date.month}",
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
