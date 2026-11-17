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

  String _alunoAtualId = '';
  String get alunoAtualId => _alunoAtualId;
  set alunoAtualId(String value) {
    _alunoAtualId = value;
  }

  String _alunoAtualNome = '';
  String get alunoAtualNome => _alunoAtualNome;
  set alunoAtualNome(String value) {
    _alunoAtualNome = value;
  }

  String _idGrauAtual = '';
  String get idGrauAtual => _idGrauAtual;
  set idGrauAtual(String value) {
    _idGrauAtual = value;
  }

  AlunoStruct _alunoAtualInfo = AlunoStruct();
  AlunoStruct get alunoAtualInfo => _alunoAtualInfo;
  set alunoAtualInfo(AlunoStruct value) {
    _alunoAtualInfo = value;
  }

  void updateAlunoAtualInfoStruct(Function(AlunoStruct) updateFn) {
    updateFn(_alunoAtualInfo);
  }

  String _turmaAtualNome = '';
  String get turmaAtualNome => _turmaAtualNome;
  set turmaAtualNome(String value) {
    _turmaAtualNome = value;
  }

  List<String> _presenceValues = [];
  List<String> get presenceValues => _presenceValues;
  set presenceValues(List<String> value) {
    _presenceValues = value;
  }

  void addToPresenceValues(String value) {
    presenceValues.add(value);
  }

  void removeFromPresenceValues(String value) {
    presenceValues.remove(value);
  }

  void removeAtIndexFromPresenceValues(int index) {
    presenceValues.removeAt(index);
  }

  void updatePresenceValuesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    presenceValues[index] = updateFn(_presenceValues[index]);
  }

  void insertAtIndexInPresenceValues(int index, String value) {
    presenceValues.insert(index, value);
  }

  List<dynamic> _listTeste = [];
  List<dynamic> get listTeste => _listTeste;
  set listTeste(List<dynamic> value) {
    _listTeste = value;
  }

  void addToListTeste(dynamic value) {
    listTeste.add(value);
  }

  void removeFromListTeste(dynamic value) {
    listTeste.remove(value);
  }

  void removeAtIndexFromListTeste(int index) {
    listTeste.removeAt(index);
  }

  void updateListTesteAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    listTeste[index] = updateFn(_listTeste[index]);
  }

  void insertAtIndexInListTeste(int index, dynamic value) {
    listTeste.insert(index, value);
  }

  List<int> _ktest = [];
  List<int> get ktest => _ktest;
  set ktest(List<int> value) {
    _ktest = value;
  }

  void addToKtest(int value) {
    ktest.add(value);
  }

  void removeFromKtest(int value) {
    ktest.remove(value);
  }

  void removeAtIndexFromKtest(int index) {
    ktest.removeAt(index);
  }

  void updateKtestAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    ktest[index] = updateFn(_ktest[index]);
  }

  void insertAtIndexInKtest(int index, int value) {
    ktest.insert(index, value);
  }

  String _tokentester = '';
  String get tokentester => _tokentester;
  set tokentester(String value) {
    _tokentester = value;
  }

  List<RespostaDiarioStruct> _diaryResponseValues = [];
  List<RespostaDiarioStruct> get diaryResponseValues => _diaryResponseValues;
  set diaryResponseValues(List<RespostaDiarioStruct> value) {
    _diaryResponseValues = value;
  }

  void addToDiaryResponseValues(RespostaDiarioStruct value) {
    diaryResponseValues.add(value);
  }

  void removeFromDiaryResponseValues(RespostaDiarioStruct value) {
    diaryResponseValues.remove(value);
  }

  void removeAtIndexFromDiaryResponseValues(int index) {
    diaryResponseValues.removeAt(index);
  }

  void updateDiaryResponseValuesAtIndex(
    int index,
    RespostaDiarioStruct Function(RespostaDiarioStruct) updateFn,
  ) {
    diaryResponseValues[index] = updateFn(_diaryResponseValues[index]);
  }

  void insertAtIndexInDiaryResponseValues(
      int index, RespostaDiarioStruct value) {
    diaryResponseValues.insert(index, value);
  }

  int _idTurmaAtual = 0;
  int get idTurmaAtual => _idTurmaAtual;
  set idTurmaAtual(int value) {
    _idTurmaAtual = value;
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

  final _cardapioQueryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> cardapioQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _cardapioQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCardapioQueryCache() => _cardapioQueryManager.clear();
  void clearCardapioQueryCacheKey(String? uniqueKey) =>
      _cardapioQueryManager.clearRequest(uniqueKey);

  final _diarioManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> diario({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _diarioManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDiarioCache() => _diarioManager.clear();
  void clearDiarioCacheKey(String? uniqueKey) =>
      _diarioManager.clearRequest(uniqueKey);

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

  final _turmasQueryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> turmasQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _turmasQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTurmasQueryCache() => _turmasQueryManager.clear();
  void clearTurmasQueryCacheKey(String? uniqueKey) =>
      _turmasQueryManager.clearRequest(uniqueKey);

  final _anotacoesQueryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> anotacoesQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _anotacoesQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAnotacoesQueryCache() => _anotacoesQueryManager.clear();
  void clearAnotacoesQueryCacheKey(String? uniqueKey) =>
      _anotacoesQueryManager.clearRequest(uniqueKey);

  final _agendaQueryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> agendaQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _agendaQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAgendaQueryCache() => _agendaQueryManager.clear();
  void clearAgendaQueryCacheKey(String? uniqueKey) =>
      _agendaQueryManager.clearRequest(uniqueKey);
}
