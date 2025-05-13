import '/components/give_location_access_widget.dart';
import '/components/header2/header2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'location_access_denied_widget.dart' show LocationAccessDeniedWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LocationAccessDeniedModel
    extends FlutterFlowModel<LocationAccessDeniedWidget> {
  ///  Local state fields for this page.

  String? dialCode;

  ///  State fields for stateful widgets in this page.

  // Model for Header2 component.
  late Header2Model header2Model;

  @override
  void initState(BuildContext context) {
    header2Model = createModel(context, () => Header2Model());
  }

  @override
  void dispose() {
    header2Model.dispose();
  }
}
