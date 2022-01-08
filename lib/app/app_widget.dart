import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'shared/util/push.dart';

class AppWidget extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  final Push push = Push();
  @override
  Widget build(BuildContext context) {
    push.initOneSignal();
    return MaterialApp(
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      debugShowCheckedModeBanner: false,
      title: 'My Coins',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'RobotoSlab',
      ),
    ).modular();
  }
}
