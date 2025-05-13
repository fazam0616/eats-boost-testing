import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flip_card/flip_card.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'testtset_widget.dart' show TesttsetWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TesttsetModel extends FlutterFlowModel<TesttsetWidget> {
  ///  State fields for stateful widgets in this page.

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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerAController.dispose();
  }
}
