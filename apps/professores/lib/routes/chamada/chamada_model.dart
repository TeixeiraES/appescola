import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/loading_lottie/loading_lottie_widget.dart';
import '/pages/components/presenca_choice_chip/presenca_choice_chip_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'chamada_widget.dart' show ChamadaWidget;
import 'package:flutter/material.dart';

class ChamadaModel extends FlutterFlowModel<ChamadaWidget> {
  ///  Local state fields for this page.

  List<ChamadaFormatoStruct> chamadaStateList = [];
  void addToChamadaStateList(ChamadaFormatoStruct item) =>
      chamadaStateList.add(item);
  void removeFromChamadaStateList(ChamadaFormatoStruct item) =>
      chamadaStateList.remove(item);
  void removeAtIndexFromChamadaStateList(int index) =>
      chamadaStateList.removeAt(index);
  void insertAtIndexInChamadaStateList(int index, ChamadaFormatoStruct item) =>
      chamadaStateList.insert(index, item);
  void updateChamadaStateListAtIndex(
          int index, Function(ChamadaFormatoStruct) updateFn) =>
      chamadaStateList[index] = updateFn(chamadaStateList[index]);

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (GetChamada)] action in Chamada widget.
  ApiCallResponse? getChamadaResponse;
  DateTime? datePicked;
  // Models for atualizaPresencaChoiceChip.
  late FlutterFlowDynamicModels<PresencaChoiceChipModel>
      atualizaPresencaChoiceChipModels;
  // Models for lancaPresencaChoiceChip.
  late FlutterFlowDynamicModels<PresencaChoiceChipModel>
      lancaPresencaChoiceChipModels;
  // Model for loadingLottie component.
  late LoadingLottieModel loadingLottieModel;

  /// Query cache managers for this widget.

  final _chamadaQueryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> chamadaQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _chamadaQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearChamadaQueryCache() => _chamadaQueryManager.clear();
  void clearChamadaQueryCacheKey(String? uniqueKey) =>
      _chamadaQueryManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    atualizaPresencaChoiceChipModels =
        FlutterFlowDynamicModels(() => PresencaChoiceChipModel());
    lancaPresencaChoiceChipModels =
        FlutterFlowDynamicModels(() => PresencaChoiceChipModel());
    loadingLottieModel = createModel(context, () => LoadingLottieModel());
  }

  @override
  void dispose() {
    atualizaPresencaChoiceChipModels.dispose();
    lancaPresencaChoiceChipModels.dispose();
    loadingLottieModel.dispose();

    /// Dispose query cache managers for this widget.

    clearChamadaQueryCache();
  }
}
