import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../shared/models/coins_model.dart';
import '../../../../shared/util/general_functions.dart';
import '../../../../shared/util/value/const_colors.dart';
import '../../controllers/home_store.dart';

class TestTextBR extends StatelessWidget {
  final List<CoinModel> coins;
  final HomeStore controller;
  final int index;
  final GeneralFunctions genFunctions;
  const TestTextBR({
    Key? key,
    required this.index,
    required this.coins,
    required this.controller,
    required this.genFunctions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Observer(builder: (_) {
          return Text(
            "${controller.textValidat == null ? '0' : controller.textValidat}"
            " Real(s) vale(m)",
            style: TextStyle(
              color: ConstColors.colorLavenderFloral,
              fontSize: 22.0,
            ),
            textAlign: TextAlign.center,
          );
        }),
        Observer(builder: (_) {
          return Text(
            "${genFunctions.formatNumberUs(controller.valueConvertion ?? '0')} "
            "${coins[index].name?.replaceAll("/Real Brasileiro", "")}",
            style: TextStyle(
              color: ConstColors.colorLavenderFloral,
              fontSize: 22.0,
            ),
            textAlign: TextAlign.center,
          );
        })
      ],
    );
  }
}
