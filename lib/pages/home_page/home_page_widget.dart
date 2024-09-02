import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/current_item_card/current_item_card_widget.dart';
import '/components/home_page_shimmer_component/home_page_shimmer_component_widget.dart';
import '/components/other_items_card/other_items_card_widget.dart';
import '/components/time_until_in_person_meeting/time_until_in_person_meeting_widget.dart';
import '/components/to_cart/to_cart_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ItemRecord>>(
      stream: queryItemRecord(
        queryBuilder: (itemRecord) => itemRecord.whereArrayContainsAny(
            'categories', _model.choiceChipsValues),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const HomePageShimmerComponentWidget(),
          );
        }
        List<ItemRecord> homePageItemRecordList = snapshot.data!;

        return Title(
            title: 'Home',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 390.0,
                      maxHeight: 844.0,
                    ),
                    decoration: const BoxDecoration(),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 100.0),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (Navigator.of(context)
                                                .canPop()) {
                                              context.pop();
                                            }
                                            context.pushNamed('Browse');
                                          },
                                          child: Icon(
                                            Icons.search_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 30.0,
                                          ),
                                        ),
                                        Text(
                                          'YARD SALES',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 4.0,
                                              ),
                                        ),
                                        wrapWithModel(
                                          model: _model.toCartModel,
                                          updateCallback: () => setState(() {}),
                                          child: const ToCartWidget(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  FlutterFlowChoiceChips(
                                    options: FFAppState()
                                        .Categories
                                        .map((label) => ChipData(label))
                                        .toList(),
                                    onChanged: (val) => setState(
                                        () => _model.choiceChipsValues = val),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      iconColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      iconSize: 18.0,
                                      elevation: 4.0,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                      iconColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      iconSize: 18.0,
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    chipSpacing: 12.0,
                                    rowSpacing: 12.0,
                                    multiselect: true,
                                    initialized:
                                        _model.choiceChipsValues != null,
                                    alignment: WrapAlignment.start,
                                    controller:
                                        _model.choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                      [],
                                    ),
                                    wrapped: false,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'What\'s New',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'ProductSans',
                                                letterSpacing: 3.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            if (homePageItemRecordList
                                                .isNotEmpty) {
                                              return Container(
                                                height: 274.0,
                                                constraints: const BoxConstraints(
                                                  maxHeight: 330.0,
                                                ),
                                                decoration: const BoxDecoration(),
                                                child: Builder(
                                                  builder: (context) {
                                                    final latestItems =
                                                        homePageItemRecordList
                                                            .sortedList(
                                                                keyOf: (e) => e
                                                                    .modifiedAt!
                                                                    .secondsSinceEpoch
                                                                    .toString(),
                                                                desc: true)
                                                            .where(
                                                                (e) => e.onSale)
                                                            .toList();

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          latestItems.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          const SizedBox(width: 15.0),
                                                      itemBuilder: (context,
                                                          latestItemsIndex) {
                                                        final latestItemsItem =
                                                            latestItems[
                                                                latestItemsIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'itemDetails',
                                                              queryParameters: {
                                                                'selectedItem':
                                                                    serializeParam(
                                                                  latestItemsItem,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'selectedItem':
                                                                    latestItemsItem,
                                                              },
                                                            );
                                                          },
                                                          child:
                                                              CurrentItemCardWidget(
                                                            key: Key(
                                                                'Keyeim_${latestItemsIndex}_of_${latestItems.length}'),
                                                            item:
                                                                latestItemsItem,
                                                            favAction:
                                                                () async {
                                                              _model.dBFindFavorite =
                                                                  await queryFavoriteRecordOnce(
                                                                queryBuilder:
                                                                    (favoriteRecord) =>
                                                                        favoriteRecord
                                                                            .where(
                                                                              'user',
                                                                              isEqualTo: currentUserReference,
                                                                            )
                                                                            .where(
                                                                              'item',
                                                                              isEqualTo: latestItemsItem.reference,
                                                                            ),
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);
                                                              if (_model
                                                                      .dBFindFavorite !=
                                                                  null) {
                                                                await _model
                                                                    .dBFindFavorite!
                                                                    .reference
                                                                    .delete();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .clearSnackBars();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Removed from favorites',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              } else {
                                                                var favoriteRecordReference =
                                                                    FavoriteRecord
                                                                        .collection
                                                                        .doc();
                                                                await favoriteRecordReference
                                                                    .set(
                                                                        createFavoriteRecordData(
                                                                  user:
                                                                      currentUserReference,
                                                                  item: latestItemsItem
                                                                      .reference,
                                                                  timestamp:
                                                                      getCurrentTimestamp,
                                                                ));
                                                                _model.dBAddFavorite =
                                                                    FavoriteRecord.getDocumentFromData(
                                                                        createFavoriteRecordData(
                                                                          user:
                                                                              currentUserReference,
                                                                          item:
                                                                              latestItemsItem.reference,
                                                                          timestamp:
                                                                              getCurrentTimestamp,
                                                                        ),
                                                                        favoriteRecordReference);
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .clearSnackBars();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Added to favorites',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              }

                                                              setState(() {});
                                                            },
                                                            cartAction:
                                                                () async {
                                                              _model.dBFindCartItem =
                                                                  await queryCartItemRecordOnce(
                                                                queryBuilder:
                                                                    (cartItemRecord) =>
                                                                        cartItemRecord
                                                                            .where(
                                                                              'user',
                                                                              isEqualTo: currentUserReference,
                                                                            )
                                                                            .where(
                                                                              'item',
                                                                              isEqualTo: latestItemsItem.reference,
                                                                            ),
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);
                                                              if (_model
                                                                      .dBFindCartItem !=
                                                                  null) {
                                                                await _model
                                                                    .dBFindCartItem!
                                                                    .reference
                                                                    .delete();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .clearSnackBars();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Removed from cart',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              } else {
                                                                await CartItemRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set(
                                                                        createCartItemRecordData(
                                                                      user:
                                                                          currentUserReference,
                                                                      item: latestItemsItem
                                                                          .reference,
                                                                      timestamp:
                                                                          getCurrentTimestamp,
                                                                      price: latestItemsItem
                                                                          .price,
                                                                    ));
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .clearSnackBars();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Added to cart',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              }

                                                              setState(() {});
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              );
                                            } else {
                                              return Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 16.0),
                                                  child: Text(
                                                    'No Items Available',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ].divide(const SizedBox(height: 12.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: wrapWithModel(
                                      model:
                                          _model.timeUntilInPersonMeetingModel,
                                      updateCallback: () => setState(() {}),
                                      child: const TimeUntilInPersonMeetingWidget(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Other Items',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            if (homePageItemRecordList
                                                .isNotEmpty) {
                                              return Wrap(
                                                spacing: 0.0,
                                                runSpacing: 0.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final otherItems =
                                                          homePageItemRecordList
                                                              .toList();

                                                      return GridView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        gridDelegate:
                                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          crossAxisSpacing:
                                                              10.0,
                                                          mainAxisSpacing: 10.0,
                                                          childAspectRatio: 1.0,
                                                        ),
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            otherItems.length,
                                                        itemBuilder: (context,
                                                            otherItemsIndex) {
                                                          final otherItemsItem =
                                                              otherItems[
                                                                  otherItemsIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'itemDetails',
                                                                queryParameters:
                                                                    {
                                                                  'selectedItem':
                                                                      serializeParam(
                                                                    otherItemsItem,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'selectedItem':
                                                                      otherItemsItem,
                                                                },
                                                              );
                                                            },
                                                            child:
                                                                OtherItemsCardWidget(
                                                              key: Key(
                                                                  'Keyy8q_${otherItemsIndex}_of_${otherItems.length}'),
                                                              item:
                                                                  otherItemsItem,
                                                              favoriteAction:
                                                                  () async {
                                                                _model.dBCheckIfItemIsAFavorite =
                                                                    await queryFavoriteRecordOnce(
                                                                  queryBuilder: (favoriteRecord) =>
                                                                      favoriteRecord
                                                                          .where(
                                                                            'user',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          )
                                                                          .where(
                                                                            'item',
                                                                            isEqualTo:
                                                                                otherItemsItem.reference,
                                                                          ),
                                                                  singleRecord:
                                                                      true,
                                                                ).then((s) => s
                                                                        .firstOrNull);
                                                                if (_model
                                                                        .dBCheckIfItemIsAFavorite !=
                                                                    null) {
                                                                  await _model
                                                                      .dBCheckIfItemIsAFavorite!
                                                                      .reference
                                                                      .delete();
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .clearSnackBars();
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Removed to favorites',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              2000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                } else {
                                                                  await FavoriteRecord
                                                                      .collection
                                                                      .doc()
                                                                      .set(
                                                                          createFavoriteRecordData(
                                                                        user:
                                                                            currentUserReference,
                                                                        item: otherItemsItem
                                                                            .reference,
                                                                        timestamp:
                                                                            getCurrentTimestamp,
                                                                      ));
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .clearSnackBars();
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Added from favorites',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                }

                                                                setState(() {});
                                                              },
                                                              cartAction:
                                                                  () async {
                                                                _model.dBCheckIfItemisInCart =
                                                                    await queryCartItemRecordOnce(
                                                                  queryBuilder: (cartItemRecord) =>
                                                                      cartItemRecord
                                                                          .where(
                                                                            'user',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          )
                                                                          .where(
                                                                            'item',
                                                                            isEqualTo:
                                                                                otherItemsItem.reference,
                                                                          ),
                                                                  singleRecord:
                                                                      true,
                                                                ).then((s) => s
                                                                        .firstOrNull);
                                                                if (_model
                                                                        .dBCheckIfItemisInCart !=
                                                                    null) {
                                                                  await _model
                                                                      .dBCheckIfItemisInCart!
                                                                      .reference
                                                                      .delete();
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .clearSnackBars();
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Removed to cart',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                } else {
                                                                  await CartItemRecord
                                                                      .collection
                                                                      .doc()
                                                                      .set(
                                                                          createCartItemRecordData(
                                                                        user:
                                                                            currentUserReference,
                                                                        item: otherItemsItem
                                                                            .reference,
                                                                        timestamp:
                                                                            getCurrentTimestamp,
                                                                        price: otherItemsItem
                                                                            .price,
                                                                      ));
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .clearSnackBars();
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Added from cart',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              2000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                }

                                                                setState(() {});
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 16.0),
                                                  child: Text(
                                                    'No Items Available',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ].divide(const SizedBox(height: 12.0)),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 32.0)),
                              ),
                            ),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.bottomNavBarModel,
                          updateCallback: () => setState(() {}),
                          child: const BottomNavBarWidget(
                            pageName: 'homePage',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
