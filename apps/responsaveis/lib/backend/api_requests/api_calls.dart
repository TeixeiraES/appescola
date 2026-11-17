import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Backend Group Code

class BackendGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      const String.fromEnvironment('API_BASE_URL');
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'TOKEN': '[TOKEN]',
  };
  static GetPerguntasCall getPerguntasCall = GetPerguntasCall();
  static PostRespostasCall postRespostasCall = PostRespostasCall();
  static GetTokenCall getTokenCall = GetTokenCall();
  static GetMatriculasCall getMatriculasCall = GetMatriculasCall();
  static GetHorariosCall getHorariosCall = GetHorariosCall();
  static GetCardapioCall getCardapioCall = GetCardapioCall();
  static GetOcorrenciasCall getOcorrenciasCall = GetOcorrenciasCall();
  static GetConteudoCall getConteudoCall = GetConteudoCall();
  static GetChamadaAlunoCall getChamadaAlunoCall = GetChamadaAlunoCall();
  static GetRespostasCall getRespostasCall = GetRespostasCall();
  static GetMuralCall getMuralCall = GetMuralCall();
  static GetComunicadosCall getComunicadosCall = GetComunicadosCall();
}

class GetPerguntasCall {
  Future<ApiCallResponse> call({
    int? grau,
    String? token = '',
  }) async {
    final baseUrl = BackendGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getPerguntas',
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
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostRespostasCall {
  Future<ApiCallResponse> call({
    dynamic respostasJson,
    String? token = '',
  }) async {
    final baseUrl = BackendGroup.getBaseUrl(
      token: token,
    );

    final respostas = _serializeJson(respostasJson);
    final ffApiRequestBody = '''
${respostas}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postRespostas',
      apiUrl: '${baseUrl}/a',
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

class GetTokenCall {
  Future<ApiCallResponse> call({
    String? usuario = '',
    String? senha = '',
    String? token = '',
  }) async {
    final baseUrl = BackendGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "usuario": "${escapeStringForJson(usuario)}",
  "senha": "${escapeStringForJson(senha)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getToken',
      apiUrl: '${baseUrl}/wsautenticar.rule?sys=AAP',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
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
  String? nome(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.nome''',
      ));
  String? versaominima(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.versaominima_familia''',
      ));
  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  int? codigo(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.codigo''',
      ));
  String? tempo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.tempo''',
      ));
}

class GetMatriculasCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = BackendGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getMatriculas',
      apiUrl: '${baseUrl}/wsAlunosResp.rule?sys=AAP',
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

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  List? alunosinfo(dynamic response) => getJsonField(
        response,
        r'''$.alunos''',
        true,
      ) as List?;
  List<int>? ids(dynamic response) => (getJsonField(
        response,
        r'''$.alunos[:].id_aluno''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? graunumero(dynamic response) => (getJsonField(
        response,
        r'''$.alunos[:].id_grau''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? nomealuno(dynamic response) => (getJsonField(
        response,
        r'''$.alunos[:].nome''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? anoletivo(dynamic response) => (getJsonField(
        response,
        r'''$.alunos[:].id_ano_letivo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetHorariosCall {
  Future<ApiCallResponse> call({
    int? idAluno,
    String? token = '',
  }) async {
    final baseUrl = BackendGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getHorarios',
      apiUrl: '${baseUrl}/wsHorarios.rule?sys=AAP',
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
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? grau(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.horarios[0].grau''',
      ));
  String? imageUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.horarios[0].url''',
      ));
}

class GetCardapioCall {
  Future<ApiCallResponse> call({
    int? idAluno,
    String? token = '',
  }) async {
    final baseUrl = BackendGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getCardapio',
      apiUrl: '${baseUrl}/wsCardapio.rule?sys=AAP',
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

  dynamic cardapio(dynamic response) => getJsonField(
        response,
        r'''$.cardapio''',
      );
}

class GetOcorrenciasCall {
  Future<ApiCallResponse> call({
    int? idAluno,
    String? token = '',
  }) async {
    final baseUrl = BackendGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getOcorrencias',
      apiUrl: '${baseUrl}/wsGetAnotacoesOcorrencias.rule?sys=AAP',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {
        'id_aluno': idAluno,
        'tipo': "O",
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

class GetConteudoCall {
  Future<ApiCallResponse> call({
    int? idTurma,
    String? token = '',
  }) async {
    final baseUrl = BackendGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getConteudo',
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

class GetChamadaAlunoCall {
  Future<ApiCallResponse> call({
    int? idAluno,
    String? data = '',
    String? token = '',
  }) async {
    final baseUrl = BackendGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getChamadaAluno',
      apiUrl: '${baseUrl}/wsRegistrosPresencaAluno.rule?sys=AAP',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'TOKEN': '${token}',
      },
      params: {
        'id_aluno': idAluno,
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
}

class GetRespostasCall {
  Future<ApiCallResponse> call({
    int? idAluno,
    String? token = '',
  }) async {
    final baseUrl = BackendGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getRespostas',
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

  List? agenda(dynamic response) => getJsonField(
        response,
        r'''$.agenda''',
        true,
      ) as List?;
}

class GetMuralCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = BackendGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getMural',
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
    final baseUrl = BackendGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getComunicados',
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

/// End Backend Group Code

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
