import '/backend/backend.dart';
import '/components/to_cart/to_cart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_item_widget.dart' show AddItemWidget;
import 'package:flutter/material.dart';

class AddItemModel extends FlutterFlowModel<AddItemWidget> {
  ///  Local state fields for this page.

  List<String> categories = [];
  void addToCategories(String item) => categories.add(item);
  void removeFromCategories(String item) => categories.remove(item);
  void removeAtIndexFromCategories(int index) => categories.removeAt(index);
  void insertAtIndexInCategories(int index, String item) =>
      categories.insert(index, item);
  void updateCategoriesAtIndex(int index, Function(String) updateFn) =>
      categories[index] = updateFn(categories[index]);

  List<String> uploadedImagesState = [];
  void addToUploadedImagesState(String item) => uploadedImagesState.add(item);
  void removeFromUploadedImagesState(String item) =>
      uploadedImagesState.remove(item);
  void removeAtIndexFromUploadedImagesState(int index) =>
      uploadedImagesState.removeAt(index);
  void insertAtIndexInUploadedImagesState(int index, String item) =>
      uploadedImagesState.insert(index, item);
  void updateUploadedImagesStateAtIndex(int index, Function(String) updateFn) =>
      uploadedImagesState[index] = updateFn(uploadedImagesState[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey4 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  // Model for ToCart component.
  late ToCartModel toCartModel;
  // State field(s) for ItemNameField widget.
  FocusNode? itemNameFieldFocusNode;
  TextEditingController? itemNameFieldTextController;
  String? Function(BuildContext, String?)? itemNameFieldTextControllerValidator;
  // State field(s) for PriceField widget.
  FocusNode? priceFieldFocusNode;
  TextEditingController? priceFieldTextController;
  String? Function(BuildContext, String?)? priceFieldTextControllerValidator;
  // State field(s) for DescriptionField widget.
  FocusNode? descriptionFieldFocusNode;
  TextEditingController? descriptionFieldTextController;
  String? Function(BuildContext, String?)?
      descriptionFieldTextControllerValidator;
  // State field(s) for QuantityField widget.
  FocusNode? quantityFieldFocusNode;
  TextEditingController? quantityFieldTextController;
  String? Function(BuildContext, String?)? quantityFieldTextControllerValidator;
  // State field(s) for CateOne widget.
  final cateOneKey = GlobalKey();
  FocusNode? cateOneFocusNode;
  TextEditingController? cateOneTextController;
  String? cateOneSelectedOption;
  String? Function(BuildContext, String?)? cateOneTextControllerValidator;
  // State field(s) for CateTwo widget.
  final cateTwoKey = GlobalKey();
  FocusNode? cateTwoFocusNode;
  TextEditingController? cateTwoTextController;
  String? cateTwoSelectedOption;
  String? Function(BuildContext, String?)? cateTwoTextControllerValidator;
  // State field(s) for CateThree widget.
  final cateThreeKey = GlobalKey();
  FocusNode? cateThreeFocusNode;
  TextEditingController? cateThreeTextController;
  String? cateThreeSelectedOption;
  String? Function(BuildContext, String?)? cateThreeTextControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ItemRecord? dBAddItem;

  @override
  void initState(BuildContext context) {
    toCartModel = createModel(context, () => ToCartModel());
  }

  @override
  void dispose() {
    toCartModel.dispose();
    itemNameFieldFocusNode?.dispose();
    itemNameFieldTextController?.dispose();

    priceFieldFocusNode?.dispose();
    priceFieldTextController?.dispose();

    descriptionFieldFocusNode?.dispose();
    descriptionFieldTextController?.dispose();

    quantityFieldFocusNode?.dispose();
    quantityFieldTextController?.dispose();

    cateOneFocusNode?.dispose();

    cateTwoFocusNode?.dispose();

    cateThreeFocusNode?.dispose();
  }
}
