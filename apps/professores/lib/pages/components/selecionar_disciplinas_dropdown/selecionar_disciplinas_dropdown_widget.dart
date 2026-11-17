import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'selecionar_disciplinas_dropdown_model.dart';
export 'selecionar_disciplinas_dropdown_model.dart';

class SelecionarDisciplinasDropdownWidget extends StatefulWidget {
  const SelecionarDisciplinasDropdownWidget({super.key});

  @override
  State<SelecionarDisciplinasDropdownWidget> createState() =>
      _SelecionarDisciplinasDropdownWidgetState();
}

class _SelecionarDisciplinasDropdownWidgetState
    extends State<SelecionarDisciplinasDropdownWidget> {
  late SelecionarDisciplinasDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelecionarDisciplinasDropdownModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
          child: Text(
            'Disciplina',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        ),
        FutureBuilder<ApiCallResponse>(
          future: AppGroup.getDisciplinasCall.call(
            token: currentAuthenticationToken,
            grau: FFAppState().idGrauAtual,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 36.0,
                  height: 36.0,
                  child: SpinKitThreeBounce(
                    color: Color(0xFF01284B),
                    size: 36.0,
                  ),
                ),
              );
            }
            final dropDownGetDisciplinasResponse = snapshot.data!;

            return FlutterFlowDropDown<int>(
              controller: _model.dropDownValueController ??=
                  FormFieldController<int>(null),
              options: List<int>.from(AppGroup.getDisciplinasCall.idDisciplina(
                dropDownGetDisciplinasResponse.jsonBody,
              )!),
              optionLabels: AppGroup.getDisciplinasCall.descDisciplia(
                dropDownGetDisciplinasResponse.jsonBody,
              )!,
              onChanged: (val) =>
                  safeSetState(() => _model.dropDownValue = val),
              width: MediaQuery.sizeOf(context).width * 1.0,
              maxHeight: 300.0,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
              hintText: 'Selecione a Disciplina',
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              elevation: 2.0,
              borderColor: Colors.transparent,
              borderWidth: 0.0,
              borderRadius: 8.0,
              margin: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
              hidesUnderline: true,
              isOverButton: false,
              isSearchable: false,
              isMultiSelect: false,
            );
          },
        ),
      ].divide(SizedBox(height: 8.0)),
    );
  }
}
