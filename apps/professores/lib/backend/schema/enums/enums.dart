import 'package:collection/collection.dart';

enum TipoOcorrenciaAnotacao {
  O,
  A,
}

enum Meses {
  Janeiro,
  Fevereiro,
  Marco,
  Abril,
  Maio,
  Junho,
  Julho,
  Agosto,
  Setembro,
  Outubro,
  Novembro,
  Dezembro,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (TipoOcorrenciaAnotacao):
      return TipoOcorrenciaAnotacao.values.deserialize(value) as T?;
    case (Meses):
      return Meses.values.deserialize(value) as T?;
    default:
      return null;
  }
}
