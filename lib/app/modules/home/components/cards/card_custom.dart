import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../shared/models/coins_model.dart';
import '../../../../shared/util/general_functions.dart';
import '../../../../shared/util/value/const_colors.dart';
import '../sizebox_divisor.dart';
import '../texts/test_text_custom.dart';

class CardCustom extends StatelessWidget {
  final GeneralFunctions genFunctions = Modular.get();
  final ScreenshotController screenshot;
  final List<CoinModel>? coins;
  final int index;
  final controller;

  CardCustom({
    Key? key,
    required this.screenshot,
    required this.coins,
    required this.index,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = genFunctions.toBrazilTime(
      coins?[index].createDate.toString(),
    );
    var priceCoin = "${coins?[index].bid}";
    controller.changesPriceCoin(priceCoin);

    return Padding(
      padding: EdgeInsets.only(left: 18.0, right: 18.0),
      child: InkWell(
        splashColor: Colors.purpleAccent.withAlpha(80),
        onTap: () {
          controller.changesIsNet();
          controller.fetchCoins(controller.itemSelect);
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
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 4.0),
                    TextButton.icon(
                      onPressed: () => controller.share(screenshot),
                      icon: Icon(
                        Icons.share,
                        size: 30.0,
                        color: ConstColors.colorLavenderFloral,
                      ),
                      label: Text(''),
                    ),
                  ],
                ),
                Text(
                  "Dados coletados em :",
                  style: TextStyle(
                    color: ConstColors.colorLigthGray,
                    fontSize: 22.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //date
                    Icon(
                      Icons.calendar_today,
                      color: ConstColors.colorDarkBlueGray,
                      size: 22.00,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      date == null ? "" : date,
                      style: TextStyle(
                          color: ConstColors.colorLavenderFloral,
                          fontSize: 22.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizeBoxDivisor(),
                Text(
                  "Tipo de converção :",
                  style: TextStyle(
                      color: ConstColors.colorLigthGray, fontSize: 22.0),
                  textAlign: TextAlign.center,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //name
                    Text(
                      "De : ${coins?[index].name?.replaceAll("/", " p. \n")}",
                      style: TextStyle(
                        color: ConstColors.colorLavenderFloral,
                        fontSize: 22.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizeBoxDivisor(),
                Text(
                  "Sigla/Moeda : ",
                  style: TextStyle(
                      color: ConstColors.colorLigthGray, fontSize: 22.0),
                  textAlign: TextAlign.center,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //coin
                    Icon(
                      Icons.monetization_on,
                      color: ConstColors.colorDarkBlueGray,
                      size: 30.0,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "${coins?[index].code}",
                      style: TextStyle(
                          color: ConstColors.colorLavenderFloral,
                          fontSize: 28.0),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizeBoxDivisor(),
                Text(
                  "Cotação :",
                  style: TextStyle(
                      color: ConstColors.colorLigthGray, fontSize: 22.0),
                  textAlign: TextAlign.center,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TestTextCustom(
                      controller: controller,
                      genFunctions: genFunctions,
                      coins: coins!,
                      index: index,
                    )
                  ],
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
