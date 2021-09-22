import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/interface/general_functions_interface.dart';
import '../../../shared/models/coins_parc_model.dart';
import '../../../shared/util/value/const_colors.dart';
import 'widgets_custom.dart';

class CardSiglas extends StatelessWidget {
  
  final genFunctions = Modular.get<IGeneralFunctions>();
  final widGetCustm = WidGetCustm();
  final List<CoinsParcModel>? coins;
  final int index;
  final controller;

  CardSiglas(
      {Key? key,
      required this.coins,
      required this.index,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.changesItenSelect(coins?[index].code),
      child: Padding(
          padding:
              EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
          child: Container(
            height: 120.0,
            width: 120.0,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: 4.0, right: 4.0, bottom: 4.0, top: 4.0),
                  child: Text(
                    "${coins?[index].name}",
                    style: TextStyle(
                        color: ConstColors.colorLigthGray, fontSize: 12.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 4.0, right: 4.0, bottom: 4.0, top: 4.0),
                  child: Text(
                    "Sigla : ${coins?[index].code}",
                    style: TextStyle(
                        color: ConstColors.colorLavenderFloral, fontSize: 14.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
