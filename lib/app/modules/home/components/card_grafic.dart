import 'dart:ui';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:screenshot/screenshot.dart';

import '../../../shared/models/coins_days_model.dart';
import '../../../shared/util/value/const_colors.dart';

// ignore: must_be_immutable
class CardGrafic extends StatelessWidget {
  final ScreenshotController screenshot = ScreenshotController();
  final List<CoinDaysModel>? coinsDays;

  final String param;
  final controller;

  CardGrafic({
    Key? key,
    required this.coinsDays,
    required this.param,
    required this.controller,
  }) : super(key: key);

  List<double> data = [];
  List<double> setData(String param) {
    for (var i = 0; i < coinsDays!.length; i++) {
      if (param == 'bid') data.add(double.parse("${coinsDays![i].bid}"));
      if (param == 'ask') data.add(double.parse("${coinsDays![i].ask}"));
      if (param == 'high') data.add(double.parse("${coinsDays![i].high}"));
      if (param == 'low') data.add(double.parse("${coinsDays![i].low}"));
    }
    return data;
  }

  String getText() {
    var days = controller.days;
    days == "8" ? days = "7" : days;
    var text = "";
    if (param == 'bid') text = "Variação ultimos $days dias,\n Valor de Compra";
    if (param == 'ask') text = "Variação ultimos $days dias,\n Valor de Venda";
    if (param == 'high') text = "Variação ultimos $days dias,\n Valor Max.";
    if (param == 'low') text = "Variação ultimos $days dias,\n Valor Min.";
    return text;
  }

  @override
  Widget build(BuildContext context) {
    setData(param);

    return Padding(
      padding: EdgeInsets.only(left: 18.0, right: 18.0),
      child: InkWell(
        splashColor: Colors.purpleAccent.withAlpha(80),
        onTap: () {
          controller.changesIsNet();
          controller.fetchcoinsDays(controller.itemSelect);
        },
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
                  getText(),
                  style: TextStyle(
                    color: ConstColors.colorLigthGray,
                    fontSize: 22.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 18.0,
                    bottom: 28.0,
                    left: 28.0,
                  ),
                  child: Sparkline(
                    data: data,
                    lineColor: ConstColors.colorLavenderFloral,
                    pointSize: 10.0,
                    pointColor: ConstColors.colorSkyMagenta,
                    enableGridLines: true,
                    averageLable: true,
                    gridLinelabelPrefix: " R\$ ",
                    gridLineLabelColor: ConstColors.colorLigthGray,
                    averageLine: true,
                    pointsMode: PointsMode.all,
                    fillMode: FillMode.none,
                    enableThreshold: true,
                    kLine: ['max', 'min', 'first', 'last'],
                    gridLineAmount: 8,
                    sharpCorners: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
