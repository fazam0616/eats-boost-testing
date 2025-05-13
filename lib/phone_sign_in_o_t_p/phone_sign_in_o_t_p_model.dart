import '/auth/firebase_auth/auth_util.dart';
import '/components/header2/header2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'phone_sign_in_o_t_p_widget.dart' show PhoneSignInOTPWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhoneSignInOTPModel extends FlutterFlowModel<PhoneSignInOTPWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header2 component.
  late Header2Model header2Model;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    header2Model = createModel(context, () => Header2Model());
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    header2Model.dispose();
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
