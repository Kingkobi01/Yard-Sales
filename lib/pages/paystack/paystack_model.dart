import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'paystack_widget.dart' show PaystackWidget;
import 'package:flutter/material.dart';

class PaystackModel extends FlutterFlowModel<PaystackWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (verifyTransaction)] action in Button widget.
  ApiCallResponse? aPIVerifyTransaction;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CartItemRecord? findCartItem;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ItemRecord? dBPurchasedCartItem;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
