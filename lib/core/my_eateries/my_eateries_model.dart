import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/activate_boost_cycle_widget.dart';
import '/components/bottom_tab/bottom_tab_widget.dart';
import '/components/cannot_generate_offers_widget.dart';
import '/components/excess_visit_upload_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'my_eateries_widget.dart' show MyEateriesWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyEateriesModel extends FlutterFlowModel<MyEateriesWidget> {
  ///  Local state fields for this page.

  bool edit = false;

  QRCodesRecord? eateryToBeRemoved;

  String? reasonForRemovingEatery;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<VisitsRecord>? resultOfStepOne;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<OffersForMeRecord>? queryOffers;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
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
    textFieldFocusNode?.dispose();
    textController?.dispose();

    bottomTabModel.dispose();
  }

  /// Action blocks.
  Future removeEateryAndGIveFeeback(
    BuildContext context, {
    String? comment,
  }) async {
    await actions.deleteBulkOffersForMeQrCodes(
      eateryToBeRemoved?.reference,
      currentUserReference,
    );
    await actions.deleteBulkBoostCyclesForMeQrCodes(
      eateryToBeRemoved?.reference,
      currentUserReference,
    );
    await actions.removeVisitsForEatery(
      eateryToBeRemoved?.reference,
    );
    await actions.updateMoneySaveRemove(
      eateryToBeRemoved?.reference,
    );

    await eateryToBeRemoved!.reference.update({
      ...createQRCodesRecordData(
        status: QRStatus.Removed,
      ),
      ...mapToFirestore(
        {
          'userRef': FieldValue.delete(),
          'userRemovedTime': FieldValue.serverTimestamp(),
        },
      ),
    });

    await FeedbackRecord.collection.doc().set({
      ...createFeedbackRecordData(
        comments: comment,
        eateryRef: eateryToBeRemoved?.eateryRef,
        userRef: currentUserReference,
        reason: reasonForRemovingEatery,
      ),
      ...mapToFirestore(
        {
          'createdAt': FieldValue.serverTimestamp(),
        },
      ),
    });
    eateryToBeRemoved = null;
    reasonForRemovingEatery = null;
    edit = false;
  }
}
