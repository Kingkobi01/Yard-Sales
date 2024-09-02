import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'other_items_card_widget.dart' show OtherItemsCardWidget;
import 'package:flutter/material.dart';

class OtherItemsCardModel extends FlutterFlowModel<OtherItemsCardWidget> {
  ///  Local state fields for this component.

  bool isAFavorite = false;

  bool isInYourCart = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in OtherItemsCard widget.
  FavoriteRecord? dBOtherFavoritesQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in OtherItemsCard widget.
  CartItemRecord? dBOtherCartQuery;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
