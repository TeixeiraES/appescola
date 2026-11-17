import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'presenca_choice_chip_model.dart';
export 'presenca_choice_chip_model.dart';

class PresencaChoiceChipWidget extends StatefulWidget {
  const PresencaChoiceChipWidget({
    super.key,
    required this.componentIndexParam,
    this.initialValueParam,
  });

  final int? componentIndexParam;
  final String? initialValueParam;

  @override
  State<PresencaChoiceChipWidget> createState() =>
      _PresencaChoiceChipWidgetState();
}

class _PresencaChoiceChipWidgetState extends State<PresencaChoiceChipWidget> {
  late PresencaChoiceChipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PresencaChoiceChipModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState()
                  .presenceValues
                  .elementAtOrNull(widget.componentIndexParam!) !=
              null &&
          FFAppState()
                  .presenceValues
                  .elementAtOrNull(widget.componentIndexParam!) !=
              '') {
        FFAppState().updatePresenceValuesAtIndex(
          widget.componentIndexParam!,
          (_) => 'I',
        );
        safeSetState(() {});
      } else {
        FFAppState().addToPresenceValues('I');
        safeSetState(() {});
      }
    });

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

    return Container(
      decoration: BoxDecoration(),
      child: FlutterFlowChoiceChips(
        options: [ChipData('S'), ChipData('N')],
        onChanged: (val) async {
          safeSetState(() => _model.presenceSelectionValue = val?.firstOrNull);
          FFAppState().updatePresenceValuesAtIndex(
            widget.componentIndexParam!,
            (_) => _model.presenceSelectionValue!,
          );
          safeSetState(() {});
        },
        selectedChipStyle: ChipStyle(
          backgroundColor: FlutterFlowTheme.of(context).secondaryText,
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).info,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
          iconColor: FlutterFlowTheme.of(context).info,
          iconSize: 16.0,
          labelPadding: EdgeInsetsDirectional.fromSTEB(14.0, 8.0, 14.0, 8.0),
          elevation: 0.0,
          borderRadius: BorderRadius.circular(50.0),
        ),
        unselectedChipStyle: ChipStyle(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).secondaryText,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
          iconColor: FlutterFlowTheme.of(context).secondaryText,
          iconSize: 16.0,
          labelPadding: EdgeInsetsDirectional.fromSTEB(14.0, 8.0, 14.0, 8.0),
          elevation: 0.0,
          borderRadius: BorderRadius.circular(50.0),
        ),
        chipSpacing: 8.0,
        rowSpacing: 8.0,
        multiselect: false,
        initialized: _model.presenceSelectionValue != null,
        alignment: WrapAlignment.start,
        controller: _model.presenceSelectionValueController ??=
            FormFieldController<List<String>>(
          [widget.initialValueParam!],
        ),
        wrapped: true,
      ),
    );
  }
}
