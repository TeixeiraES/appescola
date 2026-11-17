import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start App Group Code

class AppGroup {
  static String getBaseUrl() => const String.fromEnvironment('API_BASE_URL');
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetPerguntasCall getPerguntasCall = GetPerguntasCall();
  static PostRespostasCall postRespostasCall = PostRespostasCall();
  static LoginCall loginCall = LoginCall();
  static GrauTurmasCall grauTurmasCall = GrauTurmasCall();
  static AlunosCall alunosCall = AlunosCall();
  static TemplateOcorrenciaAnotacaoCall templateOcorrenciaAnotacaoCall =
      TemplateOcorrenciaAnotacaoCall();
  static GetDisciplinasCall getDisciplinasCall = GetDisciplinasCall();
  static GetAnotacoesOcorrenciasCall getAnotacoesOcorrenciasCall =
      GetAnotacoesOcorrenciasCall();
  static PostAnotacaoOcorrenciaCall postAnotacaoOcorrenciaCall =
      PostAnotacaoOcorrenciaCall();
  static GetMeusHorariosCall getMeusHorariosCall = GetMeusHorariosCall();
  static GetCardapioCall getCardapioCall = GetCardapioCall();
  static GetMuralCall getMuralCall = GetMuralCall();
  static GetComunicadosCall getComunicadosCall = GetComunicadosCall();
  static PostChamadaCall postChamadaCall = PostChamadaCall();
  static GetChamadaCall getChamadaCall = GetChamadaCall();
  static GetConteudoCall getConteudoCall = GetConteudoCall();
  static PostConteudoCall postConteudoCall = PostConteudoCall();
  static PerguntasRespostasCall perguntasRespostasCall =
      PerguntasRespostasCall();
}

class GetPerguntasCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? grau = '',
  }) async {
    final baseUrl = AppGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetPerguntas',
      apiUrl: '${baseUrl}/wsPerguntasGrau.rule?sys=AAP',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {
        'grau': grau,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostRespostasCall {
  Future<ApiCallResponse> call({
    dynamic respostasJson,
    String? token = '',
    String? datahora = '',
    String? idAluno = '',
  }) async {
    final baseUrl = AppGroup.getBaseUrl();

    final respostas = _serializeJson(respostasJson, true);
    final ffApiRequestBody = '''
{
  "datahora": "${datahora}",
  "id_aluno": "${idAluno}",
  "respostas": ${respostas}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostRespostas',
      apiUrl: '${baseUrl}/wsAgendaResponder.rule?sys=AAP',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? usuario = '',
    String? senha = '',
  }) async {
    final baseUrl = AppGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "usuario": "${escapeStringForJson(usuario)}",
  "senha": "${escapeStringForJson(senha)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${baseUrl}/wsautenticar.rule?sys=AAP',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'APIKEY': const String.fromEnvironment('API_KEY'),
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? codigo(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.codigo''',
      ));
  String? nome(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.nome''',
      ));
  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  String? tempo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.tempo''',
      ));
  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  String? versaominima(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.versaominima_escola''',
      ));
}

class GrauTurmasCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AppGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GrauTurmas',
      apiUrl: '${baseUrl}/wsGrauTurmas.rule?sys=AAP',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? grauTurma(dynamic response) => getJsonField(
        response,
        r'''$.grauTurma''',
        true,
      ) as List?;
}

class AlunosCall {
  Future<ApiCallResponse> call({
    int? idturma,
    String? token = '',
  }) async {
    final baseUrl = AppGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Alunos',
      apiUrl: '${baseUrl}/wsAlunosGrau.rule?sys=AAP',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {
        'idturma': idturma,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? alunos(dynamic response) => getJsonField(
        response,
        r'''$.alunos''',
        true,
      ) as List?;
}

class TemplateOcorrenciaAnotacaoCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AppGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'TemplateOcorrenciaAnotacao',
      apiUrl: '${baseUrl}/wsGetTemplate.rule?sys=AAP',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? templatesId(dynamic response) => (getJsonField(
        response,
        r'''$.padroes[:].id_template''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? desc(dynamic response) => (getJsonField(
        response,
        r'''$.padroes[:].descricao_template''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetDisciplinasCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? grau = '',
  }) async {
    final baseUrl = AppGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetDisciplinas',
      apiUrl: '${baseUrl}/wsDisciplinas.rule?sys=AAP',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {
        'grau': grau,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? idDisciplina(dynamic response) => (getJsonField(
        response,
        r'''$.disciplinas[:].id_disciplina''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? descDisciplia(dynamic response) => (getJsonField(
        response,
        r'''$.disciplinas[:].disciplina''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetAnotacoesOcorrenciasCall {
  Future<ApiCallResponse> call({
    String? idAluno = '',
    String? token = '',
    String? tipo = '',
  }) async {
    final baseUrl = AppGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetAnotacoesOcorrencias',
      apiUrl: '${baseUrl}/wsGetAnotacoesOcorrencias.rule?sys=AAP',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {
        'id_aluno': idAluno,
        'tipo': tipo,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? lancamentos(dynamic response) => getJsonField(
        response,
        r'''$.lancamentos''',
        true,
      ) as List?;
}

class PostAnotacaoOcorrenciaCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? datahora = '',
    String? idAluno = '',
    String? tipo = '',
    String? idDisciplina,
    int? idTemplate,
    String? detalhamento = '',
  }) async {
    idDisciplina ??= '';
    final baseUrl = AppGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "datahora": "${escapeStringForJson(datahora)}",
  "id_aluno": "${escapeStringForJson(idAluno)}",
  "tipo": "${escapeStringForJson(tipo)}",
  "id_disciplina": "${escapeStringForJson(idDisciplina)}",
  "id_template": ${idTemplate},
  "detalhamento": "${escapeStringForJson(detalhamento)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: ' PostAnotacaoOcorrencia',
      apiUrl: '${baseUrl}/wsPostAnotacaoOcorrencia.rule?sys=AAP',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class GetMeusHorariosCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AppGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetMeusHorarios',
      apiUrl: '${baseUrl}/wsHorarios.rule?sys=AAP',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? horarios(dynamic response) => getJsonField(
        response,
        r'''$.horarios''',
        true,
      ) as List?;
}

class GetCardapioCall {
  Future<ApiCallResponse> call({
    String? idAluno = '',
    String? token = '',
  }) async {
    final baseUrl = AppGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetCardapio',
      apiUrl: '${baseUrl}/wsCardapio.rule?sys=AAP',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic cardapio(dynamic response) => getJsonField(
        response,
        r'''$.cardapio''',
      );
}

class GetMuralCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AppGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetMural',
      apiUrl: '${baseUrl}/wsMural.rule?sys=AAP',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetComunicadosCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AppGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetComunicados',
      apiUrl: '${baseUrl}/wsComunicados.rule?sys=AAP',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostChamadaCall {
  Future<ApiCallResponse> call({
    String? data = '',
    int? idTurma,
    dynamic listaPresencaJson,
    String? token = '',
  }) async {
    final baseUrl = AppGroup.getBaseUrl();

    final listaPresenca = _serializeJson(listaPresencaJson, true);
    final ffApiRequestBody = '''
{
  "data": "${escapeStringForJson(data)}",
  "id_turma": ${idTurma},
  "listaPresenca": ${listaPresenca}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostChamada',
      apiUrl: '${baseUrl}/wsRegistrarPresenca.rule?sys=AAP',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetChamadaCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idTurma = '',
    String? data = '',
  }) async {
    final baseUrl = AppGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetChamada',
      apiUrl: '${baseUrl}/wsRegistrosPresenca.rule?sys=AAP',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {
        'id_turma': idTurma,
        'data': data,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? listaPresenca(dynamic response) => getJsonField(
        response,
        r'''$.listaPresenca''',
        true,
      ) as List?;
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  List<String>? valoresPresenca(dynamic response) => (getJsonField(
        response,
        r'''$.listaPresenca[:].presente''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetConteudoCall {
  Future<ApiCallResponse> call({
    String? idTurma = '',
    String? token = '',
  }) async {
    final baseUrl = AppGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetConteudo',
      apiUrl: '${baseUrl}/wsConteudos.rule?sys=AAP',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {
        'id_turma': idTurma,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? conteudos(dynamic response) => getJsonField(
        response,
        r'''$.conteudos''',
        true,
      ) as List?;
}

class PostConteudoCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? data = '',
    int? idTurma,
    int? idDisciplina,
    String? conteudoAula = '',
    String? atividadeSala = '',
    String? tarefaCasa = '',
  }) async {
    final baseUrl = AppGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'PostConteudo',
      apiUrl: '${baseUrl}/wsRegistrarConteudos.rule?sys=AAP',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class PerguntasRespostasCall {
  Future<ApiCallResponse> call({
    String? idAluno = '',
    String? token = '',
  }) async {
    final baseUrl = AppGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'PerguntasRespostas',
      apiUrl: '${baseUrl}/wsPerguntasGrauResp.rule?sys=AAP',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {
        'id_aluno': idAluno,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? dates(dynamic response) => (getJsonField(
        response,
        r'''$.agenda[:].data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End App Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
