import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'loading_card_model.dart';
export 'loading_card_model.dart';

class LoadingCardWidget extends StatefulWidget {
  const LoadingCardWidget({super.key});

  @override
  State<LoadingCardWidget> createState() => _LoadingCardWidgetState();
}

class _LoadingCardWidgetState extends State<LoadingCardWidget>
    with TickerProviderStateMixin {
  late LoadingCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingCardModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1600.0.ms,
            color: FlutterFlowTheme.of(context).primaryBackground,
            angle: 0.524,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.46,
        height: MediaQuery.sizeOf(context).height * 0.18,
        constraints: BoxConstraints(
          maxHeight: 200.0,
        ),
        decoration: BoxDecoration(
          color: Color(0xD0A3A4A5),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.5,
                height: MediaQuery.sizeOf(context).height * 0.18,
                constraints: BoxConstraints(
                  maxHeight: 200.0,
                ),
                decoration: BoxDecoration(),
              ),
            ),
          ],
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
