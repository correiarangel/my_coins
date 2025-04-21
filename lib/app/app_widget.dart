import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'shared/interface/push_interface.dart';
import 'shared/services/Onesignal_push_service.dart';


class AppWidget extends StatelessWidget {
//  final themeController = Modular.get<ThemeStore>();
  //static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  final IPush push = OneSignalPushService();
  @override
  Widget build(BuildContext context) {
   // FirebaseAnalyticsObserver(analytics: analytics);
    push.initOneSignal();
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: 'My Coins',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'RobotoSlab',
      ),
    );
  }
}
