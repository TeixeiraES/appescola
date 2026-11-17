// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChamadaFormatoStruct extends BaseStruct {
  ChamadaFormatoStruct({
    int? idAluno,
    String? presente,
  })  : _idAluno = idAluno,
        _presente = presente;

  // "id_aluno" field.
  int? _idAluno;
  int get idAluno => _idAluno ?? 0;
  set idAluno(int? val) => _idAluno = val;

  void incrementIdAluno(int amount) => idAluno = idAluno + amount;

  bool hasIdAluno() => _idAluno != null;

  // "presente" field.
  String? _presente;
  String get presente => _presente ?? '';
  set presente(String? val) => _presente = val;

  bool hasPresente() => _presente != null;

  static ChamadaFormatoStruct fromMap(Map<String, dynamic> data) =>
      ChamadaFormatoStruct(
        idAluno: castToType<int>(data['id_aluno']),
        presente: data['presente'] as String?,
      );

  static ChamadaFormatoStruct? maybeFromMap(dynamic data) => data is Map
      ? ChamadaFormatoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id_aluno': _idAluno,
        'presente': _presente,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id_aluno': serializeParam(
          _idAluno,
          ParamType.int,
        ),
        'presente': serializeParam(
          _presente,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChamadaFormatoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChamadaFormatoStruct(
        idAluno: deserializeParam(
          data['id_aluno'],
          ParamType.int,
          false,
        ),
        presente: deserializeParam(
          data['presente'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChamadaFormatoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChamadaFormatoStruct &&
        idAluno == other.idAluno &&
        presente == other.presente;
  }

  @override
  int get hashCode => const ListEquality().hash([idAluno, presente]);
}

ChamadaFormatoStruct createChamadaFormatoStruct({
  int? idAluno,
  String? presente,
}) =>
    ChamadaFormatoStruct(
      idAluno: idAluno,
      presente: presente,
    );
