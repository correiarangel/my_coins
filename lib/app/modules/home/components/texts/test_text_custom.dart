import 'package:flutter/material.dart';

import '../../../../shared/models/coins_model.dart';
import '../../../../shared/util/general_functions.dart';
import '../../../../shared/util/value/const_colors.dart';

class TestTextCustom extends StatelessWidget {
  final List<CoinModel> coins;
  final int index;
  final GeneralFunctions genFunctions;
  const TestTextCustom({
    Key? key,
    required this.index,
    required this.coins,
    required this.genFunctions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? text;
    coins[index].code == "BTC"
        ? text = "R\$ ${coins[index].bid}"
        : text = "R\$ ${genFunctions.formatNumberBr("${coins[index].bid}")}";

    return Text(
      "1 : ${coins[index].code} igual a\n"
      " $text",
      style: TextStyle(
        color: ConstColors.colorLavenderFloral,
        fontSize: 28.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}
