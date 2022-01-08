import 'dart:io';

import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../interface/push_interface.dart';
import 'value/constants_onesinnal.dart';

class Push implements IPush {
  @override
  Future<String> initOneSignal() async {
    var _respInitPush = ConstOneSingnal.respNull;
    try {
      OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
      OneSignal.shared.setAppId(ConstOneSingnal.appIdOneSIGNAL);

      await changesPermissions();
      await registerUserIdInTag();
      await setNotificationOpHandler();
      await setNotificationOpenHardler();
      //setNotificationWillShowInForeground();
      _respInitPush = ConstOneSingnal.initOneSing;
    } on SignalException catch (err) {
      _respInitPush = "${ConstOneSingnal.errorPush} : $err";
    } on Exception catch (err) {
      _respInitPush = "${ConstOneSingnal.errorPush} : $err";
    }
    return _respInitPush;
  }

  @override
  Future<bool> changesPermissions() async {
    var isPermission;
    var isAccepted;
    var testPermissions = false;
    isPermission = await OneSignal.shared
        .promptUserForPushNotificationPermission(fallbackToSettings: true);
    isAccepted = await OneSignal.shared
        .promptUserForPushNotificationPermission()
        .then((accepted) async {
      debugPrint(">>> APP_ID_ONESIGNAL Accepted permission: $accepted");
    });

    if (isPermission && isAccepted) testPermissions = true;

    return testPermissions;
  }

  @override
  Future<void> setNotificationOpHandler() async {
    await setNotificationOpenHardler();
  }

  @override
  Future setNotificationOpenHardler() async {
    return OneSignal.shared.setNotificationOpenedHandler((result) async {
      await setRuoterPush(body: result.notification.body.toString());
    });
  }

  @override
  Future<String> setRuoterPush({
    required String body,
  }) async {
    debugPrint('SEM ROTA DEFINIDA ###');
    debugPrint('Mensagem Recebida: $body');
    return "/home";
  }

  @override
  Future<String> registerUserIdInTag() async {
    var _userId = "0";
    var _respTag = ConstOneSingnal.respNull;
    if (_userId.isNotEmpty) {
      var _requiresConsent =
          await OneSignal.shared.requiresUserPrivacyConsent();

      OneSignal.shared.consentGranted(_requiresConsent);

      OneSignal.shared.setExternalUserId(_userId);
      OneSignal.shared.sendTag(_userId, _userId);
      //OneSignal.shared.setEmail(email: _email);
      _respTag = ConstOneSingnal.registerIdUser;
    } else {
      _respTag = ConstOneSingnal.idUserNull;
      debugPrint(_respTag);
    }
    return _respTag;
  }

  @override
  Future<String> removeUser() async {
    final _userId = '0'; //= await _sharedController.getUserId();
    var respRemoved = ConstOneSingnal.respNull;
    try {
      OneSignal.shared.removeExternalUserId();
      OneSignal.shared.deleteTag(_userId);
      //OneSignal.shared.logoutEmail();
      respRemoved = ConstOneSingnal.signalRemovedIdUser;
    } on Exception catch (err) {
      respRemoved = "${ConstOneSingnal.signalRemovedIdError} : $err";
    }
    return respRemoved;
  }
}
