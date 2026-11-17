// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConteudosStruct extends BaseStruct {
  ConteudosStruct({
    String? disciplina,
    String? conteudoAula,
    String? atividadeSala,
    String? tarefaCasa,
  })  : _disciplina = disciplina,
        _conteudoAula = conteudoAula,
        _atividadeSala = atividadeSala,
        _tarefaCasa = tarefaCasa;

  // "disciplina" field.
  String? _disciplina;
  String get disciplina => _disciplina ?? '';
  set disciplina(String? val) => _disciplina = val;

  bool hasDisciplina() => _disciplina != null;

  // "conteudo_aula" field.
  String? _conteudoAula;
  String get conteudoAula => _conteudoAula ?? '';
  set conteudoAula(String? val) => _conteudoAula = val;

  bool hasConteudoAula() => _conteudoAula != null;

  // "atividade_sala" field.
  String? _atividadeSala;
  String get atividadeSala => _atividadeSala ?? '';
  set atividadeSala(String? val) => _atividadeSala = val;

  bool hasAtividadeSala() => _atividadeSala != null;

  // "tarefa_casa" field.
  String? _tarefaCasa;
  String get tarefaCasa => _tarefaCasa ?? '';
  set tarefaCasa(String? val) => _tarefaCasa = val;

  bool hasTarefaCasa() => _tarefaCasa != null;

  static ConteudosStruct fromMap(Map<String, dynamic> data) => ConteudosStruct(
        disciplina: data['disciplina'] as String?,
        conteudoAula: data['conteudo_aula'] as String?,
        atividadeSala: data['atividade_sala'] as String?,
        tarefaCasa: data['tarefa_casa'] as String?,
      );

  static ConteudosStruct? maybeFromMap(dynamic data) => data is Map
      ? ConteudosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'disciplina': _disciplina,
        'conteudo_aula': _conteudoAula,
        'atividade_sala': _atividadeSala,
        'tarefa_casa': _tarefaCasa,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'disciplina': serializeParam(
          _disciplina,
          ParamType.String,
        ),
        'conteudo_aula': serializeParam(
          _conteudoAula,
          ParamType.String,
        ),
        'atividade_sala': serializeParam(
          _atividadeSala,
          ParamType.String,
        ),
        'tarefa_casa': serializeParam(
          _tarefaCasa,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConteudosStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConteudosStruct(
        disciplina: deserializeParam(
          data['disciplina'],
          ParamType.String,
          false,
        ),
        conteudoAula: deserializeParam(
          data['conteudo_aula'],
          ParamType.String,
          false,
        ),
        atividadeSala: deserializeParam(
          data['atividade_sala'],
          ParamType.String,
          false,
        ),
        tarefaCasa: deserializeParam(
          data['tarefa_casa'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConteudosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConteudosStruct &&
        disciplina == other.disciplina &&
        conteudoAula == other.conteudoAula &&
        atividadeSala == other.atividadeSala &&
        tarefaCasa == other.tarefaCasa;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([disciplina, conteudoAula, atividadeSala, tarefaCasa]);
}

ConteudosStruct createConteudosStruct({
  String? disciplina,
  String? conteudoAula,
  String? atividadeSala,
  String? tarefaCasa,
}) =>
    ConteudosStruct(
      disciplina: disciplina,
      conteudoAula: conteudoAula,
      atividadeSala: atividadeSala,
      tarefaCasa: tarefaCasa,
    );
