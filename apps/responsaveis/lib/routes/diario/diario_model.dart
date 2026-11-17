import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/home_button/home_button_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'dart:async';
import 'diario_widget.dart' show DiarioWidget;
import 'package:flutter/material.dart';

class DiarioModel extends FlutterFlowModel<DiarioWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getRespostas)] action in Diario widget.
  ApiCallResponse? getRespostasCall;
  DateTime? datePicked;
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;
  // Model for HomeButton component.
  late HomeButtonModel homeButtonModel;

  /// Query cache managers for this widget.

  final _presencasManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> presencas({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _presencasManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPresencasCache() => _presencasManager.clear();
  void clearPresencasCacheKey(String? uniqueKey) =>
      _presencasManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    homeButtonModel = createModel(context, () => HomeButtonModel());
  }

  @override
  void dispose() {
    homeButtonModel.dispose();

    /// Dispose query cache managers for this widget.

    clearPresencasCache();
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
