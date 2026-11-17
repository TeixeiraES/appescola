// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TurmasStruct extends BaseStruct {
  TurmasStruct({
    String? status,
    List<GrauTurmaStruct>? grauTurma,
  })  : _status = status,
        _grauTurma = grauTurma;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "grauTurma" field.
  List<GrauTurmaStruct>? _grauTurma;
  List<GrauTurmaStruct> get grauTurma => _grauTurma ?? const [];
  set grauTurma(List<GrauTurmaStruct>? val) => _grauTurma = val;

  void updateGrauTurma(Function(List<GrauTurmaStruct>) updateFn) {
    updateFn(_grauTurma ??= []);
  }

  bool hasGrauTurma() => _grauTurma != null;

  static TurmasStruct fromMap(Map<String, dynamic> data) => TurmasStruct(
        status: data['status'] as String?,
        grauTurma: getStructList(
          data['grauTurma'],
          GrauTurmaStruct.fromMap,
        ),
      );

  static TurmasStruct? maybeFromMap(dynamic data) =>
      data is Map ? TurmasStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'grauTurma': _grauTurma?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'grauTurma': serializeParam(
          _grauTurma,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static TurmasStruct fromSerializableMap(Map<String, dynamic> data) =>
      TurmasStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        grauTurma: deserializeStructParam<GrauTurmaStruct>(
          data['grauTurma'],
          ParamType.DataStruct,
          true,
          structBuilder: GrauTurmaStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TurmasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TurmasStruct &&
        status == other.status &&
        listEquality.equals(grauTurma, other.grauTurma);
  }

  @override
  int get hashCode => const ListEquality().hash([status, grauTurma]);
}

TurmasStruct createTurmasStruct({
  String? status,
}) =>
    TurmasStruct(
      status: status,
    );
