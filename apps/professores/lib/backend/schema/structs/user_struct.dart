// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? token,
    int? codigo,
    String? nome,
    String? email,
  })  : _token = token,
        _codigo = codigo,
        _nome = nome,
        _email = email;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;

  bool hasToken() => _token != null;

  // "codigo" field.
  int? _codigo;
  int get codigo => _codigo ?? 0;
  set codigo(int? val) => _codigo = val;

  void incrementCodigo(int amount) => codigo = codigo + amount;

  bool hasCodigo() => _codigo != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        token: data['token'] as String?,
        codigo: castToType<int>(data['codigo']),
        nome: data['nome'] as String?,
        email: data['email'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'token': _token,
        'codigo': _codigo,
        'nome': _nome,
        'email': _email,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
        'codigo': serializeParam(
          _codigo,
          ParamType.int,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
        codigo: deserializeParam(
          data['codigo'],
          ParamType.int,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        token == other.token &&
        codigo == other.codigo &&
        nome == other.nome &&
        email == other.email;
  }

  @override
  int get hashCode => const ListEquality().hash([token, codigo, nome, email]);
}

UserStruct createUserStruct({
  String? token,
  int? codigo,
  String? nome,
  String? email,
}) =>
    UserStruct(
      token: token,
      codigo: codigo,
      nome: nome,
      email: email,
    );
