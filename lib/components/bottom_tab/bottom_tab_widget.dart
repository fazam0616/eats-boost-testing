import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_tab_model.dart';
export 'bottom_tab_model.dart';

class BottomTabWidget extends StatefulWidget {
  const BottomTabWidget({
    super.key,
    required this.parameter,
    int? hieght,
  }) : this.hieght = hieght ?? 100;

  final BottomTab? parameter;
  final int hieght;

  @override
  State<BottomTabWidget> createState() => _BottomTabWidgetState();
}

class _BottomTabWidgetState extends State<BottomTabWidget> {
  late BottomTabModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomTabModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget!.hieght.toDouble(),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  MyOffersWidget.routeName,
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
              child: Icon(
                Icons.percent_rounded,
                color: widget!.parameter == BottomTab.MyOffers
                    ? FlutterFlowTheme.of(context).tertiary
                    : FlutterFlowTheme.of(context).primaryText,
                size: 40.0,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  GenerateOffersWidget.routeName,
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
              child: Container(
                width: 70.0,
                height: 70.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  valueOrDefault<String>(
                    widget!.parameter == BottomTab.GenerateOffer
                        ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eats-boost-my0f61/assets/3q80zfsh11ac/EatsBoost_Logo_(Consumer).png'
                        : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eats-boost-my0f61/assets/zl66pln2izd7/EatsBoost_Logo_(General).png',
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eats-boost-my0f61/assets/zl66pln2izd7/EatsBoost_Logo_(General).png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  MyEateriesWidget.routeName,
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
              child: Icon(
                Icons.restaurant,
                color: widget!.parameter == BottomTab.Eateries
                    ? FlutterFlowTheme.of(context).tertiary
                    : FlutterFlowTheme.of(context).primaryText,
                size: 40.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
