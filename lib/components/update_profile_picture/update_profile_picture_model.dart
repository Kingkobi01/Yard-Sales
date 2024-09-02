import '/flutter_flow/flutter_flow_util.dart';
import 'update_profile_picture_widget.dart' show UpdateProfilePictureWidget;
import 'package:flutter/material.dart';

class UpdateProfilePictureModel
    extends FlutterFlowModel<UpdateProfilePictureWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
