import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/home_button/home_button_widget.dart';
import '/pages/components/selecionar_disciplinas_dropdown/selecionar_disciplinas_dropdown_widget.dart';
import '/index.dart';
import 'nova_aula_widget.dart' show NovaAulaWidget;
import 'package:flutter/material.dart';

class NovaAulaModel extends FlutterFlowModel<NovaAulaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  DateTime? datePicked;
  // Model for selecionarDisciplinasDropdown component.
  late SelecionarDisciplinasDropdownModel selecionarDisciplinasDropdownModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o conteúdo de aula';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }
    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Backend Call - API (PostConteudo)] action in Button widget.
  ApiCallResponse? postconteudoresp;
  // Model for HomeButton component.
  late HomeButtonModel homeButtonModel;

  @override
  void initState(BuildContext context) {
    selecionarDisciplinasDropdownModel =
        createModel(context, () => SelecionarDisciplinasDropdownModel());
    textController1Validator = _textController1Validator;
    homeButtonModel = createModel(context, () => HomeButtonModel());
  }

  @override
  void dispose() {
    selecionarDisciplinasDropdownModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    homeButtonModel.dispose();
  }
}
