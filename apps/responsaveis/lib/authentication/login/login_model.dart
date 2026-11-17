import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.
  /// controle de logica de mascara
  bool? isCPF = true;

  bool test = true;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for cpf widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfTextController;
  late MaskTextInputFormatter cpfMask;
  String? Function(BuildContext, String?)? cpfTextControllerValidator;
  String? _cpfTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Insira um CPF válido';
    }

    if (val.length < 14) {
      return 'Insira um CPF válido';
    }

    return null;
  }

  // State field(s) for cnpj widget.
  FocusNode? cnpjFocusNode;
  TextEditingController? cnpjTextController;
  late MaskTextInputFormatter cnpjMask;
  String? Function(BuildContext, String?)? cnpjTextControllerValidator;
  String? _cnpjTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Insira um CNPJ válido';
    }

    if (val.length < 18) {
      return 'Insira um CNPJ válido';
    }

    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Backend Call - API (getToken)] action in Button widget.
  ApiCallResponse? getAuthToken;

  @override
  void initState(BuildContext context) {
    cpfTextControllerValidator = _cpfTextControllerValidator;
    cnpjTextControllerValidator = _cnpjTextControllerValidator;
    passwordVisibility = false;
  }

  @override
  void dispose() {
    cpfFocusNode?.dispose();
    cpfTextController?.dispose();

    cnpjFocusNode?.dispose();
    cnpjTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
