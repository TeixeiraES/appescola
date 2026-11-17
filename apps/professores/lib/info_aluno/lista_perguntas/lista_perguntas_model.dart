import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'lista_perguntas_widget.dart' show ListaPerguntasWidget;
import 'package:flutter/material.dart';

class ListaPerguntasModel extends FlutterFlowModel<ListaPerguntasWidget> {
  ///  Local state fields for this page.

  dynamic testinput;

  List<ResponseParsingStruct> testreturn = [];
  void addToTestreturn(ResponseParsingStruct item) => testreturn.add(item);
  void removeFromTestreturn(ResponseParsingStruct item) =>
      testreturn.remove(item);
  void removeAtIndexFromTestreturn(int index) => testreturn.removeAt(index);
  void insertAtIndexInTestreturn(int index, ResponseParsingStruct item) =>
      testreturn.insert(index, item);
  void updateTestreturnAtIndex(
          int index, Function(ResponseParsingStruct) updateFn) =>
      testreturn[index] = updateFn(testreturn[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
