import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header2_model.dart';
export 'header2_model.dart';

class Header2Widget extends StatefulWidget {
  const Header2Widget({
    super.key,
    bool? showEditIcon,
    required this.edit,
  }) : this.showEditIcon = showEditIcon ?? false;

  final bool showEditIcon;
  final Future Function(bool? editBool)? edit;

  @override
  State<Header2Widget> createState() => _Header2WidgetState();
}

class _Header2WidgetState extends State<Header2Widget> {
  late Header2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Header2Model());

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 40.0,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Image.network(
              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eats-boost-my0f61/assets/a1etosbo6axm/EatsBoost_Logo_(Consumer)_(1)_(1).png',
              width: 100.0,
              height: 94.0,
              fit: BoxFit.cover,
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(ProfileWidget.routeName);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 40.0,
            ),
          ),
        ],
      ),
    );
  }
}
