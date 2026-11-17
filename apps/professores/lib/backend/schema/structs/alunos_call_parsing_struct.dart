// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlunosCallParsingStruct extends BaseStruct {
  AlunosCallParsingStruct({
    String? status,
    List<AlunoStruct>? alunos,
  })  : _status = status,
        _alunos = alunos;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "alunos" field.
  List<AlunoStruct>? _alunos;
  List<AlunoStruct> get alunos => _alunos ?? const [];
  set alunos(List<AlunoStruct>? val) => _alunos = val;

  void updateAlunos(Function(List<AlunoStruct>) updateFn) {
    updateFn(_alunos ??= []);
  }

  bool hasAlunos() => _alunos != null;

  static AlunosCallParsingStruct fromMap(Map<String, dynamic> data) =>
      AlunosCallParsingStruct(
        status: data['status'] as String?,
        alunos: getStructList(
          data['alunos'],
          AlunoStruct.fromMap,
        ),
      );

  static AlunosCallParsingStruct? maybeFromMap(dynamic data) => data is Map
      ? AlunosCallParsingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'alunos': _alunos?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'alunos': serializeParam(
          _alunos,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static AlunosCallParsingStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AlunosCallParsingStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        alunos: deserializeStructParam<AlunoStruct>(
          data['alunos'],
          ParamType.DataStruct,
          true,
          structBuilder: AlunoStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AlunosCallParsingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AlunosCallParsingStruct &&
        status == other.status &&
        listEquality.equals(alunos, other.alunos);
  }

  @override
  int get hashCode => const ListEquality().hash([status, alunos]);
}

AlunosCallParsingStruct createAlunosCallParsingStruct({
  String? status,
}) =>
    AlunosCallParsingStruct(
      status: status,
    );
