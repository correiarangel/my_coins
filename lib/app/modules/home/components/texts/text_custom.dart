import 'package:flutter/material.dart';

import '../../../../shared/models/coins_model.dart';
import '../../../../shared/services/format_service.dart';
import '../../../../shared/util/value/const_colors.dart';

class TextCustom extends StatelessWidget {
  final List<CoinModel> coins;
  final int index;
  final FormatService genFunctions;

  const TextCustom({
    Key? key,
    required this.index,
    required this.coins,
    required this.genFunctions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coin = coins[index];

    // Formata usando o FormatService com fallback
    final formattedValue = genFunctions.formatNumberBr(coin.bid.toString()) ?? "R\$ 0,00";

    return Text(
      "1 : ${coin.code} igual a\n$formattedValue",
      style: const TextStyle(
        color: ConstColors.colorLavenderFloral,
        fontSize: 28.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}
