import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../shared/models/coins_model.dart';
import '../../../../shared/util/general_functions.dart';
import '../../../../shared/util/value/const_colors.dart';
import '../../controllers/home_store.dart';

class TestCoinsText extends StatelessWidget {
  final List<CoinModel> coins;
  final int index;
  final HomeStore controller;
  final GeneralFunctions genFunctions;
  const TestCoinsText({
    Key? key,
    required this.controller,
    required this.coins,
    required this.index,
    required this.genFunctions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      String? text = '';
      coins[index].code == "BTC"
          ? text = "R\$ ${controller.valueConvertion!}"
          : text = genFunctions.formatNumberBr(controller.valueConvertion!);
      return Text(
        "${controller.textValidat == null ? '0' : controller.textValidat}"
        ", ${coins[index].name?.replaceAll("/Real Brasileiro", "")}"
        " vale(m)\n "
        " $text "
        "Real(s)",
        style: TextStyle(
          color: ConstColors.colorLavenderFloral,
          fontSize: 22.0,
        ),
        textAlign: TextAlign.center,
      );
    });
  }
}
