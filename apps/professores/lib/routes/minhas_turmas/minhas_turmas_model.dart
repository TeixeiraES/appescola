import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'minhas_turmas_widget.dart' show MinhasTurmasWidget;
import 'package:flutter/material.dart';

class MinhasTurmasModel extends FlutterFlowModel<MinhasTurmasWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GrauTurmas)] action in MinhasTurmas widget.
  ApiCallResponse? apiAuthValidationTurmas;
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

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
