import '/components/to_cart/to_cart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pay_widget.dart' show PayWidget;
import 'package:flutter/material.dart';

class PayModel extends FlutterFlowModel<PayWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ToCart component.
  late ToCartModel toCartModel;

  @override
  void initState(BuildContext context) {
    toCartModel = createModel(context, () => ToCartModel());
  }

  @override
  void dispose() {
    toCartModel.dispose();
  }
}
