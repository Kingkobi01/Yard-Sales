import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/to_cart/to_cart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'yard_items_widget.dart' show YardItemsWidget;
import 'package:flutter/material.dart';

class YardItemsModel extends FlutterFlowModel<YardItemsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ToCart component.
  late ToCartModel toCartModel;
  // Model for bottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    toCartModel = createModel(context, () => ToCartModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    toCartModel.dispose();
    bottomNavBarModel.dispose();
  }
}
