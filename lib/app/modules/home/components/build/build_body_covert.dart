import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../shared/util/value/const_colors.dart';
import '../../controllers/home_store.dart';
import '../cards/card_coin_convert.dart';
import '../circular_progress.dart';
import 'build_header.dart';
import 'isinternet_build.dart';

class BuildBodyCovert extends StatelessWidget {
  final HomeStore controller;
  final TextEditingController textController;
  const BuildBodyCovert({
    Key? key,
    required this.textController,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenshot = ScreenshotController();
    controller.changesIsNet();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BuildHeader(
            titulo: "My Coins",
            context: context,
            screen: 'convert',
          ),
          SizedBox(height: 28.0),
          Text(
            "Converter Moeda",
            style: TextStyle(
                color: ConstColors.colorDarkBlueGray,
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 30.0),
          Observer(
            builder: (context) {
              if (controller.coins?.error != null) {
                return IsIneternetBuild(
                  controller: controller,
                );
              } else if (controller.coins?.value == null) {
                return CircularProgress();
              } else {
                //controller.changesTextValidat('0');
                return Screenshot(
                  controller: screenshot,
                  child: CardCoinConvert(
                    coins: controller.coins?.value,
                    index: 0,
                    controller: controller,
                    screenshot: screenshot,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
