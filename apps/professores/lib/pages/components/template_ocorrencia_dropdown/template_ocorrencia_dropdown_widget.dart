import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'template_ocorrencia_dropdown_model.dart';
export 'template_ocorrencia_dropdown_model.dart';

class TemplateOcorrenciaDropdownWidget extends StatefulWidget {
  const TemplateOcorrenciaDropdownWidget({super.key});

  @override
  State<TemplateOcorrenciaDropdownWidget> createState() =>
      _TemplateOcorrenciaDropdownWidgetState();
}

class _TemplateOcorrenciaDropdownWidgetState
    extends State<TemplateOcorrenciaDropdownWidget> {
  late TemplateOcorrenciaDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TemplateOcorrenciaDropdownModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder<ApiCallResponse>(
          future: AppGroup.templateOcorrenciaAnotacaoCall.call(
            token: currentAuthenticationToken,
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
            final dropDownTemplateOcorrenciaAnotacaoResponse = snapshot.data!;

            return FlutterFlowDropDown<int>(
              controller: _model.dropDownValueController ??=
                  FormFieldController<int>(null),
              options: List<int>.from(
                  AppGroup.templateOcorrenciaAnotacaoCall.templatesId(
                dropDownTemplateOcorrenciaAnotacaoResponse.jsonBody,
              )!),
              optionLabels: AppGroup.templateOcorrenciaAnotacaoCall.desc(
                dropDownTemplateOcorrenciaAnotacaoResponse.jsonBody,
              )!,
              onChanged: (val) =>
                  safeSetState(() => _model.dropDownValue = val),
              width: MediaQuery.sizeOf(context).width * 1.0,
              maxHeight: 500.0,
              searchHintTextStyle: FlutterFlowTheme.of(context)
                  .labelMedium
                  .override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
              searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
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
              hintText: 'Selecione o Tipo',
              searchHintText: 'Pesquisar Tipo',
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
              isSearchable: true,
              isMultiSelect: false,
            );
          },
        ),
      ].divide(SizedBox(height: 8.0)),
    );
  }
}
