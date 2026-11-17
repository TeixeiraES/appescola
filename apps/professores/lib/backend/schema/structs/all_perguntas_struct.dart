// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllPerguntasStruct extends BaseStruct {
  AllPerguntasStruct({
    String? status,
    List<PerguntasStruct>? perguntas,
  })  : _status = status,
        _perguntas = perguntas;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "perguntas" field.
  List<PerguntasStruct>? _perguntas;
  List<PerguntasStruct> get perguntas => _perguntas ?? const [];
  set perguntas(List<PerguntasStruct>? val) => _perguntas = val;

  void updatePerguntas(Function(List<PerguntasStruct>) updateFn) {
    updateFn(_perguntas ??= []);
  }

  bool hasPerguntas() => _perguntas != null;

  static AllPerguntasStruct fromMap(Map<String, dynamic> data) =>
      AllPerguntasStruct(
        status: data['status'] as String?,
        perguntas: getStructList(
          data['perguntas'],
          PerguntasStruct.fromMap,
        ),
      );

  static AllPerguntasStruct? maybeFromMap(dynamic data) => data is Map
      ? AllPerguntasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'perguntas': _perguntas?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'perguntas': serializeParam(
          _perguntas,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static AllPerguntasStruct fromSerializableMap(Map<String, dynamic> data) =>
      AllPerguntasStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        perguntas: deserializeStructParam<PerguntasStruct>(
          data['perguntas'],
          ParamType.DataStruct,
          true,
          structBuilder: PerguntasStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AllPerguntasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AllPerguntasStruct &&
        status == other.status &&
        listEquality.equals(perguntas, other.perguntas);
  }

  @override
  int get hashCode => const ListEquality().hash([status, perguntas]);
}

AllPerguntasStruct createAllPerguntasStruct({
  String? status,
}) =>
    AllPerguntasStruct(
      status: status,
    );
