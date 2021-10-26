import 'dart:ui';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../shared/models/coins_model.dart';
import '../../../shared/util/value/const_colors.dart';

// ignore: must_be_immutable
class CardGrafic extends StatelessWidget {
  final List<CoinModel>? coins;
  final controller;

  CardGrafic({
    Key? key,
    required this.coins,
    required this.controller,
  }) : super(key: key);

/*   bool get isDesktopOrWeb =>
      Platform.isMacOS ||
      Platform.isAndroid ||
      Platform.isIOS ||
      Platform.isLinux;
 */
  @override
  Widget build(BuildContext context) {
    var data = [
      double.parse("${coins![0].bid}"),
      double.parse("${coins![0].ask}"),
      double.parse("${coins![0].high}"),
      double.parse("${coins![0].low}"),
    ];

    return Padding(
      padding: EdgeInsets.only(left: 18.0, right: 18.0),
      child: InkWell(
        splashColor: Colors.purpleAccent.withAlpha(80),
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: ConstColors.colorSpaceCadet,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: ConstColors.colorSkyMagenta,
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 2.0, //extend the shadow
                offset: Offset(
                  2.0, // Move to right 10  horizontally
                  2.0, // Move to bottom 5 Vertically
                ),
              )
            ],
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 28.0),
                Text(
                  "Variação Compra/Venda/Max/Min:",
                  style: TextStyle(
                    color: ConstColors.colorLigthGray,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 18.0),
                Sparkline(
                  data: data,
                  lineColor: ConstColors.colorLavenderFloral,
                  pointSize: 8.0,
                  pointColor: ConstColors.colorSkyMagenta,
                  enableGridLines: true,
                  averageLable: true,
                  gridLineLabelPrecision: 4,
                  gridLinelabelPrefix: " R\$ ",
                  gridLineLabelColor: ConstColors.colorLigthGray,
                  averageLine: true,
                  pointsMode: PointsMode.all,
                  fallbackHeight: 125.0,
                  fillMode: FillMode.below,
                ),
                SizedBox(height: 28.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
