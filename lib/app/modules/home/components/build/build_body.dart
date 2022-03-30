import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../../controllers/home_store.dart';
import '../../controllers/rate_my_app_controller.dart';
import 'build_body_about.dart';
import 'build_body_cotation.dart';
import 'build_body_covert.dart';

class BuildBody extends StatelessWidget {
  final BuildContext context;
  final RateMyApp rateMyApp;
  final RateMyAppController rateMyAppController;
  final HomeStore controller;

  final TextEditingController textController;

  const BuildBody({
    Key? key,
    required this.context,
    required this.rateMyApp,
    required this.rateMyAppController,
    required this.controller,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widgetReturn = Container();

    return Observer(
      builder: (context) {
        if (controller.currentIndex == 0) {
          return widgetReturn = BuildBodyCotation(
            context: context,
            controller: controller,
          );
        } else if (controller.currentIndex == 1) {
          return widgetReturn = BuildBodyCovert(
            controller: controller,
            textController: textController,
          );
        } else if (controller.currentIndex == 2) {
          return widgetReturn = BuildBodyAbout(
            context: context,
            rateMyApp: rateMyApp,
            rateMyAppController: rateMyAppController,
            controller: controller,
          );
        }
        return widgetReturn;
      },
    );
  }
}
