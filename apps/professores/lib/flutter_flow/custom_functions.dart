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
import '/backend/schema/enums/enums.dart';
import '/auth/custom_auth/auth_util.dart';

int returnIndex(int? idPergunta) {
  if (idPergunta == null) {
    return 0;
  }

  return idPergunta - 1;
}

DateTime? expiryTime() {
// write a function that gets the current time, adds 8 hours to the current time and then returns it as a timestamp value
  // Get the current time
  DateTime currentTime = DateTime.now();

  // Add 8 hours to the current time
  DateTime expiryTime = currentTime.add(Duration(hours: 8));

  // Return the expiry time as a timestamp value
  return expiryTime;
}

String? dateFormatterDayMonth(String dateString) {
  ///the function gets a string of type "2025-01-19 09:56:00.727"
  /// and formats it to "dd/mm"
  DateTime dateTime = DateTime.parse(dateString);
  return DateFormat('dd/MM').format(dateTime);
}

String? searchStudentName(
  String searchId,
  List<AlunoStruct> studentList,
) {
  for (AlunoStruct student in studentList) {
    if (student == searchId) {
      return student.nome;
    }
  }
  return null;
}

List<dynamic> generateJsonAttendanceList(
  List<int> k,
  List<String> p,
) {
  ///if (k.length != p.length) {
  ///  throw ArgumentError("Both lists must have the same length.");
  ///}

  List<dynamic> result = [];

  for (int i = 0; i < k.length; i++) {
    if (k.length != p.length) {
      p.add("E");
    }
    result.add({"id_aluno": k[i], "presente": p[i]});
  }

  return result;
}

bool compareLists(
  List<String>? list1,
  List<String>? list2,
) {
  // a function that receives two lists of strings as parameter and compares if they're equal. Return True or False
  return list1.toString() == list2.toString();
}

bool listChecker(List<String> list) {
// a function that receives a list and returns false if any of the values are "I"
  if (list.contains("I") || list.contains("")) {
    return false;
  } else
    return true;
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

dynamic filterItemsByDate(
  String targetDate,
  String items,
) {
  //  a function that receives a json and a target date, filters the json by date and sorts its items by id_pergunta. It then returns a json. [   {     "data": "18/01/2025",     "id_pergunta": 6,     "pergunta": "Eu almoçei:",     "resposta": "Sim, Arroz e Feijao"   },   {     "data": "18/01/2025",     "id_pergunta": 5,     "pergunta": "tomei remédio?",     "resposta": "Nao"   },   {     "data": "16/01/2025",     "id_pergunta": 1,     "pergunta": " lanchei:",     "resposta": "Sim"   }]
  // Parse the JSON string into a list of maps
  List<dynamic> jsonList = json.decode(items);

  // Filter the items by the target date
  List<dynamic> filteredItems = jsonList.where((item) {
    return item['data'] == targetDate;
  }).toList();

  // Sort the filtered items by 'id_pergunta'
  filteredItems.sort((a, b) => a['id_pergunta'].compareTo(b['id_pergunta']));

  // Return the filtered and sorted list as JSON
  return json.encode(filteredItems);
}

bool isElementInList(
  List<String> inputList,
  String element,
) {
  //compara se o elemento esta presente na lista
  return inputList.contains(element);
}

List<String> toSetCopy(List<String> inputList) {
  // a function that receives a list as parameter and returns unrepeated items of this list. example input: "16/01/2025", [   "18/01/2025",   "18/01/2025",   "18/01/2025",   "18/01/2025",   "18/01/2025",   "18/01/2025",   "18/01/2025",   "18/01/2025",   "18/01/2025",   "18/01/2025",   "18/01/2025",   "18/01/2025",   "16/01/2025",   "16/01/2025",   "16/01/2025",   "16/01/2025",   "16/01/2025",   "16/01/2025" ] return: [   "18/01/2025",  "16/01/2025" ]
  return inputList.toSet().toList();
}
