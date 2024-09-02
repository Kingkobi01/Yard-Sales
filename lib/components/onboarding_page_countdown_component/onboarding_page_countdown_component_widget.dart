import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'onboarding_page_countdown_component_model.dart';
export 'onboarding_page_countdown_component_model.dart';

class OnboardingPageCountdownComponentWidget extends StatefulWidget {
  const OnboardingPageCountdownComponentWidget({super.key});

  @override
  State<OnboardingPageCountdownComponentWidget> createState() =>
      _OnboardingPageCountdownComponentWidgetState();
}

class _OnboardingPageCountdownComponentWidgetState
    extends State<OnboardingPageCountdownComponentWidget> {
  late OnboardingPageCountdownComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => OnboardingPageCountdownComponentModel());

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

    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            FFAppState().YardSalesMeeting != null
                ? 'Yard Sales On:'
                : 'Yard Sales:',
            style: FlutterFlowTheme.of(context).labelLarge.override(
                  fontFamily: 'Montserrat',
                  letterSpacing: 0.0,
                ),
          ),
          Builder(
            builder: (context) {
              if ((FFAppState().YardSalesMeeting != null) &&
                  !functions.isInThePast(FFAppState().YardSalesMeeting!)!) {
                return Builder(
                  builder: (context) {
                    if (functions.isToday(FFAppState().YardSalesMeeting!)) {
                      return RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: const [
                            TextSpan(
                              text: 'Today',
                              style: TextStyle(),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'ProductSans',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      );
                    } else {
                      return RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: dateTimeFormat(
                                  "EEEE", FFAppState().YardSalesMeeting),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'ProductSans',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            const TextSpan(
                              text: ', ',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: dateTimeFormat(
                                  "yMMMd", FFAppState().YardSalesMeeting),
                              style: const TextStyle(),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'ProductSans',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      );
                    }
                  },
                );
              } else {
                return Text(
                  'Coming Soon!!',
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'ProductSans',
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
