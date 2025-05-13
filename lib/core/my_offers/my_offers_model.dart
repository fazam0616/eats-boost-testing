import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/bottom_tab/bottom_tab_widget.dart';
import '/components/header/header_widget.dart';
import '/components/location_check_failed_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'my_offers_widget.dart' show MyOffersWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MyOffersModel extends FlutterFlowModel<MyOffersWidget> {
  ///  Local state fields for this page.

  OffersForMeRecord? offerForMe;

  bool isOfferExpired = false;

  LatLng? latLongofEatery;

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
  // Stores action output result for [Custom Action - calculateDistance] action in Button widget.
  double? distanceOutput;
  InstantTimer? instantTimer;
  // State field(s) for TimerA widget.
  final timerAInitialTimeMs = 15000;
  int timerAMilliseconds = 15000;
  String timerAValue = StopWatchTimer.getDisplayTime(
    15000,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerAController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

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
    instantTimer?.cancel();
    timerAController.dispose();
    bottomTabModel.dispose();
  }
}
