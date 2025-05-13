import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'activate_boost_cycle_model.dart';
export 'activate_boost_cycle_model.dart';

class ActivateBoostCycleWidget extends StatefulWidget {
  const ActivateBoostCycleWidget({
    super.key,
    required this.qrDocument,
    required this.heading,
    required this.description,
    this.isButtonPressed,
  });

  final QRCodesRecord? qrDocument;
  final String? heading;
  final String? description;
  final Future Function()? isButtonPressed;

  @override
  State<ActivateBoostCycleWidget> createState() =>
      _ActivateBoostCycleWidgetState();
}

class _ActivateBoostCycleWidgetState extends State<ActivateBoostCycleWidget> {
  late ActivateBoostCycleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivateBoostCycleModel());

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
      width: MediaQuery.sizeOf(context).width * 0.85,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Color(0xFFE65C00),
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              valueOrDefault<String>(
                widget!.heading,
                'Heading',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              '${widget!.description}',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    // Create Boost Cycle

                    var boostCyclesRecordReference =
                        BoostCyclesRecord.collection.doc();
                    await boostCyclesRecordReference.set({
                      ...createBoostCyclesRecordData(
                        qrCodeRef: widget!.qrDocument?.reference,
                        eateryRef: widget!.qrDocument?.eateryRef,
                        cycleNumber: widget!.qrDocument!.currentBoostCycle + 1,
                        boostCycleExpiryDate: functions.aftrOneMonth(),
                        userRef: currentUserReference,
                      ),
                      ...mapToFirestore(
                        {
                          'creationDate': FieldValue.serverTimestamp(),
                        },
                      ),
                    });
                    _model.boostCycle = BoostCyclesRecord.getDocumentFromData({
                      ...createBoostCyclesRecordData(
                        qrCodeRef: widget!.qrDocument?.reference,
                        eateryRef: widget!.qrDocument?.eateryRef,
                        cycleNumber: widget!.qrDocument!.currentBoostCycle + 1,
                        boostCycleExpiryDate: functions.aftrOneMonth(),
                        userRef: currentUserReference,
                      ),
                      ...mapToFirestore(
                        {
                          'creationDate': DateTime.now(),
                        },
                      ),
                    }, boostCyclesRecordReference);
                    // Update QR Code

                    await widget!.qrDocument!.reference
                        .update(createQRCodesRecordData(
                      boostCycleEndDate: functions.aftrOneMonth(),
                      currentBoostCycle:
                          widget!.qrDocument!.currentBoostCycle + 1,
                      currentBoostCycleRef: _model.boostCycle?.reference,
                      offersNextGenerationDate: functions.pastDate(),
                    ));
                    // Read QR For Boost Ref
                    _model.qrOutput = await QRCodesRecord.getDocumentOnce(
                        widget!.qrDocument!.reference);
                    await actions.updateVisitsBoostAddReference(
                      _model.qrOutput,
                    );
                    Navigator.pop(context);
                    await widget.isButtonPressed?.call();

                    safeSetState(() {});
                  },
                  text: 'Activate',
                  options: FFButtonOptions(
                    width: 118.0,
                    height: 28.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF3CB438),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
