// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GrauTurmaStruct extends BaseStruct {
  GrauTurmaStruct({
    int? idTurma,
    String? turma,
    int? idGrau,
    String? grau,
  })  : _idTurma = idTurma,
        _turma = turma,
        _idGrau = idGrau,
        _grau = grau;

  // "id_turma" field.
  int? _idTurma;
  int get idTurma => _idTurma ?? 0;
  set idTurma(int? val) => _idTurma = val;

  void incrementIdTurma(int amount) => idTurma = idTurma + amount;

  bool hasIdTurma() => _idTurma != null;

  // "turma" field.
  String? _turma;
  String get turma => _turma ?? '';
  set turma(String? val) => _turma = val;

  bool hasTurma() => _turma != null;

  // "id_grau" field.
  int? _idGrau;
  int get idGrau => _idGrau ?? 0;
  set idGrau(int? val) => _idGrau = val;

  void incrementIdGrau(int amount) => idGrau = idGrau + amount;

  bool hasIdGrau() => _idGrau != null;

  // "grau" field.
  String? _grau;
  String get grau => _grau ?? '';
  set grau(String? val) => _grau = val;

  bool hasGrau() => _grau != null;

  static GrauTurmaStruct fromMap(Map<String, dynamic> data) => GrauTurmaStruct(
        idTurma: castToType<int>(data['id_turma']),
        turma: data['turma'] as String?,
        idGrau: castToType<int>(data['id_grau']),
        grau: data['grau'] as String?,
      );

  static GrauTurmaStruct? maybeFromMap(dynamic data) => data is Map
      ? GrauTurmaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id_turma': _idTurma,
        'turma': _turma,
        'id_grau': _idGrau,
        'grau': _grau,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id_turma': serializeParam(
          _idTurma,
          ParamType.int,
        ),
        'turma': serializeParam(
          _turma,
          ParamType.String,
        ),
        'id_grau': serializeParam(
          _idGrau,
          ParamType.int,
        ),
        'grau': serializeParam(
          _grau,
          ParamType.String,
        ),
      }.withoutNulls;

  static GrauTurmaStruct fromSerializableMap(Map<String, dynamic> data) =>
      GrauTurmaStruct(
        idTurma: deserializeParam(
          data['id_turma'],
          ParamType.int,
          false,
        ),
        turma: deserializeParam(
          data['turma'],
          ParamType.String,
          false,
        ),
        idGrau: deserializeParam(
          data['id_grau'],
          ParamType.int,
          false,
        ),
        grau: deserializeParam(
          data['grau'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GrauTurmaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GrauTurmaStruct &&
        idTurma == other.idTurma &&
        turma == other.turma &&
        idGrau == other.idGrau &&
        grau == other.grau;
  }

  @override
  int get hashCode => const ListEquality().hash([idTurma, turma, idGrau, grau]);
}

GrauTurmaStruct createGrauTurmaStruct({
  int? idTurma,
  String? turma,
  int? idGrau,
  String? grau,
}) =>
    GrauTurmaStruct(
      idTurma: idTurma,
      turma: turma,
      idGrau: idGrau,
      grau: grau,
    );
