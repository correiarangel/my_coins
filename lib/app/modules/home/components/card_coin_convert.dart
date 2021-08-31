import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_coins/app/modules/home/components/textfield.dart';
import 'package:my_coins/app/modules/home/components/widgets_custom.dart';
import 'package:my_coins/app/shared/interface/general_functions_interface.dart';

import 'package:my_coins/app/shared/models/coins_model.dart';
import 'package:my_coins/app/shared/util/value/const_colors.dart';

class CardCoinConvert extends StatelessWidget {
  final genFunctions = Modular.get<IGeneralFunctions>();
  final fieldText = TextFielCustom();
  final widGetCustm = WidGetCustm();
  final List<CoinModel>? coins;
  final int index;
  final controller;
  CardCoinConvert(
      {Key? key,
      required this.coins,
      required this.index,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.changesPriceCoin("${coins?[index].bid}");

    return Padding(
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 18.0, bottom: 18.0),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 38.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //date
                  Icon(
                    Icons.calculate_sharp,
                    color: ConstColors.colorDarkBlueGray,
                    size: 28.00,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "Converter",
                    style: TextStyle(
                        color: ConstColors.colorLigthGray, fontSize: 28.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 38.0),
              Padding(
                  padding: EdgeInsets.only(
                    left: 4.0,
                    right: 4.0,
                  ),
                  child: Observer(
                    builder: (context) {
                      return fieldText.textFiel(
                          TextInputType.number,
                          "Digite o valor",
                          "Converter de Real p/ ${coins?[index].code}:",
                          controller.changesValidatConvertion,
                          controller.valueToConvert,
                          false);
                    },
                  )),
              const SizedBox(height: 28.0),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.swap_vert,
                  color: ConstColors.colorLigthGray,
                  size: 48.00,
                ),
                label: Text(
                  "",
                  style: TextStyle(
                      color: ConstColors.colorLavenderFloral, fontSize: 0.0),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 28.0),
              Padding(
                  padding: EdgeInsets.only(
                    left: 4.0,
                    right: 4.0,
                  ),
                  child: Observer(
                    builder: (context) {
                      return Text(
                        "${controller.validatConvetion == null ? '0': controller.validatConvetion}"
                        " Real(s) vale(m)\n "
                        "${controller.valueConvertion}  ${coins?[index].code}",
                        style: TextStyle(
                            color: ConstColors.colorLavenderFloral,
                            fontSize: 28.0),
                        textAlign: TextAlign.center,
                      );
                    },
                  )),
              const SizedBox(height: 38.0),
            ],
          ),
        ));
  }
}
