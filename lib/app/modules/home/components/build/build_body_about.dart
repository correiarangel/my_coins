import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../../controllers/home_store.dart';
import '../cards/card_about.dart';
import '../sizebox_divisor.dart';
import 'build_header.dart';

class BuildBodyAbout extends StatelessWidget {
  final BuildContext context;
  final RateMyApp rateMyApp;
  final rateMyAppController;
  final HomeStore controller;
  const BuildBodyAbout({
    Key? key,
    required this.context,
    required this.rateMyApp,
    required this.rateMyAppController,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BuildHeader(titulo: "My Coins", context: context, screen: 'about'),
          const SizedBox(height: 30.0),
          CardAbout(
            sizeBoxDivisor: SizeBoxDivisor(),
            controller: controller,
            rateMyApp: rateMyApp,
            rateMyAppController: rateMyAppController,
          ),
          const SizedBox(height: 21.0),
        ],
      ),
    );
  }
}
