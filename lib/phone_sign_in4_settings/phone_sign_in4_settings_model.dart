import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header2/header2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'phone_sign_in4_settings_widget.dart' show PhoneSignIn4SettingsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhoneSignIn4SettingsModel
    extends FlutterFlowModel<PhoneSignIn4SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header2 component.
  late Header2Model header2Model;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;

  @override
  void initState(BuildContext context) {
    header2Model = createModel(context, () => Header2Model());
  }

  @override
  void dispose() {
    header2Model.dispose();
  }
}
