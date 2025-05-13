import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/activate_boost_cycle_widget.dart';
import '/components/bottom_tab/bottom_tab_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'generate_offers_widget.dart' show GenerateOffersWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GenerateOffersModel extends FlutterFlowModel<GenerateOffersWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> eateries = [];
  void addToEateries(DocumentReference item) => eateries.add(item);
  void removeFromEateries(DocumentReference item) => eateries.remove(item);
  void removeAtIndexFromEateries(int index) => eateries.removeAt(index);
  void insertAtIndexInEateries(int index, DocumentReference item) =>
      eateries.insert(index, item);
  void updateEateriesAtIndex(int index, Function(DocumentReference) updateFn) =>
      eateries[index] = updateFn(eateries[index]);

  List<QRCodesRecord> qrCodes = [];
  void addToQrCodes(QRCodesRecord item) => qrCodes.add(item);
  void removeFromQrCodes(QRCodesRecord item) => qrCodes.remove(item);
  void removeAtIndexFromQrCodes(int index) => qrCodes.removeAt(index);
  void insertAtIndexInQrCodes(int index, QRCodesRecord item) =>
      qrCodes.insert(index, item);
  void updateQrCodesAtIndex(int index, Function(QRCodesRecord) updateFn) =>
      qrCodes[index] = updateFn(qrCodes[index]);

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for BottomTab component.
  late BottomTabModel bottomTabModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    bottomTabModel = createModel(context, () => BottomTabModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    bottomTabModel.dispose();
  }
}
