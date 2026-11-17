// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlunoStruct extends BaseStruct {
  AlunoStruct({
    int? idAluno,
    int? idGrau,
    String? nome,
    String? idEscola,
    int? idAnoLetivo,
    String? siglaTurma,
    String? dtNascimento,
    String? nomeResponsavel,
  })  : _idAluno = idAluno,
        _idGrau = idGrau,
        _nome = nome,
        _idEscola = idEscola,
        _idAnoLetivo = idAnoLetivo,
        _siglaTurma = siglaTurma,
        _dtNascimento = dtNascimento,
        _nomeResponsavel = nomeResponsavel;

  // "id_aluno" field.
  int? _idAluno;
  int get idAluno => _idAluno ?? 0;
  set idAluno(int? val) => _idAluno = val;

  void incrementIdAluno(int amount) => idAluno = idAluno + amount;

  bool hasIdAluno() => _idAluno != null;

  // "id_grau" field.
  int? _idGrau;
  int get idGrau => _idGrau ?? 0;
  set idGrau(int? val) => _idGrau = val;

  void incrementIdGrau(int amount) => idGrau = idGrau + amount;

  bool hasIdGrau() => _idGrau != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "id_escola" field.
  String? _idEscola;
  String get idEscola => _idEscola ?? '';
  set idEscola(String? val) => _idEscola = val;

  bool hasIdEscola() => _idEscola != null;

  // "id_ano_letivo" field.
  int? _idAnoLetivo;
  int get idAnoLetivo => _idAnoLetivo ?? 0;
  set idAnoLetivo(int? val) => _idAnoLetivo = val;

  void incrementIdAnoLetivo(int amount) => idAnoLetivo = idAnoLetivo + amount;

  bool hasIdAnoLetivo() => _idAnoLetivo != null;

  // "sigla_turma" field.
  String? _siglaTurma;
  String get siglaTurma => _siglaTurma ?? '';
  set siglaTurma(String? val) => _siglaTurma = val;

  bool hasSiglaTurma() => _siglaTurma != null;

  // "dt_nascimento" field.
  String? _dtNascimento;
  String get dtNascimento => _dtNascimento ?? '';
  set dtNascimento(String? val) => _dtNascimento = val;

  bool hasDtNascimento() => _dtNascimento != null;

  // "nome_responsavel" field.
  String? _nomeResponsavel;
  String get nomeResponsavel => _nomeResponsavel ?? '';
  set nomeResponsavel(String? val) => _nomeResponsavel = val;

  bool hasNomeResponsavel() => _nomeResponsavel != null;

  static AlunoStruct fromMap(Map<String, dynamic> data) => AlunoStruct(
        idAluno: castToType<int>(data['id_aluno']),
        idGrau: castToType<int>(data['id_grau']),
        nome: data['nome'] as String?,
        idEscola: data['id_escola'] as String?,
        idAnoLetivo: castToType<int>(data['id_ano_letivo']),
        siglaTurma: data['sigla_turma'] as String?,
        dtNascimento: data['dt_nascimento'] as String?,
        nomeResponsavel: data['nome_responsavel'] as String?,
      );

  static AlunoStruct? maybeFromMap(dynamic data) =>
      data is Map ? AlunoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id_aluno': _idAluno,
        'id_grau': _idGrau,
        'nome': _nome,
        'id_escola': _idEscola,
        'id_ano_letivo': _idAnoLetivo,
        'sigla_turma': _siglaTurma,
        'dt_nascimento': _dtNascimento,
        'nome_responsavel': _nomeResponsavel,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id_aluno': serializeParam(
          _idAluno,
          ParamType.int,
        ),
        'id_grau': serializeParam(
          _idGrau,
          ParamType.int,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'id_escola': serializeParam(
          _idEscola,
          ParamType.String,
        ),
        'id_ano_letivo': serializeParam(
          _idAnoLetivo,
          ParamType.int,
        ),
        'sigla_turma': serializeParam(
          _siglaTurma,
          ParamType.String,
        ),
        'dt_nascimento': serializeParam(
          _dtNascimento,
          ParamType.String,
        ),
        'nome_responsavel': serializeParam(
          _nomeResponsavel,
          ParamType.String,
        ),
      }.withoutNulls;

  static AlunoStruct fromSerializableMap(Map<String, dynamic> data) =>
      AlunoStruct(
        idAluno: deserializeParam(
          data['id_aluno'],
          ParamType.int,
          false,
        ),
        idGrau: deserializeParam(
          data['id_grau'],
          ParamType.int,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        idEscola: deserializeParam(
          data['id_escola'],
          ParamType.String,
          false,
        ),
        idAnoLetivo: deserializeParam(
          data['id_ano_letivo'],
          ParamType.int,
          false,
        ),
        siglaTurma: deserializeParam(
          data['sigla_turma'],
          ParamType.String,
          false,
        ),
        dtNascimento: deserializeParam(
          data['dt_nascimento'],
          ParamType.String,
          false,
        ),
        nomeResponsavel: deserializeParam(
          data['nome_responsavel'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AlunoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AlunoStruct &&
        idAluno == other.idAluno &&
        idGrau == other.idGrau &&
        nome == other.nome &&
        idEscola == other.idEscola &&
        idAnoLetivo == other.idAnoLetivo &&
        siglaTurma == other.siglaTurma &&
        dtNascimento == other.dtNascimento &&
        nomeResponsavel == other.nomeResponsavel;
  }

  @override
  int get hashCode => const ListEquality().hash([
        idAluno,
        idGrau,
        nome,
        idEscola,
        idAnoLetivo,
        siglaTurma,
        dtNascimento,
        nomeResponsavel
      ]);
}

AlunoStruct createAlunoStruct({
  int? idAluno,
  int? idGrau,
  String? nome,
  String? idEscola,
  int? idAnoLetivo,
  String? siglaTurma,
  String? dtNascimento,
  String? nomeResponsavel,
}) =>
    AlunoStruct(
      idAluno: idAluno,
      idGrau: idGrau,
      nome: nome,
      idEscola: idEscola,
      idAnoLetivo: idAnoLetivo,
      siglaTurma: siglaTurma,
      dtNascimento: dtNascimento,
      nomeResponsavel: nomeResponsavel,
    );
