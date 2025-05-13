import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header2/header2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'phone_sign_in4_d_o_b_widget.dart' show PhoneSignIn4DOBWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhoneSignIn4DOBModel extends FlutterFlowModel<PhoneSignIn4DOBWidget> {
  ///  Local state fields for this page.

  String? dialCode;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for Header2 component.
  late Header2Model header2Model;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    header2Model = createModel(context, () => Header2Model());
  }

  @override
  void dispose() {
    header2Model.dispose();
  }
}
