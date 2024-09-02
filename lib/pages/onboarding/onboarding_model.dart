import '/components/onboarding_page_countdown_component/onboarding_page_countdown_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding_widget.dart' show OnboardingWidget;
import 'package:flutter/material.dart';

class OnboardingModel extends FlutterFlowModel<OnboardingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Slides widget.
  PageController? slidesController;

  int get slidesCurrentIndex => slidesController != null &&
          slidesController!.hasClients &&
          slidesController!.page != null
      ? slidesController!.page!.round()
      : 0;
  // Model for OnboardingPageCountdownComponent component.
  late OnboardingPageCountdownComponentModel
      onboardingPageCountdownComponentModel;

  @override
  void initState(BuildContext context) {
    onboardingPageCountdownComponentModel =
        createModel(context, () => OnboardingPageCountdownComponentModel());
  }

  @override
  void dispose() {
    onboardingPageCountdownComponentModel.dispose();
  }
}
