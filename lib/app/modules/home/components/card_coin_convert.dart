import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:my_coins/app/modules/home/components/widgets_custom.dart';
import 'package:my_coins/app/shared/models/coins_model.dart';
import 'package:my_coins/app/shared/util/value/const_colors.dart';

import '../../../shared/interface/general_functions_interface.dart';
import 'textfield.dart';

class CardCoinConvert extends StatelessWidget {
  final genFunctions = Modular.get<IGeneralFunctions>();
  final _textController = TextEditingController();
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
      padding: EdgeInsets.only(
        left: 18.0,
        right: 18.0,
        top: 18.0,
        bottom: 18.0,
      ),
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
                    color: ConstColors.colorLigthGray,
                    fontSize: 28.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 28.0),
            Observer(
              builder: (context) {
                String? _text = controller.textValidat;
                return TextButton.icon(
                  onPressed: () {
                    int? cont = int.parse(_text!);
                    cont += 1;
                    // ignore: unnecessary_null_comparison
                    if (cont == null) cont = 0;
                    _textController.text = "$cont";
                    controller.changesTextValidat("$cont");
                  },
                  icon: Icon(
                    Icons.add,
                    color: ConstColors.colorSkyMagenta,
                    size: 38.0,
                  ),
                  label: Text(''),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 28.0,
                left: 8.0,
                right: 8.0,
              ),
              child: Observer(
                builder: (context) {
                  return controller.isReverseConversion
                      ? fieldText.textFiel(
                          TextInputType.number,
                          "Digite o valor",
                          "De Real para ${coins?[index].code}:",
                          controller.changesTextValidat,
                          controller.valueToConvert,
                          false,
                          _textController)
                      : fieldText.textFiel(
                          TextInputType.number,
                          "Digite o valor",
                          "De ${coins?[index].code} para Real :",
                          controller.changesTextValidat,
                          controller.valueToConvert,
                          false,
                          _textController);
                },
              ),
            ),
            Observer(
              builder: (context) {
                String? text = controller.textValidat;
                return TextButton.icon(
                  onPressed: () {
                    int? _cont = int.parse(text!);
                    // ignore: unnecessary_statements
                    text == "0" ? _cont : _cont -= 1;
                    // ignore: unnecessary_null_comparison
                    if (_cont == null) _cont = 0;
                    _textController.text = "$_cont";
                    controller.changesTextValidat("$_cont");
                  },
                  icon: Icon(
                    Icons.remove,
                    color: ConstColors.colorSkyMagenta,
                    size: 38.0,
                  ),
                  label: Text(''),
                );
              },
            ),
            const SizedBox(height: 0.0),
            TextButton.icon(
              onPressed: () => controller.changesIsReverseConversion(),
              icon: Icon(
                Icons.swap_vert,
                color: ConstColors.colorLigthGray,
                size: 48.0,
              ),
              label: Text(
                "",
                style: TextStyle(
                    color: ConstColors.colorLavenderFloral, 
                    fontSize: 0.0,),
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
                    return controller.isReverseConversion
                        ? Text(
                            "${controller.textValidat == null ? '0' : controller.textValidat}"
                            " Real(s) vale(m)\n "
                            "${controller.valueConvertion} "
                            "${coins?[index].name?.replaceAll("/Real Brasileiro", "")}",
                            style: TextStyle(
                                color: ConstColors.colorLavenderFloral,
                                fontSize: 22.0),
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            "${controller.textValidat == null ? '0' : controller.textValidat}"
                            ", ${coins?[index].name?.replaceAll("/Real Brasileiro", "")}"
                            " vale(m)\n ${controller.valueConvertion.replaceAll(".", ",")} Real(s)",
                            style: TextStyle(
                                color: ConstColors.colorLavenderFloral,
                                fontSize: 22.0),
                            textAlign: TextAlign.center,
                          );
                  },
                )),
            const SizedBox(height: 38.0),
          ],
        ),
      ),
    );
  }
}
