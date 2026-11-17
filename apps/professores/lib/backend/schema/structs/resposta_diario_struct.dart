// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RespostaDiarioStruct extends BaseStruct {
  RespostaDiarioStruct({
    int? idPergunta,
    String? resposta,
  })  : _idPergunta = idPergunta,
        _resposta = resposta;

  // "id_pergunta" field.
  int? _idPergunta;
  int get idPergunta => _idPergunta ?? 0;
  set idPergunta(int? val) => _idPergunta = val;

  void incrementIdPergunta(int amount) => idPergunta = idPergunta + amount;

  bool hasIdPergunta() => _idPergunta != null;

  // "resposta" field.
  String? _resposta;
  String get resposta => _resposta ?? '';
  set resposta(String? val) => _resposta = val;

  bool hasResposta() => _resposta != null;

  static RespostaDiarioStruct fromMap(Map<String, dynamic> data) =>
      RespostaDiarioStruct(
        idPergunta: castToType<int>(data['id_pergunta']),
        resposta: data['resposta'] as String?,
      );

  static RespostaDiarioStruct? maybeFromMap(dynamic data) => data is Map
      ? RespostaDiarioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id_pergunta': _idPergunta,
        'resposta': _resposta,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id_pergunta': serializeParam(
          _idPergunta,
          ParamType.int,
        ),
        'resposta': serializeParam(
          _resposta,
          ParamType.String,
        ),
      }.withoutNulls;

  static RespostaDiarioStruct fromSerializableMap(Map<String, dynamic> data) =>
      RespostaDiarioStruct(
        idPergunta: deserializeParam(
          data['id_pergunta'],
          ParamType.int,
          false,
        ),
        resposta: deserializeParam(
          data['resposta'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RespostaDiarioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RespostaDiarioStruct &&
        idPergunta == other.idPergunta &&
        resposta == other.resposta;
  }

  @override
  int get hashCode => const ListEquality().hash([idPergunta, resposta]);
}

RespostaDiarioStruct createRespostaDiarioStruct({
  int? idPergunta,
  String? resposta,
}) =>
    RespostaDiarioStruct(
      idPergunta: idPergunta,
      resposta: resposta,
    );
