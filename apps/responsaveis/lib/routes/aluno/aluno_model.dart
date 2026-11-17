import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/home_button/home_button_widget.dart';
import '/index.dart';
import 'aluno_widget.dart' show AlunoWidget;
import 'package:flutter/material.dart';

class AlunoModel extends FlutterFlowModel<AlunoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HomeButton component.
  late HomeButtonModel homeButtonModel;

  @override
  void initState(BuildContext context) {
    homeButtonModel = createModel(context, () => HomeButtonModel());
  }

  @override
  void dispose() {
    homeButtonModel.dispose();
  }
}
