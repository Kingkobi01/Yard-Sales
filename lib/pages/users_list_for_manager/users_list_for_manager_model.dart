import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'users_list_for_manager_widget.dart' show UsersListForManagerWidget;
import 'package:flutter/material.dart';

class UsersListForManagerModel
    extends FlutterFlowModel<UsersListForManagerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
