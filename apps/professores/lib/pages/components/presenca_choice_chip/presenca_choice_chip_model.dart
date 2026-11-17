import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'presenca_choice_chip_widget.dart' show PresencaChoiceChipWidget;
import 'package:flutter/material.dart';

class PresencaChoiceChipModel
    extends FlutterFlowModel<PresencaChoiceChipWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for presence_selection widget.
  FormFieldController<List<String>>? presenceSelectionValueController;
  String? get presenceSelectionValue =>
      presenceSelectionValueController?.value?.firstOrNull;
  set presenceSelectionValue(String? val) =>
      presenceSelectionValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
