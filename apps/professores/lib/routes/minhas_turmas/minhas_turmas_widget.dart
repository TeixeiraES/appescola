import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/empty/empty_widget.dart';
import '/backend/schema/structs/index.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'minhas_turmas_model.dart';
export 'minhas_turmas_model.dart';

class MinhasTurmasWidget extends StatefulWidget {
  const MinhasTurmasWidget({super.key});

  static String routeName = 'MinhasTurmas';
  static String routePath = '/minhasTurmas';

  @override
  State<MinhasTurmasWidget> createState() => _MinhasTurmasWidgetState();
}

class _MinhasTurmasWidgetState extends State<MinhasTurmasWidget> {
  late MinhasTurmasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MinhasTurmasModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Function() _navigate = () {};
      _model.apiAuthValidationTurmas = await AppGroup.grauTurmasCall.call(
        token: currentAuthenticationToken,
      );

      if (!(_model.apiAuthValidationTurmas?.succeeded ?? true)) {
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        _navigate =
            () => context.goNamedAuth(LoginWidget.routeName, context.mounted);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Falha na Autenticação. Por favor, faça login novamente',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).info,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }

      _navigate();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0x00FFFFFF),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
            child: Text(
              'Minhas Turmas',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.85,
                  decoration: BoxDecoration(),
                  child: FutureBuilder<ApiCallResponse>(
                    future: FFAppState()
                        .turmasQuery(
                      requestFn: () => AppGroup.grauTurmasCall.call(
                        token: currentAuthenticationToken,
                      ),
                    )
                        .then((result) {
                      _model.apiRequestCompleted = true;
                      return result;
                    }),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 128.0),
                            child: SizedBox(
                              width: 36.0,
                              height: 36.0,
                              child: SpinKitThreeBounce(
                                color: Color(0xFF01284B),
                                size: 36.0,
                              ),
                            ),
                          ),
                        );
                      }
                      final listViewGrauTurmasResponse = snapshot.data!;

                      return Builder(
                        builder: (context) {
                          final turmas = AppGroup.grauTurmasCall
                                  .grauTurma(
                                    listViewGrauTurmasResponse.jsonBody,
                                  )
                                  ?.toList() ??
                              [];
                          if (turmas.isEmpty) {
                            return EmptyWidget();
                          }

                          return RefreshIndicator(
                            color: FlutterFlowTheme.of(context).info,
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            onRefresh: () async {
                              safeSetState(() {
                                FFAppState().clearTurmasQueryCache();
                                _model.apiRequestCompleted = false;
                              });
                              await _model.waitForApiRequestCompleted();
                            },
                            child: ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                64.0,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: turmas.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 2.0),
                              itemBuilder: (context, turmasIndex) {
                                final turmasItem = turmas[turmasIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      TurmaWidget.routeName,
                                      queryParameters: {
                                        'idTurma': serializeParam(
                                          getJsonField(
                                            turmasItem,
                                            r'''$.id_turma''',
                                          ),
                                          ParamType.int,
                                        ),
                                        'nomeTurma': serializeParam(
                                          getJsonField(
                                            turmasItem,
                                            r'''$.turma''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );

                                    FFAppState().idGrauAtual =
                                        GrauTurmaStruct.maybeFromMap(
                                                turmasItem)!
                                            .idGrau
                                            .toString();
                                    FFAppState().turmaAtualNome =
                                        GrauTurmaStruct.maybeFromMap(
                                                turmasItem)!
                                            .turma;
                                    FFAppState().idTurmaAtual =
                                        GrauTurmaStruct.maybeFromMap(
                                                turmasItem)!
                                            .idTurma;
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 24.0, 16.0, 24.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                turmasItem,
                                                r'''$.turma''',
                                              )?.toString(),
                                              'Turma I vesp',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Icon(
                                              Icons.chevron_right,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ].addToStart(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
