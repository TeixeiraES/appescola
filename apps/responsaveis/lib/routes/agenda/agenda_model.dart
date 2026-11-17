import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/home_button/home_button_widget.dart';
import 'agenda_widget.dart' show AgendaWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class AgendaModel extends FlutterFlowModel<AgendaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HomeButton component.
  late HomeButtonModel homeButtonModel;
  Completer<ApiCallResponse>? apiRequestCompleter;

  @override
  void initState(BuildContext context) {
    homeButtonModel = createModel(context, () => HomeButtonModel());
  }

  @override
  void dispose() {
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
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
