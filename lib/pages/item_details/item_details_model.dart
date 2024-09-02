import '/backend/backend.dart';
import '/components/to_cart/to_cart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'item_details_widget.dart' show ItemDetailsWidget;
import 'package:flutter/material.dart';

class ItemDetailsModel extends FlutterFlowModel<ItemDetailsWidget> {
  ///  Local state fields for this page.

  bool alreadyInCart = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in itemDetails widget.
  CartItemRecord? dBCheckCart;
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
