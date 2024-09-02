import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'time_until_in_person_meeting_widget.dart'
    show TimeUntilInPersonMeetingWidget;
import 'package:flutter/material.dart';

class TimeUntilInPersonMeetingModel
    extends FlutterFlowModel<TimeUntilInPersonMeetingWidget> {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  NextMeetingRecord? dBAddDate;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 60000;
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(60000, milliSecond: false);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }
}
