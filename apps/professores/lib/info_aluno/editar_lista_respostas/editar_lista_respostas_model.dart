import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/home_button/home_button_widget.dart';
import '/pages/components/resposta_text_field/resposta_text_field_widget.dart';
import 'dart:async';
import 'editar_lista_respostas_widget.dart' show EditarListaRespostasWidget;
import 'package:flutter/material.dart';

class EditarListaRespostasModel
    extends FlutterFlowModel<EditarListaRespostasWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  DateTime? datePicked;
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;
  // Models for respostaTextField dynamic component.
  late FlutterFlowDynamicModels<RespostaTextFieldModel> respostaTextFieldModels;
  // Stores action output result for [Backend Call - API (PostRespostas)] action in Button widget.
  ApiCallResponse? postDiary;
  // Model for HomeButton component.
  late HomeButtonModel homeButtonModel;

  @override
  void initState(BuildContext context) {
    respostaTextFieldModels =
        FlutterFlowDynamicModels(() => RespostaTextFieldModel());
    homeButtonModel = createModel(context, () => HomeButtonModel());
  }

  @override
  void dispose() {
    respostaTextFieldModels.dispose();
    homeButtonModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
