import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/home_button/home_button_widget.dart';
import '/pages/components/loading_lottie/loading_lottie_widget.dart';
import '/index.dart';
import 'turma_widget.dart' show TurmaWidget;
import 'package:flutter/material.dart';

class TurmaModel extends FlutterFlowModel<TurmaWidget> {
  ///  Local state fields for this page.

  bool apiLoadStatus = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Alunos)] action in Turma widget.
  ApiCallResponse? getAlunosResponse;
  // Model for loadingLottie component.
  late LoadingLottieModel loadingLottieModel;
  // Model for HomeButton component.
  late HomeButtonModel homeButtonModel;

  @override
  void initState(BuildContext context) {
    loadingLottieModel = createModel(context, () => LoadingLottieModel());
    homeButtonModel = createModel(context, () => HomeButtonModel());
  }

  @override
  void dispose() {
    loadingLottieModel.dispose();
    homeButtonModel.dispose();
  }
}
