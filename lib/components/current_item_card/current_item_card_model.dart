import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'current_item_card_widget.dart' show CurrentItemCardWidget;
import 'package:flutter/material.dart';

class CurrentItemCardModel extends FlutterFlowModel<CurrentItemCardWidget> {
  ///  Local state fields for this component.

  bool isAFavorite = false;

  bool isInYourCart = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in CurrentItemCard widget.
  FavoriteRecord? dBCurrentFavoritesQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in CurrentItemCard widget.
  CartItemRecord? dBCurrentCartQuery;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
