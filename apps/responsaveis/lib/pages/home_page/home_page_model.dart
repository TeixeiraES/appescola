import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getMatriculas)] action in HomePage widget.
  ApiCallResponse? getMatriculas;
  // State field(s) for DropDownAluno widget.
  String? dropDownAlunoValue;
  FormFieldController<String>? dropDownAlunoValueController;
  // State field(s) for DropDownMatricula widget.
  String? dropDownMatriculaValue;
  FormFieldController<String>? dropDownMatriculaValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
