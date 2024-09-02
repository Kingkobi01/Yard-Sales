import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/to_cart/to_cart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'favorites_widget.dart' show FavoritesWidget;
import 'package:flutter/material.dart';

class FavoritesModel extends FlutterFlowModel<FavoritesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for bottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;
  // Model for ToCart component.
  late ToCartModel toCartModel;

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
    toCartModel = createModel(context, () => ToCartModel());
  }

  @override
  void dispose() {
    bottomNavBarModel.dispose();
    toCartModel.dispose();
  }
}
