import 'package:eqlibrum/dto/appointment_dto.dart';
import 'package:eqlibrum/providers/meet_config_provider.dart';
import 'package:eqlibrum/views/themes/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omni_jitsi_meet/jitsi_meet.dart';

class MeetingScreen extends StatelessWidget {
  final AppointmentDTO appointment;
  const MeetingScreen({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    MeetConfigProvider meetConfigProvider =
        MeetConfigProvider(appointment: appointment);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meet"),
      ),
      body: FutureBuilder(
          future: meetConfigProvider.loadConfig(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator.adaptive();
            }
            if (snapshot.data == true) {
              return Material(
                  child: JitsiMeet(meetConfigProvider: meetConfigProvider));
            } else {
              return const Text("Fail Test");
            }
          }),
    );
  }
}

class JitsiMeet extends StatefulWidget {
  const JitsiMeet({super.key, required this.meetConfigProvider});

  final MeetConfigProvider meetConfigProvider;
  @override
  MeetingState createState() => MeetingState();
}

class MeetingState extends State<JitsiMeet> {
  bool? isAudioOnly = false;
  bool? isVideoMuted = false;
  late MeetConfigProvider meetConfigProvider;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    meetConfigProvider = widget.meetConfigProvider;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: kIsWeb
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 0.30,
                  child: meetConfig(),
                ),
                SizedBox(
                    width: width * 0.60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          color: Colors.white54,
                          child: SizedBox(
                            width: width * 0.60 * 0.70,
                            height: width * 0.60 * 0.70,
                            child: JitsiMeetConferencing(
                              extraJS: const [
                                // extraJs setup example
                                '<script src="https://code.jquery.com/jquery-3.6.3.slim.js" integrity="sha256-DKU1CmJ8kBuEwumaLuh9Tl/6ZB6jzGOBV/5YpNE2BWc=" crossorigin="anonymous"></script>'
                              ],
                            ),
                          )),
                    ))
              ],
            )
          : meetConfig(),
    );
  }

  Widget meetConfig() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 14.0,
          ),
          const Divider(
            height: 48.0,
            thickness: 2.0,
          ),
          SizedBox(
            height: 64.0,
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {
                meetConfigProvider.joinMeeting();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => AppTheme.primary)),
              child: const Text(
                "Join Meeting",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 48.0,
          ),
        ],
      ),
    );
  }
}
