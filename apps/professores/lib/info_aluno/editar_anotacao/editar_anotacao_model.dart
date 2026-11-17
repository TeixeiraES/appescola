import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/home_button/home_button_widget.dart';
import 'editar_anotacao_widget.dart' show EditarAnotacaoWidget;
import 'package:flutter/material.dart';

class EditarAnotacaoModel extends FlutterFlowModel<EditarAnotacaoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HomeButton component.
  late HomeButtonModel homeButtonModel;
  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    homeButtonModel = createModel(context, () => HomeButtonModel());
  }

  @override
  void dispose() {
    homeButtonModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
