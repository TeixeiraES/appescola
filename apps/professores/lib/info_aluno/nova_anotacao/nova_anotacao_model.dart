import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/home_button/home_button_widget.dart';
import '/pages/components/selecionar_disciplinas_dropdown/selecionar_disciplinas_dropdown_widget.dart';
import '/pages/components/template_ocorrencia_dropdown/template_ocorrencia_dropdown_widget.dart';
import '/index.dart';
import 'nova_anotacao_widget.dart' show NovaAnotacaoWidget;
import 'package:flutter/material.dart';

class NovaAnotacaoModel extends FlutterFlowModel<NovaAnotacaoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for HomeButton component.
  late HomeButtonModel homeButtonModel;
  DateTime? datePicked;
  // Model for selecionarDisciplinasDropdown component.
  late SelecionarDisciplinasDropdownModel selecionarDisciplinasDropdownModel;
  // Model for templateOcorrenciaDropdown component.
  late TemplateOcorrenciaDropdownModel templateOcorrenciaDropdownModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? input;
  // Stores action output result for [Backend Call - API ( PostAnotacaoOcorrencia)] action in Button widget.
  ApiCallResponse? postAnotacaoSuccessMessage;

  @override
  void initState(BuildContext context) {
    homeButtonModel = createModel(context, () => HomeButtonModel());
    selecionarDisciplinasDropdownModel =
        createModel(context, () => SelecionarDisciplinasDropdownModel());
    templateOcorrenciaDropdownModel =
        createModel(context, () => TemplateOcorrenciaDropdownModel());
  }

  @override
  void dispose() {
    homeButtonModel.dispose();
    selecionarDisciplinasDropdownModel.dispose();
    templateOcorrenciaDropdownModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
