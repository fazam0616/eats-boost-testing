import '/backend/schema/enums/enums.dart';
import '/components/bottom_tab/bottom_tab_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'hold_to_generate_model.dart';
export 'hold_to_generate_model.dart';

class HoldToGenerateWidget extends StatefulWidget {
  const HoldToGenerateWidget({
    super.key,
    this.eateries,
    bool? isWelcomeOffer,
  }) : this.isWelcomeOffer = isWelcomeOffer ?? false;

  final List<DocumentReference>? eateries;

  /// This will be true when a user will first time adds an eatery.
  ///
  /// Also he will send only one eatery in array in params. So we will pick
  /// first item from that array and assign him an offer of level 3 for that
  /// eatery. Offer level 3 is gonna ba mandatory by an admin to create for each
  /// eatery
  final bool isWelcomeOffer;

  static String routeName = 'HoldToGenerate';
  static String routePath = '/HoldToGenerate';

  @override
  State<HoldToGenerateWidget> createState() => _HoldToGenerateWidgetState();
}

class _HoldToGenerateWidgetState extends State<HoldToGenerateWidget> {
  late HoldToGenerateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HoldToGenerateModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Screenshot_2025-01-31_at_11.21.00_AM.png',
              ).image,
            ),
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).primary,
                FlutterFlowTheme.of(context).tertiary
              ],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.87, -1.0),
              end: AlignmentDirectional(-0.87, 1.0),
            ),
          ),
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/Screenshot_2025-01-30_at_11.29.20_PM-removebg-preview_(1).png',
                          width: 199.0,
                          height: 56.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Text(
                        'Hold The Button Below To Generate Your Offers!',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontSize: 30.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/3146573.png',
                        width: 60.0,
                        height: 60.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: 85.0,
                      height: 85.0,
                      decoration: BoxDecoration(
                        color: Color(0xD1FFFFFF),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).tertiary,
                          width: 5.0,
                        ),
                      ),
                      child: Icon(
                        Icons.percent_rounded,
                        color: FlutterFlowTheme.of(context).tertiary,
                        size: 60.0,
                      ),
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
              ),
              wrapWithModel(
                model: _model.bottomTabModel,
                updateCallback: () => safeSetState(() {}),
                child: BottomTabWidget(
                  parameter: BottomTab.GenerateOffer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
