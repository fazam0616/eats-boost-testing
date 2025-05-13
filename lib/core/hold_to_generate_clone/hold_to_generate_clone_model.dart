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
import 'hold_to_generate_clone_widget.dart' show HoldToGenerateCloneWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HoldToGenerateCloneModel
    extends FlutterFlowModel<HoldToGenerateCloneWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getEateriesFromQrCodes] action in HoldableButton widget.
  List<EateriesRecord>? eatriesOutput;
  // Model for BottomTab component.
  late BottomTabModel bottomTabModel;

  @override
  void initState(BuildContext context) {
    bottomTabModel = createModel(context, () => BottomTabModel());
  }

  @override
  void dispose() {
    bottomTabModel.dispose();
  }
}
