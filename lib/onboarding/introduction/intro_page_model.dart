import 'package:eats_boost_mobile_app/flutter_flow/flutter_flow_theme.dart';
import 'package:eats_boost_mobile_app/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import '/onboarding/introduction/intro_page_widget.dart' show IntroPageWidget;

class IntroPageModel extends FlutterFlowModel<IntroPageWidget> {
  ///  State fields for stateful widgets in this page.
  // State field(s) for title widget.

  late PageController controller;
  late List<Widget> pages;

  int _currentPage = 0;

  void goNext() {
    if (_currentPage < pages.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Navigate to the next screen
      _currentPage = _currentPage + 1;
    }
  }

  int get currentPage => _currentPage;

  /// Initialization and disposal methods.
  @override
  void initState(BuildContext context) {
    _currentPage = 0;
  }

  @override
  void dispose() {
    controller.dispose();
  }

  void changePage(int i) {
    _currentPage = i;
  }
}
