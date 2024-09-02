import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/empty_list_component/empty_list_component_widget.dart';
import '/components/item_card/item_card_widget.dart';
import '/components/to_cart/to_cart_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'yard_items_model.dart';
export 'yard_items_model.dart';

class YardItemsWidget extends StatefulWidget {
  const YardItemsWidget({super.key});

  @override
  State<YardItemsWidget> createState() => _YardItemsWidgetState();
}

class _YardItemsWidgetState extends State<YardItemsWidget> {
  late YardItemsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YardItemsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'YardItems',
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 100.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_sharp,
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
                          Text(
                            'My Yard Items',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'ProductSans',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: const BoxDecoration(),
                              child: StreamBuilder<List<ItemRecord>>(
                                stream: queryItemRecord(
                                  queryBuilder: (itemRecord) => itemRecord
                                      .where(
                                        'seller',
                                        isEqualTo: currentUserReference,
                                      )
                                      .orderBy('modified_at', descending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 30.0,
                                        height: 30.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<ItemRecord> listViewItemRecordList =
                                      snapshot.data!;
                                  if (listViewItemRecordList.isEmpty) {
                                    return const Center(
                                      child: EmptyListComponentWidget(
                                        page: 'yardItems',
                                      ),
                                    );
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewItemRecordList.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 24.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewItemRecord =
                                          listViewItemRecordList[listViewIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'itemDetails',
                                              queryParameters: {
                                                'selectedItem': serializeParam(
                                                  listViewItemRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'selectedItem':
                                                    listViewItemRecord,
                                              },
                                            );
                                          },
                                          child: ItemCardWidget(
                                            key: Key(
                                                'Keyxau_${listViewIndex}_of_${listViewItemRecordList.length}'),
                                            item: listViewItemRecord,
                                            atMyYard: true,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 24.0)),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.bottomNavBarModel,
                      updateCallback: () => setState(() {}),
                      child: const BottomNavBarWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
