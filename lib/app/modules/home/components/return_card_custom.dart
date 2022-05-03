import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:screenshot/screenshot.dart';

import '../controllers/home_store.dart';
import 'build/isinternet_build.dart';
import 'cards/card_custom.dart';
import 'circular_progress.dart';

class ReturnCardCuston extends StatelessWidget {
  final HomeStore controller;

  const ReturnCardCuston({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenshot = ScreenshotController();
    return Observer(
      builder: (context) {
        if (controller.coins?.error != null ||  controller.isNet == false) {
          return IsIneternetBuild(controller: controller);
        } else if (controller.coins?.value == null) {
          return CircularProgress();
        } else {
          var listCoins = controller.coins?.value;

          return Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              bottom: 20.0,
            ),
            child: Screenshot(
              controller: screenshot,
              child: CardCustom(
                screenshot: screenshot,
                coins: listCoins ?? [],
                index: 0,
                store: controller,
              ),
            ),
          );
        }
      },
    );
  }
}
