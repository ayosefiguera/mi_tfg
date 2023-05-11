import 'package:eqlibrum/daos/local_repository.dart';
import 'package:eqlibrum/facade/impl/default_local_repository_facade.dart';
import 'package:eqlibrum/models/appointment.dart';
import 'package:eqlibrum/models/user.dart';
import 'package:eqlibrum/services/impl/default_local_repository_service.dart';
import 'package:eqlibrum/services/local_repository_service.dart';
import 'package:eqlibrum/services/notificacion_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:omni_jitsi_meet/jitsi_meet.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class MeetConfigProvider {
  final String serverText = "https://meet.jit.si/";
  late String roomText;
  late String serverUrl;
  late String subjectText;
  late String nameText;
  late String emailText;
  late String iosAppBarRGBAColor;
  late bool isAudioOnly;
  late bool isAudioMuted;
  late bool isVideoMuted;

  LocalRepositoryService localRepository = DefaultLocalRepositoryService();

  User userData = User();
  final Appointment appointment;
  MeetConfigProvider({required this.appointment}) {
    loadConfig();
  }
  Future<bool> loadConfig() async {
    try {
      userData = await localRepository.getUser();
      final String formatteDay =
          DateFormat('y-dd-MM-hh-mm').format(appointment.date);
      roomText = "${appointment.id}-$formatteDay";
      serverUrl = "${appointment.id}-$formatteDay";
      subjectText = "Appointment-$formatteDay";
      nameText = "${userData.name}";
      emailText = "${userData.email}";
      iosAppBarRGBAColor = "#0080FF80";
      isAudioOnly = false;
      isAudioMuted = false;
      isVideoMuted = false;
    } catch (e) {
      NotificacionService.showSnackbar("$e");
      return false;
    }
    return true;
  }

  TextEditingController getServeText() {
    return TextEditingController(text: serverText);
  }

  TextEditingController getRoomText() {
    return TextEditingController(text: roomText);
  }

  TextEditingController getSubjectText() {
    return TextEditingController(text: subjectText);
  }

  TextEditingController getNameText() {
    return TextEditingController(text: nameText);
  }

  TextEditingController getEmailText() {
    return TextEditingController(text: emailText);
  }

  TextEditingController getpBarRGBAColor() {
    return TextEditingController(text: iosAppBarRGBAColor);
  }

  joinMeeting() async {
    final String? serverUrl = serverText.isEmpty ? null : serverText;
    final featureFlags = {
      /*FeatureFlagEnum.ADD_PEOPLE_ENABLED: false,
      FeatureFlagEnum.ANDROID_SCREENSHARING_ENABLED: false,
      FeatureFlagEnum.AUDIO_FOCUS_DISABLED: false,
      FeatureFlagEnum.AUDIO_MUTE_BUTTON_ENABLED: true,
      FeatureFlagEnum.AUDIO_ONLY_BUTTON_ENABLED: false,
      FeatureFlagEnum.CALENDAR_ENABLED: false,
      FeatureFlagEnum.CAR_MODE_ENABLED: false,
      FeatureFlagEnum.CLOSE_CAPTIONS_ENABLED: false,
      FeatureFlagEnum.CONFERENCE_TIMER_ENABLED: false,
      FeatureFlagEnum.CHAT_ENABLED: false,
      FeatureFlagEnum.FILMSTRIP_ENABLED: false,
      FeatureFlagEnum.FULLSCREEN_ENABLED: true,
      FeatureFlagEnum.HELP_BUTTON_ENABLED: false,
      FeatureFlagEnum.INVITE_ENABLED: false,
      FeatureFlagEnum.IOS_RECORDING_ENABLED: false,
      FeatureFlagEnum.IOS_SCREENSHARING_ENABLED: false,
      FeatureFlagEnum.SPEAKERSTATS_ENABLED: false,
      FeatureFlagEnum.KICK_OUT_ENABLED: false,
      FeatureFlagEnum.LIVE_STREAMING_ENABLED: false,
      FeatureFlagEnum.LOBBY_MODE_ENABLED: false,
      FeatureFlagEnum.MEETING_NAME_ENABLED: false,
      FeatureFlagEnum.MEETING_PASSWORD_ENABLED: false,
      FeatureFlagEnum.NOTIFICATIONS_ENABLED: false,
      FeatureFlagEnum.OVERFLOW_MENU_ENABLED: true,
      FeatureFlagEnum.PIP_ENABLED: false,
      FeatureFlagEnum.PREJOIN_PAGE_ENABLED: false,
      FeatureFlagEnum.RAISE_HAND_ENABLED: false,
      FeatureFlagEnum.REACTIONS_ENABLED: false,
      FeatureFlagEnum.RECORDING_ENABLED: false,
      FeatureFlagEnum.REPLACE_PARTICIPANT: false,*/
      FeatureFlagEnum.RESOLUTION: FeatureFlagVideoResolution.MD_RESOLUTION,
      /*FeatureFlagEnum.SECURITY_OPTIONS_ENABLED: false,
      FeatureFlagEnum.SERVER_URL_CHANGE_ENABLED: false,
      FeatureFlagEnum.SETTINGS_ENABLED: false,
      FeatureFlagEnum.TILE_VIEW_ENABLED: true,
      FeatureFlagEnum.TOOLBOX_ALWAYS_VISIBLE: false,
      FeatureFlagEnum.TOOLBOX_ENABLED: true,
      FeatureFlagEnum.VIDEO_MUTE_BUTTON_ENABLED: true,
      FeatureFlagEnum.VIDEO_SHARE_BUTTON_ENABLED: false,*/
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };
    if (!kIsWeb && Platform.isAndroid) {
      featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
    }
    // Define meetings options here
    final options = JitsiMeetingOptions(
        room: roomText,
        serverURL: serverUrl,
        subject: subjectText,
        userDisplayName: nameText,
        userEmail: emailText,
        iosAppBarRGBAColor: iosAppBarRGBAColor,
        audioOnly: isAudioOnly,
        audioMuted: isAudioMuted,
        videoMuted: isVideoMuted,
        featureFlags: featureFlags,
        webOptions: {
          "roomName": roomText,
          "width": "100%",
          "height": "100%",
          "enableWelcomePage": false,
          "enableNoAudioDetection": true,
          "enableNoisyMicDetection": true,
          "enableClosePage": false,
          "prejoinPageEnabled": false,
          "hideConferenceTimer": true,
          "disableInviteFunctions": true,
          "chromeExtensionBanner": null,
          "configOverwrite": {
            "prejoinPageEnabled": false,
            "disableDeepLinking": true,
            "enableLobbyChat": false,
            "enableClosePage": false,
            "chromeExtensionBanner": null,
            /*"toolbarButtons": [
              "microphone",
              "camera",
              "hangup",
            ]*/
          },
          "userInfo": {"email": emailText, "displayName": nameText}
        });

    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onOpened: () {
            debugPrint("JitsiMeetingListener - onOpened");
          },
          onClosed: () {
            debugPrint("JitsiMeetingListener - onClosed");
          },
          onError: (error) {
            debugPrint("JitsiMeetingListener - onError: error: $error");
          },
          onConferenceWillJoin: (url) {
            debugPrint(
                "JitsiMeetingListener - onConferenceWillJoin: url: $url");
          },
          onConferenceJoined: (url) {
            debugPrint("JitsiMeetingListener - onConferenceJoined: url:$url");
          },
          onConferenceTerminated: (url, error) {
            debugPrint(
                "JitsiMeetingListener - onConferenceTerminated: url: $url, error: $error");
          },
          onParticipantLeft: (participantId) {
            debugPrint(
                "JitsiMeetingListener - onParticipantLeft: $participantId");
          },
          onParticipantJoined: (email, name, role, participantId) {
            debugPrint("JitsiMeetingListener - onParticipantJoined: "
                "email: $email, name: $name, role: $role, "
                "participantId: $participantId");
          },
          onAudioMutedChanged: (muted) {
            debugPrint(
                "JitsiMeetingListener - onAudioMutedChanged: muted: $muted");
          },
          onVideoMutedChanged: (muted) {
            debugPrint(
                "JitsiMeetingListener - onVideoMutedChanged: muted: $muted");
          },
          onScreenShareToggled: (participantId, isSharing) {
            debugPrint("JitsiMeetingListener - onScreenShareToggled: "
                "participantId: $participantId, isSharing: $isSharing");
          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                  debugPrint("JitsiMeetingListener - readyToClose callback");
                }),
          ]),
    );
  }
}
