import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../shared/models/coins_model.dart';
import '../../../../shared/util/general_functions.dart';
import '../../../../shared/util/value/const_colors.dart';
import '../../controllers/home_store.dart';
import '../../number_custom.dart';
import '../buttons/button_increment_decrement.dart';
import '../buttons/small_button.dart';
import '../buttons/small_button_ziro.dart';
import '../texts/test_coins_text.dart';
import '../texts/test_textbr.dart';

class CardCoinConvert extends StatelessWidget {
  final GeneralFunctions genFunctions = Modular.get();
  final ScreenshotController screenshot;
  final List<CoinModel>? coins;
  final int index;
  final HomeStore controller;

  CardCoinConvert({
    Key? key,
    required this.coins,
    required this.index,
    required this.controller,
    required this.screenshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            SmallButton(
              textValidat: 10,
              text: '   +10   ',
              store: controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Observer(
                  builder: (context) {
                    var text = controller.textValidat;
                    return ButtonIncrementDecrement(
                      voidCallback: () {
                        var _cont = controller.textCont(text: int.parse(text));
                        controller.changesTextValidat("$_cont");
                        controller.valueToConvert();
                      },
                      text: '   -1    ',
                    );
                  },
                ),
                NumberCustom(store: controller),
                Observer(
                  builder: (context) {
                    var _text = controller.textValidat;
                    return ButtonIncrementDecrement(
                      voidCallback: () {
                        int? cont = int.parse(_text);
                        cont += 1;
                        if (cont < 0) cont = 0;

                        controller.changesTextValidat("$cont");
                        controller.valueToConvert();
                      },
                      text: '   +1   ',
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 0.0),
            SmallButtonZiro(
              store: controller,
            ),
            TextButton.icon(
              onPressed: () {
                controller.changesIsReverseConversion();
                controller.changesTextValidat(
                  controller.textValidat,
                );
                controller.changesValueConvertion();
              },
              icon: Icon(
                Icons.swap_vert,
                color: ConstColors.colorLigthGray,
                size: 48.0,
              ),
              label: Text(
                '',
                style: TextStyle(
                  color: ConstColors.colorLavenderFloral,
                  fontSize: 0.0,
                ),
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
                        ? TestTextBR(
                            genFunctions: genFunctions,
                            controller: controller,
                            coins: coins!,
                            index: index,
                          )
                        : TestCoinsText(
                            genFunctions: genFunctions,
                            controller: controller,
                            coins: coins!,
                            index: index,
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
