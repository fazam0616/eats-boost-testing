import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Screenshot_2025-01-31_at_2.43.37_PM.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Launch': ParameterData.none(),
  'myOffers': ParameterData.none(),
  'myEateries': ParameterData.none(),
  'generateOffers': ParameterData.none(),
  'First_Time_Login_Eateries': ParameterData.none(),
  'ScanQRCode': ParameterData.none(),
  'EateryAdded': (data) async => ParameterData(
        allParams: {
          'eatery': await getDocumentParameter<EateriesRecord>(
              data, 'eatery', EateriesRecord.fromSnapshot),
          'scanQR': await getDocumentParameter<QRCodesRecord>(
              data, 'scanQR', QRCodesRecord.fromSnapshot),
        },
      ),
  'LogVisit': (data) async => ParameterData(
        allParams: {
          'qrCode': await getDocumentParameter<QRCodesRecord>(
              data, 'qrCode', QRCodesRecord.fromSnapshot),
        },
      ),
  'Profile': ParameterData.none(),
  'MyProfileRequestReceived': ParameterData.none(),
  'eateryRequestForm': ParameterData.none(),
  'MyProfileRequestReceivedConfirm': ParameterData.none(),
  'profileFeedForm': ParameterData.none(),
  'profileMessages': ParameterData.none(),
  'First_Time_Login_Generate_Offers': ParameterData.none(),
  'First_Time_Login_My_Offers': ParameterData.none(),
  'testtset': (data) async => ParameterData(
        allParams: {
          'isWelcomeOffer': getParameter<bool>(data, 'isWelcomeOffer'),
        },
      ),
  'Signup': ParameterData.none(),
  'Login_Email': ParameterData.none(),
  'Signup_Loginn': ParameterData.none(),
  'WelcomePage': ParameterData.none(),
  'HoldToGenerate': (data) async => ParameterData(
        allParams: {
          'isWelcomeOffer': getParameter<bool>(data, 'isWelcomeOffer'),
        },
      ),
  'ClaimOffersC': (data) async => ParameterData(
        allParams: {
          'isWelcomeOffer': getParameter<bool>(data, 'isWelcomeOffer'),
        },
      ),
  'WelcomeOffer': ParameterData.none(),
  'WelcomeOfferClaim': ParameterData.none(),
  'HoldToGenerateClone': (data) async => ParameterData(
        allParams: {
          'isWelcomeOffer': getParameter<bool>(data, 'isWelcomeOffer'),
        },
      ),
  'eateriesInfo': (data) async => ParameterData(
        allParams: {
          'qrCode': await getDocumentParameter<QRCodesRecord>(
              data, 'qrCode', QRCodesRecord.fromSnapshot),
          'eatery': await getDocumentParameter<EateriesRecord>(
              data, 'eatery', EateriesRecord.fromSnapshot),
        },
      ),
  'PhoneSignIn1': ParameterData.none(),
  'PhoneSignInOTP': ParameterData.none(),
  'PhoneSignIn3Name': ParameterData.none(),
  'PhoneSignIn4DOB': ParameterData.none(),
  'LocationAccessDenied': ParameterData.none(),
  'PhoneSignIn4Settings': ParameterData.none(),
  'test': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
