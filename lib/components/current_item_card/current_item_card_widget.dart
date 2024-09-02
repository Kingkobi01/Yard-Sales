import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/name_loader/name_loader_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'current_item_card_model.dart';
export 'current_item_card_model.dart';

class CurrentItemCardWidget extends StatefulWidget {
  const CurrentItemCardWidget({
    super.key,
    required this.item,
    required this.favAction,
    required this.cartAction,
  });

  final ItemRecord? item;
  final Future Function()? favAction;
  final Future Function()? cartAction;

  @override
  State<CurrentItemCardWidget> createState() => _CurrentItemCardWidgetState();
}

class _CurrentItemCardWidgetState extends State<CurrentItemCardWidget> {
  late CurrentItemCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CurrentItemCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.dBCurrentFavoritesQuery = await queryFavoriteRecordOnce(
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
          _model.isAFavorite = _model.dBCurrentFavoritesQuery != null;
          _model.updatePage(() {});
        }),
        Future(() async {
          _model.dBCurrentCartQuery = await queryCartItemRecordOnce(
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
          _model.isInYourCart = _model.dBCurrentCartQuery != null;
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
        height: 270.0,
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
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 151.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  valueOrDefault<String>(
                                    widget.item?.images.first,
                                    'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8d29ya291dHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                                  ),
                                ).image,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          if (widget.item?.seller != currentUserReference)
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  if (widget.item?.onSale ?? false) {
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 8.0, 4.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Material(
                                              color: Colors.transparent,
                                              elevation: 8.0,
                                              shape: const CircleBorder(),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: ToggleIcon(
                                                    onPressed: () async {
                                                      setState(() => _model
                                                              .isAFavorite =
                                                          !_model.isAFavorite);
                                                      await widget.favAction
                                                          ?.call();
                                                      _model.isAFavorite =
                                                          _model.isAFavorite;
                                                      _model.updatePage(() {});
                                                    },
                                                    value: _model.isAFavorite,
                                                    onIcon: const Icon(
                                                      Icons.favorite,
                                                      color: Color(0xFFF35BDE),
                                                      size: 25.0,
                                                    ),
                                                    offIcon: Icon(
                                                      Icons.favorite_border,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 25.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              elevation: 8.0,
                                              shape: const CircleBorder(),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent2,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: ToggleIcon(
                                                    onPressed: () async {
                                                      setState(() => _model
                                                              .isInYourCart =
                                                          !_model.isInYourCart);
                                                      await widget.cartAction
                                                          ?.call();
                                                      _model.isInYourCart =
                                                          _model.isInYourCart;
                                                      _model.updatePage(() {});
                                                    },
                                                    value: _model.isInYourCart,
                                                    onIcon: Icon(
                                                      Icons
                                                          .shopping_cart_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      size: 25.0,
                                                    ),
                                                    offIcon: Icon(
                                                      Icons
                                                          .shopping_cart_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 25.0,
                                                    ),
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 2.0, 6.0, 2.0),
                                          child: Text(
                                            'SOLD',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.item?.name,
                                'Product name',
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if (widget.item?.categories != null &&
                              (widget.item?.categories)!.isNotEmpty)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        widget.item?.categories.first,
                                        'category',
                                      ),
                                      style: const TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: valueOrDefault<String>(
                                      '₵${valueOrDefault<String>(
                                        widget.item?.price.toString(),
                                        '0.00',
                                      )}',
                                      '₵0.00',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          StreamBuilder<UsersRecord>(
                            stream:
                                UsersRecord.getDocument(widget.item!.seller!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  child: const NameLoaderWidget(),
                                );
                              }

                              final textUsersRecord = snapshot.data!;

                              return Text(
                                valueOrDefault<String>(
                                  textUsersRecord.reference ==
                                          currentUserReference
                                      ? 'You'
                                      : textUsersRecord.displayName,
                                  'Seller',
                                ).maybeHandleOverflow(
                                  maxChars: 12,
                                  replacement: '…',
                                ),
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      letterSpacing: 0.0,
                                    ),
                              );
                            },
                          ),
                        ].divide(const SizedBox(height: 2.0)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
