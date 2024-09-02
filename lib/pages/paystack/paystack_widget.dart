import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'paystack_model.dart';
export 'paystack_model.dart';

class PaystackWidget extends StatefulWidget {
  const PaystackWidget({
    super.key,
    required this.url,
    required this.refID,
    required this.item,
  });

  final String? url;
  final String? refID;
  final ItemRecord? item;

  @override
  State<PaystackWidget> createState() => _PaystackWidgetState();
}

class _PaystackWidgetState extends State<PaystackWidget> {
  late PaystackModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaystackModel());

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
        title: 'Paystack',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 390.0,
                  maxHeight: 844.0,
                ),
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: FlutterFlowWebView(
                          content: widget.url!,
                          bypass: false,
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.85,
                          verticalScroll: false,
                          horizontalScroll: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                _model.aPIVerifyTransaction =
                                    await VerifyTransactionCall.call(
                                  refID: widget.refID,
                                );

                                if ((_model.aPIVerifyTransaction?.succeeded ??
                                    true)) {
                                  if (VerifyTransactionCall.status(
                                        (_model.aPIVerifyTransaction
                                                ?.jsonBody ??
                                            ''),
                                      ) ==
                                      'success') {
                                    _model.findCartItem =
                                        await queryCartItemRecordOnce(
                                      queryBuilder: (cartItemRecord) =>
                                          cartItemRecord
                                              .where(
                                                'user',
                                                isEqualTo: currentUserReference,
                                              )
                                              .where(
                                                'item',
                                                isEqualTo:
                                                    widget.item?.reference,
                                              ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    _model.dBPurchasedCartItem =
                                        await ItemRecord.getDocumentOnce(
                                            widget.item!.reference);
                                    if (widget.item!.quantity > 1) {
                                      await widget.item!.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'quantity':
                                                FieldValue.increment(-(1)),
                                          },
                                        ),
                                      });
                                    } else {
                                      await widget.item!.reference.update({
                                        ...createItemRecordData(
                                          onSale: false,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'quantity':
                                                FieldValue.increment(-(1)),
                                          },
                                        ),
                                      });
                                    }

                                    await TransactionsRecord.collection
                                        .doc()
                                        .set(createTransactionsRecordData(
                                          buyer: currentUserReference,
                                          seller: widget.item?.seller,
                                          timestamp: getCurrentTimestamp,
                                          transactionRef: widget.refID,
                                          amount: widget.item?.price,
                                          success: true,
                                          item: widget.item?.reference,
                                        ));
                                    await _model.findCartItem!.reference
                                        .delete();

                                    context.pushNamed(
                                      'paymentResult',
                                      queryParameters: {
                                        'item': serializeParam(
                                          widget.item,
                                          ParamType.Document,
                                        ),
                                        'success': serializeParam(
                                          true,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'item': widget.item,
                                      },
                                    );
                                  } else if (VerifyTransactionCall.status(
                                        (_model.aPIVerifyTransaction
                                                ?.jsonBody ??
                                            ''),
                                      ) ==
                                      'failed') {
                                    context.pushNamed(
                                      'paymentResult',
                                      queryParameters: {
                                        'item': serializeParam(
                                          widget.item,
                                          ParamType.Document,
                                        ),
                                        'success': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'item': widget.item,
                                      },
                                    );

                                    await TransactionsRecord.collection
                                        .doc()
                                        .set(createTransactionsRecordData(
                                          buyer: currentUserReference,
                                          seller: widget.item?.seller,
                                          timestamp: getCurrentTimestamp,
                                          transactionRef: widget.refID,
                                          amount: widget.item?.price,
                                          success: false,
                                          item: widget.item?.reference,
                                        ));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Please wait...',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 2000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                        action: SnackBarAction(
                                          label: 'Quit Payment',
                                          textColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                          onPressed: () async {
                                            context.pushNamed(
                                              'paymentResult',
                                              queryParameters: {
                                                'item': serializeParam(
                                                  widget.item,
                                                  ParamType.Document,
                                                ),
                                                'success': serializeParam(
                                                  false,
                                                  ParamType.bool,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'item': widget.item,
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Failed!',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }

                                setState(() {});
                              },
                              text: 'Done',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(const SizedBox(height: 16.0)),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
