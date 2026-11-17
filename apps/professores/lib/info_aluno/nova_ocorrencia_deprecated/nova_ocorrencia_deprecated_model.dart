import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/home_button/home_button_widget.dart';
import '/pages/components/selecionar_disciplinas_dropdown/selecionar_disciplinas_dropdown_widget.dart';
import '/pages/components/template_ocorrencia_dropdown/template_ocorrencia_dropdown_widget.dart';
import 'nova_ocorrencia_deprecated_widget.dart'
    show NovaOcorrenciaDeprecatedWidget;
import 'package:flutter/material.dart';

class NovaOcorrenciaDeprecatedModel
    extends FlutterFlowModel<NovaOcorrenciaDeprecatedWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  DateTime? datePicked;
  // Model for selecionarDisciplinasDropdown component.
  late SelecionarDisciplinasDropdownModel selecionarDisciplinasDropdownModel;
  // Model for templateOcorrenciaDropdown component.
  late TemplateOcorrenciaDropdownModel templateOcorrenciaDropdownModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for HomeButton component.
  late HomeButtonModel homeButtonModel;

  @override
  void initState(BuildContext context) {
    selecionarDisciplinasDropdownModel =
        createModel(context, () => SelecionarDisciplinasDropdownModel());
    templateOcorrenciaDropdownModel =
        createModel(context, () => TemplateOcorrenciaDropdownModel());
    homeButtonModel = createModel(context, () => HomeButtonModel());
  }

  @override
  void dispose() {
    selecionarDisciplinasDropdownModel.dispose();
    templateOcorrenciaDropdownModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    homeButtonModel.dispose();
  }
}
