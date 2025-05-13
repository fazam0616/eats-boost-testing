import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_model.dart';
export 'header_model.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    super.key,
    bool? showEditIcon,
    required this.edit,
    this.infoType,
  }) : this.showEditIcon = showEditIcon ?? false;

  final bool showEditIcon;
  final Future Function(bool? editBool)? edit;
  final InfoTypes? infoType;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  late HeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderModel());

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
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(ProfileWidget.routeName);
                },
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(FirstTimeLoginEateriesWidget.routeName);
                },
                child: Icon(
                  Icons.info,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              if (widget!.showEditIcon)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await widget.edit?.call(
                      true,
                    );
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
            ].divide(SizedBox(width: 20.0)),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Image.asset(
              'assets/images/EatsBoost_Logo_(Consumer)_(1)_(1).png',
              width: 100.0,
              height: 94.0,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(ProfileWidget.routeName);
                },
                child: Icon(
                  Icons.person,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20.0,
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (widget!.infoType == InfoTypes.Eatery) {
                    context.pushNamed(FirstTimeLoginEateriesWidget.routeName);
                  } else if (widget!.infoType == InfoTypes.MyOffers) {
                    context.pushNamed(FirstTimeLoginMyOffersWidget.routeName);
                  } else if (widget!.infoType == InfoTypes.GenerateOffers) {
                    context.pushNamed(
                        FirstTimeLoginGenerateOffersWidget.routeName);
                  } else {
                    context.pushNamed(FirstTimeLoginEateriesWidget.routeName);
                  }
                },
                child: Icon(
                  Icons.info,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20.0,
                ),
              ),
              if (widget!.showEditIcon)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await widget.edit?.call(
                      true,
                    );
                  },
                  child: Icon(
                    Icons.edit,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 20.0,
                  ),
                ),
            ].divide(SizedBox(width: 20.0)),
          ),
        ],
      ),
    );
  }
}
