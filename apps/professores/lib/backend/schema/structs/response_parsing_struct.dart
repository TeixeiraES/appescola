// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponseParsingStruct extends BaseStruct {
  ResponseParsingStruct({
    String? data,
    int? idPergunta,
    String? pergunta,
    String? resposta,
  })  : _data = data,
        _idPergunta = idPergunta,
        _pergunta = pergunta,
        _resposta = resposta;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  set data(String? val) => _data = val;

  bool hasData() => _data != null;

  // "id_pergunta" field.
  int? _idPergunta;
  int get idPergunta => _idPergunta ?? 0;
  set idPergunta(int? val) => _idPergunta = val;

  void incrementIdPergunta(int amount) => idPergunta = idPergunta + amount;

  bool hasIdPergunta() => _idPergunta != null;

  // "pergunta" field.
  String? _pergunta;
  String get pergunta => _pergunta ?? '';
  set pergunta(String? val) => _pergunta = val;

  bool hasPergunta() => _pergunta != null;

  // "resposta" field.
  String? _resposta;
  String get resposta => _resposta ?? '';
  set resposta(String? val) => _resposta = val;

  bool hasResposta() => _resposta != null;

  static ResponseParsingStruct fromMap(Map<String, dynamic> data) =>
      ResponseParsingStruct(
        data: data['data'] as String?,
        idPergunta: castToType<int>(data['id_pergunta']),
        pergunta: data['pergunta'] as String?,
        resposta: data['resposta'] as String?,
      );

  static ResponseParsingStruct? maybeFromMap(dynamic data) => data is Map
      ? ResponseParsingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data,
        'id_pergunta': _idPergunta,
        'pergunta': _pergunta,
        'resposta': _resposta,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.String,
        ),
        'id_pergunta': serializeParam(
          _idPergunta,
          ParamType.int,
        ),
        'pergunta': serializeParam(
          _pergunta,
          ParamType.String,
        ),
        'resposta': serializeParam(
          _resposta,
          ParamType.String,
        ),
      }.withoutNulls;

  static ResponseParsingStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResponseParsingStruct(
        data: deserializeParam(
          data['data'],
          ParamType.String,
          false,
        ),
        idPergunta: deserializeParam(
          data['id_pergunta'],
          ParamType.int,
          false,
        ),
        pergunta: deserializeParam(
          data['pergunta'],
          ParamType.String,
          false,
        ),
        resposta: deserializeParam(
          data['resposta'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ResponseParsingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ResponseParsingStruct &&
        data == other.data &&
        idPergunta == other.idPergunta &&
        pergunta == other.pergunta &&
        resposta == other.resposta;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([data, idPergunta, pergunta, resposta]);
}

ResponseParsingStruct createResponseParsingStruct({
  String? data,
  int? idPergunta,
  String? pergunta,
  String? resposta,
}) =>
    ResponseParsingStruct(
      data: data,
      idPergunta: idPergunta,
      pergunta: pergunta,
      resposta: resposta,
    );
