import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'shared/util/push.dart';

class AppWidget extends StatelessWidget {
//  final themeController = Modular.get<ThemeStore>();
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  final Push push = Push();
  @override
  Widget build(BuildContext context) {
    FirebaseAnalyticsObserver(analytics: analytics);
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
