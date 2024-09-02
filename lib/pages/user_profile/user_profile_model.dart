import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/to_cart/to_cart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:flutter/material.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ToCart component.
  late ToCartModel toCartModel;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
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
