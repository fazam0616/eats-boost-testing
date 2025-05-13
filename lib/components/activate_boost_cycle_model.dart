import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'activate_boost_cycle_widget.dart' show ActivateBoostCycleWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActivateBoostCycleModel
    extends FlutterFlowModel<ActivateBoostCycleWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BoostCyclesRecord? boostCycle;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  QRCodesRecord? qrOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
