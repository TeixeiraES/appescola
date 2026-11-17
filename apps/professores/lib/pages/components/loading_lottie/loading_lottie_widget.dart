import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'loading_lottie_model.dart';
export 'loading_lottie_model.dart';

class LoadingLottieWidget extends StatefulWidget {
  const LoadingLottieWidget({super.key});

  @override
  State<LoadingLottieWidget> createState() => _LoadingLottieWidgetState();
}

class _LoadingLottieWidgetState extends State<LoadingLottieWidget> {
  late LoadingLottieModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingLottieModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(),
        child: Lottie.asset(
          'assets/jsons/2yRJJ53VPK.json',
          width: 100.0,
          height: 100.0,
          fit: BoxFit.contain,
          animate: true,
        ),
      ),
    );
  }
}
