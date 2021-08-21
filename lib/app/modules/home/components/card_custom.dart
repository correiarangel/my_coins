import 'package:flutter/material.dart';
import 'package:my_coins/app/modules/home/components/widgets_custom.dart';
import 'package:my_coins/app/shared/models/coins_model.dart';
import 'package:my_coins/app/shared/util/const_colors.dart';

class CardCustom extends StatelessWidget {
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
                    color: ConstColors.colorCadetGrey,
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
                          "${coins?[index].createDate}",
                          style: TextStyle(
                              color: ConstColors.colorSkyMagenta,
                              fontSize: 22.0),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    sizeBoxDivisor,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //name
                        Text(
                          "De : ${coins?[index].name?.replaceAll("/", " p. \n")}",
                          style: TextStyle(
                            color: ConstColors.colorSkyMagenta,
                            fontSize: 22.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                     sizeBoxDivisor,
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
                          "Sigla/Moéda : ${coins?[index].code}",
                          style: TextStyle(
                              color: ConstColors.colorSkyMagenta,
                              fontSize: 28.0),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    sizeBoxDivisor,

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //name
                        Text(
                          "1 : ${coins?[index].code} Vale hoje:"
                          " ${coins?[index].bid} ",
                          style: TextStyle(
                              color: ConstColors.colorSkyMagenta,
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
