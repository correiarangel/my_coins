import 'dart:developer' show log;
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../interface/push_interface.dart';
import 'error/onesignal_excepiton.dart';
import '../util/value/constants_onesinnal.dart';

class OneSignalPushService implements IPush {
  static const String _defaultUserId = '0';
  static const String _defaultRoute = '/home';

  @override
  Future<bool> initOneSignal() async {
    try {
      await _configureDebugSettings();
      await _initializeOneSignal();
      await _checkAndRequestPermissions();
      await registerUserIdInTag();
      return true;
    } on SignalException catch (err, s) {
      throw OneSignalException(message: err.message, stackTrace: s);
    } on Exception catch (err, s) {
      throw OneSignalException(message: err.toString(), stackTrace: s);
    }
  }

  Future<void> _configureDebugSettings() async {
    await OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    await OneSignal.Debug.setAlertLevel(OSLogLevel.none);
  }

  Future<void> _initializeOneSignal() async {
    OneSignal.initialize(ConstOneSingnal.appIdOneSIGNAL);
    log('APP_ID: ${ConstOneSingnal.appIdOneSIGNAL}');
  }

  Future<void> _checkAndRequestPermissions() async {
    final permission = OneSignal.Notifications.permission;
    if (!permission) {
      await changesPermissions(true);
    }
  }

  @override
  Future<bool> changesPermissions(bool fallbackToSettings) async {
    return await OneSignal.Notifications.requestPermission(fallbackToSettings);
  }

  @override
  void setNotificationOpenHardlerForeground() {
    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      _handleForegroundNotification(event);
    });
  }

  void _handleForegroundNotification(OSNotificationWillDisplayEvent event) {
    setRuoterPush(event.notification.body ?? '');
    log('Foreground notification received -> ${event.notification.smallIcon}');
    event.notification.display();
  }

  @override
  String setRuoterPush(String body) {
    debugPrint('No specific route defined');
    debugPrint('Received message: $body');
    return _defaultRoute;
  }

  void setAddClickListemer() {
    OneSignal.Notifications.addClickListener((event) {
      log('Notification clicked -> ${event.notification.smallIcon}');
    });
  }

  void removeAddClickListemer() {
    OneSignal.Notifications.removeClickListener((_) {});
  }

  @override
  Future<void> registerUserIdInTag() async {
    if (_defaultUserId.isEmpty) {
      throw OneSignalException(
        message: 'Error: User ID is empty',
        stackTrace: StackTrace.current,
      );
    }

    try {
      await _configureUserConsent();
      await _loginUser();
      await _getExternalId();
    } on SignalException catch (err) {
      throw SignalException(err.message);
    } on Exception catch (err, s) {
      throw OneSignalException(message: err.toString(), stackTrace: s);
    }
  }

  Future<void> _configureUserConsent() async {
    const requiresConsent = false;
    await OneSignal.consentRequired(requiresConsent);
    await OneSignal.consentGiven(true);
  }

  Future<void> _loginUser() async {
    await OneSignal.login(_defaultUserId);
  }

  Future<void> _getExternalId() async {
    final idExt = await OneSignal.User.getExternalId();
    log('External ID -> $idExt');
  }

  @override
  Future<bool> clearOneSignal() async {
    try {
      await OneSignal.User.removeTag(_defaultUserId);
      await OneSignal.Notifications.clearAll();
      log('OneSignal cleared successfully');
      return true;
    } on Exception catch (err, s) {
      throw OneSignalException(message: err.toString(), stackTrace: s);
    }
  }
}
