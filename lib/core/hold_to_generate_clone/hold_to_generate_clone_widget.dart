import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/bottom_tab/bottom_tab_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'hold_to_generate_clone_model.dart';
export 'hold_to_generate_clone_model.dart';

class HoldToGenerateCloneWidget extends StatefulWidget {
  const HoldToGenerateCloneWidget({
    super.key,
    bool? isWelcomeOffer,
    required this.qrCodes,
  }) : this.isWelcomeOffer = isWelcomeOffer ?? false;

  /// This will be true when a user will first time adds an eatery.
  ///
  /// Also he will send only one eatery in array in params. So we will pick
  /// first item from that array and assign him an offer of level 3 for that
  /// eatery. Offer level 3 is gonna ba mandatory by an admin to create for each
  /// eatery
  final bool isWelcomeOffer;

  final List<QRCodesRecord>? qrCodes;

  static String routeName = 'HoldToGenerateClone';
  static String routePath = '/HoldToGenerateClone';

  @override
  State<HoldToGenerateCloneWidget> createState() =>
      _HoldToGenerateCloneWidgetState();
}

class _HoldToGenerateCloneWidgetState extends State<HoldToGenerateCloneWidget> {
  late HoldToGenerateCloneModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HoldToGenerateCloneModel());

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
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Screenshot_2025-01-30_at_11.29.20_PM-removebg-preview_(1).png',
                            width: 100.0,
                            height: 90.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      StreamBuilder<EateriesRecord>(
                        stream: EateriesRecord.getDocument(
                            widget!.qrCodes!.firstOrNull!.eateryRef!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }

                          final containerEateriesRecord = snapshot.data!;

                          return Container(
                            height: MediaQuery.sizeOf(context).height * 0.7,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 20.0, 10.0),
                              child: custom_widgets.HoldableButton(
                                width: double.infinity,
                                height: double.infinity,
                                isWelcomeOffer: widget!.isWelcomeOffer,
                                eateryName: containerEateriesRecord.name,
                                eateryLogo: containerEateriesRecord.logoURL,
                                onHoldComplete: () async {
                                  if (widget!.isWelcomeOffer) {
                                    await actions.createWelcomeOfferForMeQrCode(
                                      widget!.qrCodes!.firstOrNull!,
                                      currentUserReference!,
                                    );
                                  } else {
                                    await actions.createOffersForMeQrCodes(
                                      currentUserReference,
                                      widget!.qrCodes?.toList(),
                                    );
                                  }

                                  _model.eatriesOutput =
                                      await actions.getEateriesFromQrCodes(
                                    widget!.qrCodes?.toList(),
                                  );

                                  context.goNamed(
                                    ClaimOffersCWidget.routeName,
                                    queryParameters: {
                                      'eateries': serializeParam(
                                        _model.eatriesOutput
                                            ?.map((e) => e.reference)
                                            .toList(),
                                        ParamType.DocumentReference,
                                        isList: true,
                                      ),
                                      'isWelcomeOffer': serializeParam(
                                        widget!.isWelcomeOffer,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );

                                  safeSetState(() {});
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.bottomTabModel,
                updateCallback: () => safeSetState(() {}),
                child: BottomTabWidget(
                  parameter: BottomTab.GenerateOffer,
                  hieght: 75,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
