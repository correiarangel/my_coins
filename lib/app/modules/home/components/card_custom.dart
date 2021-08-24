import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/interface/general_functions_interface.dart';
import '../../../shared/models/coins_model.dart';
import '../../../shared/util/value/const_colors.dart';
import 'widgets_custom.dart';

class CardCustom extends StatelessWidget {
  final genFunctions = Modular.get<IGeneralFunctions>();
  final widGetCustm = WidGetCustm();
  final List<CoinModel>? coins;
  final int index;
  final controller;

  CardCustom(
      {Key? key,
      required this.coins,
      required this.index,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget sizeBoxDivisor = widGetCustm.sizeBoxDivisor();
    String? date =
        genFunctions.toBrazilTime(coins?[index].createDate.toString());
    String? priceCoin = genFunctions.formatNumber("${coins?[index].bid}");
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: InkWell(
            splashColor: Colors.purpleAccent.withAlpha(80),
            onTap: () {
              controller.fetchCoins();
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
                      "Dados coletados em :",
                      style: TextStyle(
                        color:ConstColors.colorLigthGray,
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
                    sizeBoxDivisor,
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
                    sizeBoxDivisor,
                    Text(
                      "Sigla/Moéda : ",
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
                    sizeBoxDivisor,
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
                        //name
                        Text(
                          "1 : ${coins?[index].code} Custa\n"
                          " R\$ : $priceCoin",
                          style: TextStyle(
                              color: ConstColors.colorLavenderFloral,
                              fontSize: 28.0),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: 28.0),
                  ],
                ),
              ),
            )));
  }
}

/* Container(

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _row.twoRow(btnHistoryPoints, btnLaunchObservation),
              Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 18, right: 18, bottom: 0),
                child: r
              _prograssController == true
                  ? _screenProgress.screenProgress("Processando aguarde ...")
                  : Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            //se = check-out mostra ButtonActionRoud(),
                            child: testLastBolong == 'out'
                                ? btnMarkIn
                                : Container(),
                          ),
                          Container(
                            //se = check-in mostra ButtonActionRoud(),
                            child: testLastBolong == 'in'
                                ? btnMarkOut
                                : Container(),
                          ),
                        ],
                      ),
                    ),
              Observer(builder: (_) {
                ///atulisa tela quando post toda
                var sent = sentinelController.sentinelOutAuto;
                sent == true ? getRegisterHistPoints(false) : sent;
                return Text(
                  '${sentinelController.sentinelOutAuto}',
                  style: TextStyle(
                    color: ConstColors.colorIsabelline,
                    fontSize: 0,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
  } */
