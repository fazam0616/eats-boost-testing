import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/bottom_tab/bottom_tab_widget.dart';
import '/components/popup_delete_account_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'profile_widget.dart' show ProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  List<MoneySavedStruct> money = [];
  void addToMoney(MoneySavedStruct item) => money.add(item);
  void removeFromMoney(MoneySavedStruct item) => money.remove(item);
  void removeAtIndexFromMoney(int index) => money.removeAt(index);
  void insertAtIndexInMoney(int index, MoneySavedStruct item) =>
      money.insert(index, item);
  void updateMoneyAtIndex(int index, Function(MoneySavedStruct) updateFn) =>
      money[index] = updateFn(money[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for BottomTab component.
  late BottomTabModel bottomTabModel;

  @override
  void initState(BuildContext context) {
    bottomTabModel = createModel(context, () => BottomTabModel());
  }

  @override
  void dispose() {
    bottomTabModel.dispose();
  }
}
