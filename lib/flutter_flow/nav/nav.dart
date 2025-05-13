import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? MyOffersWidget() : LaunchWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? MyOffersWidget() : LaunchWidget(),
        ),
        FFRoute(
          name: LaunchWidget.routeName,
          path: LaunchWidget.routePath,
          builder: (context, params) => LaunchWidget(),
        ),
        FFRoute(
          name: MyOffersWidget.routeName,
          path: MyOffersWidget.routePath,
          builder: (context, params) => MyOffersWidget(),
        ),
        FFRoute(
          name: MyEateriesWidget.routeName,
          path: MyEateriesWidget.routePath,
          builder: (context, params) => MyEateriesWidget(),
        ),
        FFRoute(
          name: GenerateOffersWidget.routeName,
          path: GenerateOffersWidget.routePath,
          builder: (context, params) => GenerateOffersWidget(),
        ),
        FFRoute(
          name: FirstTimeLoginEateriesWidget.routeName,
          path: FirstTimeLoginEateriesWidget.routePath,
          builder: (context, params) => FirstTimeLoginEateriesWidget(),
        ),
        FFRoute(
          name: ScanQRCodeWidget.routeName,
          path: ScanQRCodeWidget.routePath,
          builder: (context, params) => ScanQRCodeWidget(),
        ),
        FFRoute(
          name: EateryAddedWidget.routeName,
          path: EateryAddedWidget.routePath,
          asyncParams: {
            'eatery': getDoc(['Eateries'], EateriesRecord.fromSnapshot),
            'scanQR': getDoc(['QR_Codes'], QRCodesRecord.fromSnapshot),
          },
          builder: (context, params) => EateryAddedWidget(
            eatery: params.getParam(
              'eatery',
              ParamType.Document,
            ),
            scanQR: params.getParam(
              'scanQR',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: LogVisitWidget.routeName,
          path: LogVisitWidget.routePath,
          asyncParams: {
            'qrCode': getDoc(['QR_Codes'], QRCodesRecord.fromSnapshot),
          },
          builder: (context, params) => LogVisitWidget(
            qrCode: params.getParam(
              'qrCode',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: MyProfileRequestReceivedWidget.routeName,
          path: MyProfileRequestReceivedWidget.routePath,
          builder: (context, params) => MyProfileRequestReceivedWidget(),
        ),
        FFRoute(
          name: EateryRequestFormWidget.routeName,
          path: EateryRequestFormWidget.routePath,
          builder: (context, params) => EateryRequestFormWidget(),
        ),
        FFRoute(
          name: MyProfileRequestReceivedConfirmWidget.routeName,
          path: MyProfileRequestReceivedConfirmWidget.routePath,
          builder: (context, params) => MyProfileRequestReceivedConfirmWidget(),
        ),
        FFRoute(
          name: ProfileFeedFormWidget.routeName,
          path: ProfileFeedFormWidget.routePath,
          builder: (context, params) => ProfileFeedFormWidget(),
        ),
        FFRoute(
          name: ProfileMessagesWidget.routeName,
          path: ProfileMessagesWidget.routePath,
          builder: (context, params) => ProfileMessagesWidget(),
        ),
        FFRoute(
          name: FirstTimeLoginGenerateOffersWidget.routeName,
          path: FirstTimeLoginGenerateOffersWidget.routePath,
          builder: (context, params) => FirstTimeLoginGenerateOffersWidget(),
        ),
        FFRoute(
          name: FirstTimeLoginMyOffersWidget.routeName,
          path: FirstTimeLoginMyOffersWidget.routePath,
          builder: (context, params) => FirstTimeLoginMyOffersWidget(),
        ),
        FFRoute(
          name: TesttsetWidget.routeName,
          path: TesttsetWidget.routePath,
          builder: (context, params) => TesttsetWidget(
            isWelcomeOffer: params.getParam(
              'isWelcomeOffer',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: SignupWidget.routeName,
          path: SignupWidget.routePath,
          builder: (context, params) => SignupWidget(),
        ),
        FFRoute(
          name: LoginEmailWidget.routeName,
          path: LoginEmailWidget.routePath,
          builder: (context, params) => LoginEmailWidget(),
        ),
        FFRoute(
          name: SignupLoginnWidget.routeName,
          path: SignupLoginnWidget.routePath,
          builder: (context, params) => SignupLoginnWidget(),
        ),
        FFRoute(
          name: WelcomePageWidget.routeName,
          path: WelcomePageWidget.routePath,
          builder: (context, params) => WelcomePageWidget(),
        ),
        FFRoute(
          name: HoldToGenerateWidget.routeName,
          path: HoldToGenerateWidget.routePath,
          builder: (context, params) => HoldToGenerateWidget(
            eateries: params.getParam<DocumentReference>(
              'eateries',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['Eateries'],
            ),
            isWelcomeOffer: params.getParam(
              'isWelcomeOffer',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ClaimOffersCWidget.routeName,
          path: ClaimOffersCWidget.routePath,
          builder: (context, params) => ClaimOffersCWidget(
            eateries: params.getParam<DocumentReference>(
              'eateries',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['Eateries'],
            ),
            isWelcomeOffer: params.getParam(
              'isWelcomeOffer',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WelcomeOfferWidget.routeName,
          path: WelcomeOfferWidget.routePath,
          builder: (context, params) => WelcomeOfferWidget(),
        ),
        FFRoute(
          name: WelcomeOfferClaimWidget.routeName,
          path: WelcomeOfferClaimWidget.routePath,
          builder: (context, params) => WelcomeOfferClaimWidget(),
        ),
        FFRoute(
          name: HoldToGenerateCloneWidget.routeName,
          path: HoldToGenerateCloneWidget.routePath,
          asyncParams: {
            'qrCodes': getDocList(['QR_Codes'], QRCodesRecord.fromSnapshot),
          },
          builder: (context, params) => HoldToGenerateCloneWidget(
            isWelcomeOffer: params.getParam(
              'isWelcomeOffer',
              ParamType.bool,
            ),
            qrCodes: params.getParam<QRCodesRecord>(
              'qrCodes',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: EateriesInfoWidget.routeName,
          path: EateriesInfoWidget.routePath,
          asyncParams: {
            'qrCode': getDoc(['QR_Codes'], QRCodesRecord.fromSnapshot),
            'eatery': getDoc(['Eateries'], EateriesRecord.fromSnapshot),
          },
          builder: (context, params) => EateriesInfoWidget(
            qrCode: params.getParam(
              'qrCode',
              ParamType.Document,
            ),
            eatery: params.getParam(
              'eatery',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: PhoneSignIn1Widget.routeName,
          path: PhoneSignIn1Widget.routePath,
          builder: (context, params) => PhoneSignIn1Widget(),
        ),
        FFRoute(
          name: PhoneSignInOTPWidget.routeName,
          path: PhoneSignInOTPWidget.routePath,
          builder: (context, params) => PhoneSignInOTPWidget(),
        ),
        FFRoute(
          name: PhoneSignIn3NameWidget.routeName,
          path: PhoneSignIn3NameWidget.routePath,
          builder: (context, params) => PhoneSignIn3NameWidget(),
        ),
        FFRoute(
          name: PhoneSignIn4DOBWidget.routeName,
          path: PhoneSignIn4DOBWidget.routePath,
          builder: (context, params) => PhoneSignIn4DOBWidget(),
        ),
        FFRoute(
          name: LocationAccessDeniedWidget.routeName,
          path: LocationAccessDeniedWidget.routePath,
          builder: (context, params) => LocationAccessDeniedWidget(),
        ),
        FFRoute(
          name: PhoneSignIn4SettingsWidget.routeName,
          path: PhoneSignIn4SettingsWidget.routePath,
          builder: (context, params) => PhoneSignIn4SettingsWidget(),
        ),
        FFRoute(
          name: TestWidget.routeName,
          path: TestWidget.routePath,
          builder: (context, params) => TestWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/launch';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Screenshot_2025-01-31_at_2.43.37_PM.png',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
