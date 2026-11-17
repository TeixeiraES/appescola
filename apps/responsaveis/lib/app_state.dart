import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<PerguntasStruct> _perguntasState = [];
  List<PerguntasStruct> get perguntasState => _perguntasState;
  set perguntasState(List<PerguntasStruct> value) {
    _perguntasState = value;
  }

  void addToPerguntasState(PerguntasStruct value) {
    perguntasState.add(value);
  }

  void removeFromPerguntasState(PerguntasStruct value) {
    perguntasState.remove(value);
  }

  void removeAtIndexFromPerguntasState(int index) {
    perguntasState.removeAt(index);
  }

  void updatePerguntasStateAtIndex(
    int index,
    PerguntasStruct Function(PerguntasStruct) updateFn,
  ) {
    perguntasState[index] = updateFn(_perguntasState[index]);
  }

  void insertAtIndexInPerguntasState(int index, PerguntasStruct value) {
    perguntasState.insert(index, value);
  }

  AlunoStruct _alunoSelecionado = AlunoStruct();
  AlunoStruct get alunoSelecionado => _alunoSelecionado;
  set alunoSelecionado(AlunoStruct value) {
    _alunoSelecionado = value;
  }

  void updateAlunoSelecionadoStruct(Function(AlunoStruct) updateFn) {
    updateFn(_alunoSelecionado);
  }

  dynamic _diarioAluno;
  dynamic get diarioAluno => _diarioAluno;
  set diarioAluno(dynamic value) {
    _diarioAluno = value;
  }

  final _perguntasManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> perguntas({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _perguntasManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPerguntasCache() => _perguntasManager.clear();
  void clearPerguntasCacheKey(String? uniqueKey) =>
      _perguntasManager.clearRequest(uniqueKey);

  final _ocorrenciasQueryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> ocorrenciasQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _ocorrenciasQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearOcorrenciasQueryCache() => _ocorrenciasQueryManager.clear();
  void clearOcorrenciasQueryCacheKey(String? uniqueKey) =>
      _ocorrenciasQueryManager.clearRequest(uniqueKey);
}
