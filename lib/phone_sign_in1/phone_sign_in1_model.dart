import '/auth/firebase_auth/auth_util.dart';
import '/components/dial_code_widget.dart';
import '/components/header2/header2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'phone_sign_in1_widget.dart' show PhoneSignIn1Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PhoneSignIn1Model extends FlutterFlowModel<PhoneSignIn1Widget> {
  ///  Local state fields for this page.

  String? dialCode = '+1';

  ///  State fields for stateful widgets in this page.

  // Model for Header2 component.
  late Header2Model header2Model;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  final textFieldMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    header2Model = createModel(context, () => Header2Model());
  }

  @override
  void dispose() {
    header2Model.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
