import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

int returnIndex(int? idPergunta) {
  if (idPergunta == null) {
    return 0;
  }

  return idPergunta - 1;
}

int getStringLenght(String str) {
  String onlyNumbers =
      str.replaceAll(RegExp(r'\D'), ''); // Remove all non-numeric characters
  return onlyNumbers.length;
}

String? aplicarMascara(
  String? valor,
  String mascara,
) {
  if (valor == null) return null;

  // Remove caracteres não numéricos do valor
  String apenasNumeros = valor.replaceAll(RegExp(r'\D'), '');

  // Limita o tamanho do valor ao tamanho da máscara
  int maxNumeros = mascara.replaceAll(RegExp(r'[^#]'), '').length;
  apenasNumeros = apenasNumeros.length > maxNumeros
      ? apenasNumeros.substring(0, maxNumeros)
      : apenasNumeros;

  StringBuffer resultado = StringBuffer();
  int numeroIndex = 0;

  for (int i = 0; i < mascara.length; i++) {
    if (mascara[i] == '#') {
      if (numeroIndex < apenasNumeros.length) {
        resultado.write(apenasNumeros[numeroIndex]);
        numeroIndex++;
      } else {
        break;
      }
    } else {
      resultado.write(mascara[i]);
    }
  }

  return resultado.toString();
}

/// recebe a lista de alunos, filtra por nome e retorna a lista de anos
List<String> getAnoLetivoByName(
  dynamic jsonData,
  String nome,
) {
  if (jsonData == null) {
    return <String>[];
  }

  late final List<dynamic> alunos;

  // 🔹 Caso 1: veio direto como lista
  if (jsonData is List) {
    alunos = jsonData;
  }
  // 🔹 Caso 2: veio como { "alunos": [...] }
  else if (jsonData is Map && jsonData['alunos'] is List) {
    alunos = jsonData['alunos'];
  } else {
    return <String>[];
  }

  return alunos
      .where((aluno) =>
          aluno is Map &&
          aluno['nome'] is String &&
          aluno['nome'] == nome &&
          aluno['id_ano_letivo'] != null)
      .map<String>((aluno) => aluno['id_ano_letivo'].toString())
      .toList();
}

AlunoStruct? parseAluno(String str) {
  final fixedJson = str
      // coloca aspas nas chaves
      .replaceAllMapped(
    RegExp(r'(\w+)\s*:'),
    (m) => '"${m[1]}":',
  )
      // coloca aspas em valores string (até vírgula ou })
      .replaceAllMapped(
    RegExp(r':\s*([^",}\n]+)(\s*[},])'),
    (m) {
      final value = m[1]!.trim();

      // se for número puro, não coloca aspas
      if (num.tryParse(value) != null) {
        return ': $value${m[2]}';
      }

      // caso contrário, trata como string
      return ': "${value.replaceAll('"', r'\"')}"${m[2]}';
    },
  );

  final Map<String, dynamic> json =
      jsonDecode(fixedJson) as Map<String, dynamic>;

  return AlunoStruct(
    idAluno: json['id_aluno'],
    idGrau: json['id_grau'],
    idTurma: json['id_turma'],
    nome: json['nome'],
    idAnoLetivo: json['id_ano_letivo'],
    dtNascimento: json['dt_nascimento'],
    nomeResponsavel: json['nome_responsavel'],
  );
}

String? dateFormatterDayMonth(String dateString) {
  ///the function gets a string of type "2025-01-19 09:56:00.727"
  /// and formats it to "dd/mm"
  DateTime dateTime = DateTime.parse(dateString);
  return DateFormat('dd/MM').format(dateTime);
}

String? dateParser(String date) {
  // a function to parse the year out of a date. example "22/04/2025 must be returned as 22/04
  try {
    final parts = date.split('/');
    if (parts.length == 3) {
      return '${parts[0]}/${parts[1]}'; // Return day and month
    }
  } catch (e) {
    return null; // Return null in case of any error
  }
  return null; // Return null if the format is incorrect
}
