import '/backend/backend.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/time_until_in_person_meeting/time_until_in_person_meeting_widget.dart';
import '/components/to_cart/to_cart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  DateTime? next;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ToCart component.
  late ToCartModel toCartModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // Stores action output result for [Firestore Query - Query a collection] action in CurrentItemCard widget.
  FavoriteRecord? dBFindFavorite;
  // Stores action output result for [Backend Call - Create Document] action in CurrentItemCard widget.
  FavoriteRecord? dBAddFavorite;
  // Stores action output result for [Firestore Query - Query a collection] action in CurrentItemCard widget.
  CartItemRecord? dBFindCartItem;
  // Model for TimeUntilInPersonMeeting component.
  late TimeUntilInPersonMeetingModel timeUntilInPersonMeetingModel;
  // Stores action output result for [Firestore Query - Query a collection] action in OtherItemsCard widget.
  CartItemRecord? dBOtherFindCartItem;
  // Stores action output result for [Firestore Query - Query a collection] action in OtherItemsCard widget.
  FavoriteRecord? dBCheckIfItemIsAFavorite;
  // Stores action output result for [Firestore Query - Query a collection] action in OtherItemsCard widget.
  CartItemRecord? dBCheckIfItemisInCart;
  // Model for bottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    toCartModel = createModel(context, () => ToCartModel());
    timeUntilInPersonMeetingModel =
        createModel(context, () => TimeUntilInPersonMeetingModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    toCartModel.dispose();
    timeUntilInPersonMeetingModel.dispose();
    bottomNavBarModel.dispose();
  }
}
