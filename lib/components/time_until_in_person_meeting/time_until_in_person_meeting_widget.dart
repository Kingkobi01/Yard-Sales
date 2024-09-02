import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'time_until_in_person_meeting_model.dart';
export 'time_until_in_person_meeting_model.dart';

class TimeUntilInPersonMeetingWidget extends StatefulWidget {
  const TimeUntilInPersonMeetingWidget({super.key});

  @override
  State<TimeUntilInPersonMeetingWidget> createState() =>
      _TimeUntilInPersonMeetingWidgetState();
}

class _TimeUntilInPersonMeetingWidgetState
    extends State<TimeUntilInPersonMeetingWidget> {
  late TimeUntilInPersonMeetingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeUntilInPersonMeetingModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.timer.setPresetTime(
        mSec: valueOrDefault<int>(
          FFAppState().YardSalesMeeting?.microsecondsSinceEpoch,
          60000,
        ),
        add: false,
      );
      _model.timerController.onResetTimer();

      _model.timerController.onStartTimer();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
      child: Material(
        color: Colors.transparent,
        elevation: 12.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 200.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(32.0, 8.0, 32.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Next Yard Sales:',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                    if (valueOrDefault<bool>(
                        currentUserDocument?.isManager, false))
                      AuthUserStreamWidget(
                        builder: (context) => FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          buttonSize: 40.0,
                          hoverColor: FlutterFlowTheme.of(context).primary,
                          hoverIconColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          icon: Icon(
                            Icons.edit,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            final datePickedDate = await showDatePicker(
                              context: context,
                              initialDate: getCurrentTimestamp,
                              firstDate:
                                  (getCurrentTimestamp ?? DateTime(1900)),
                              lastDate: DateTime(2050),
                              builder: (context, child) {
                                return wrapInMaterialDatePickerTheme(
                                  context,
                                  child!,
                                  headerBackgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  headerForegroundColor:
                                      FlutterFlowTheme.of(context).info,
                                  headerTextStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: 'ProductSans',
                                        fontSize: 32.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                      ),
                                  pickerBackgroundColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  pickerForegroundColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  selectedDateTimeBackgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  selectedDateTimeForegroundColor:
                                      FlutterFlowTheme.of(context).info,
                                  actionButtonForegroundColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  iconSize: 24.0,
                                );
                              },
                            );

                            if (datePickedDate != null) {
                              safeSetState(() {
                                _model.datePicked = DateTime(
                                  datePickedDate.year,
                                  datePickedDate.month,
                                  datePickedDate.day,
                                );
                              });
                            }
                            FFAppState().YardSalesMeeting = _model.datePicked;
                            FFAppState().update(() {});

                            var nextMeetingRecordReference =
                                NextMeetingRecord.collection.doc();
                            await nextMeetingRecordReference
                                .set(createNextMeetingRecordData(
                              date: _model.datePicked,
                              timestamp: getCurrentTimestamp,
                            ));
                            _model.dBAddDate =
                                NextMeetingRecord.getDocumentFromData(
                                    createNextMeetingRecordData(
                                      date: _model.datePicked,
                                      timestamp: getCurrentTimestamp,
                                    ),
                                    nextMeetingRecordReference);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Date Successfully Changed!!',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 2000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            _model.timerController.timer.setPresetTime(
                              mSec: functions
                                  .countdownms(FFAppState().YardSalesMeeting!),
                              add: false,
                            );
                            _model.timerController.onResetTimer();

                            _model.timerController.onStartTimer();

                            setState(() {});
                          },
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                child: Builder(
                  builder: (context) {
                    if ((FFAppState().YardSalesMeeting == null) ||
                        functions
                            .isInThePast(FFAppState().YardSalesMeeting!)!) {
                      return Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 25.0, 0.0, 24.0),
                        child: Text(
                          'Coming Soon!!',
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'ProductSans',
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      );
                    } else if (functions
                            .countdownms(FFAppState().YardSalesMeeting!) >
                        86400) {
                      return Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 25.0, 0.0, 24.0),
                        child: Text(
                          dateTimeFormat(
                              "yMMMd", FFAppState().YardSalesMeeting),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'ProductSans',
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      );
                    } else if ((functions
                                .countdownms(FFAppState().YardSalesMeeting!) <=
                            86400) &&
                        (functions.countdownms(FFAppState().YardSalesMeeting!) >
                            0)) {
                      return FlutterFlowTimer(
                        initialTime: _model.timerInitialTimeMs,
                        getDisplayTime: (value) =>
                            StopWatchTimer.getDisplayTime(value,
                                milliSecond: false),
                        controller: _model.timerController,
                        updateStateInterval: const Duration(milliseconds: 1000),
                        onChanged: (value, displayTime, shouldUpdate) {
                          _model.timerMilliseconds = value;
                          _model.timerValue = displayTime;
                          if (shouldUpdate) setState(() {});
                        },
                        textAlign: TextAlign.start,
                        style:
                            FlutterFlowTheme.of(context).displayLarge.override(
                                  fontFamily: 'ProductSans',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 25.0, 0.0, 24.0),
                        child: Text(
                          'Ongoing',
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'ProductSans',
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
