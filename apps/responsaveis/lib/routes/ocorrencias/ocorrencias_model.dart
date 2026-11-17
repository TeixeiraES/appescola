import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/home_button/home_button_widget.dart';
import 'dart:async';
import 'ocorrencias_widget.dart' show OcorrenciasWidget;
import 'package:flutter/material.dart';

class OcorrenciasModel extends FlutterFlowModel<OcorrenciasWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HomeButton component.
  late HomeButtonModel homeButtonModel;
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;

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
      final requestComplete = apiRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
