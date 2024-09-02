import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'transaction_component_model.dart';
export 'transaction_component_model.dart';

class TransactionComponentWidget extends StatefulWidget {
  const TransactionComponentWidget({
    super.key,
    required this.unitTransaction,
    required this.item,
  });

  final TransactionsRecord? unitTransaction;
  final DocumentReference? item;

  @override
  State<TransactionComponentWidget> createState() =>
      _TransactionComponentWidgetState();
}

class _TransactionComponentWidgetState
    extends State<TransactionComponentWidget> {
  late TransactionComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 70.0,
        decoration: BoxDecoration(
          color: widget.unitTransaction!.success
              ? const Color(0x52249689)
              : const Color(0x51FF5963),
          boxShadow: [
            BoxShadow(
              color: FlutterFlowTheme.of(context).primaryBackground,
              offset: const Offset(
                0.0,
                1.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: valueOrDefault<Color>(
              widget.unitTransaction!.success
                  ? const Color(0xD1249689)
                  : const Color(0xC4FF5963),
              FlutterFlowTheme.of(context).tertiary,
            ),
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 5.0, 16.0, 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<ItemRecord>(
                    stream:
                        ItemRecord.getDocument(widget.unitTransaction!.item!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 30.0,
                            height: 30.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }

                      final textItemRecord = snapshot.data!;

                      return Text(
                        textItemRecord.name,
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              letterSpacing: 0.0,
                            ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: Text(
                      '${valueOrDefault<String>(
                        dateTimeFormat(
                            "yMMMd", widget.unitTransaction?.timestamp),
                        'date',
                      )}, ${dateTimeFormat("Hm", widget.unitTransaction?.timestamp)}',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Montserrat',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
              Text(
                '₵${valueOrDefault<String>(
                  widget.unitTransaction?.amount.toString(),
                  'price',
                )}',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'ProductSans',
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
