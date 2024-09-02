import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'other_items_card_model.dart';
export 'other_items_card_model.dart';

class OtherItemsCardWidget extends StatefulWidget {
  const OtherItemsCardWidget({
    super.key,
    this.item,
    required this.favoriteAction,
    required this.cartAction,
  });

  final ItemRecord? item;
  final Future Function()? favoriteAction;
  final Future Function()? cartAction;

  @override
  State<OtherItemsCardWidget> createState() => _OtherItemsCardWidgetState();
}

class _OtherItemsCardWidgetState extends State<OtherItemsCardWidget> {
  late OtherItemsCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtherItemsCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.dBOtherFavoritesQuery = await queryFavoriteRecordOnce(
            queryBuilder: (favoriteRecord) => favoriteRecord
                .where(
                  'user',
                  isEqualTo: currentUserReference,
                )
                .where(
                  'item',
                  isEqualTo: widget.item?.reference,
                ),
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          _model.isAFavorite = _model.dBOtherFavoritesQuery != null;
          _model.updatePage(() {});
        }),
        Future(() async {
          _model.dBOtherCartQuery = await queryCartItemRecordOnce(
            queryBuilder: (cartItemRecord) => cartItemRecord
                .where(
                  'user',
                  isEqualTo: currentUserReference,
                )
                .where(
                  'item',
                  isEqualTo: widget.item?.reference,
                ),
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          _model.isInYourCart = _model.dBOtherCartQuery != null;
          _model.updatePage(() {});
        }),
      ]);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: 200.0,
        height: 195.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                1.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: OctoImage(
                placeholderBuilder: (_) => const SizedBox.expand(
                  child: Image(
                    image: BlurHashImage('utrcjvjhbik'),
                    fit: BoxFit.cover,
                  ),
                ),
                image: NetworkImage(
                  valueOrDefault<String>(
                    widget.item?.images.first,
                    'https://plus.unsplash.com/premium_photo-1661964205360-b0621b5a9366?q=80&w=2038&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (widget.item?.seller != currentUserReference)
                  Align(
                    alignment: const AlignmentDirectional(1.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        if (widget.item?.onSale ?? false) {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 16.0, 4.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: ToggleIcon(
                                        onPressed: () async {
                                          setState(() => _model.isAFavorite =
                                              !_model.isAFavorite);
                                          await widget.favoriteAction?.call();
                                        },
                                        value: _model.isAFavorite,
                                        onIcon: const Icon(
                                          Icons.favorite_outlined,
                                          color: Color(0xFFE639EB),
                                          size: 25.0,
                                        ),
                                        offIcon: Icon(
                                          Icons.favorite_border_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: ToggleIcon(
                                        onPressed: () async {
                                          setState(() => _model.isInYourCart =
                                              !_model.isInYourCart);
                                          await widget.cartAction?.call();
                                        },
                                        value: _model.isInYourCart,
                                        onIcon: Icon(
                                          Icons.shopping_cart_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          size: 25.0,
                                        ),
                                        offIcon: Icon(
                                          Icons.shopping_cart_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 16.0)),
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 16.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 2.0, 6.0, 2.0),
                                child: Text(
                                  'SOLD',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      ),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
