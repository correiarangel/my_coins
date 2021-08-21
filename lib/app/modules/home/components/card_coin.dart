import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:my_coins/app/shared/models/coins_model.dart';

class CardCoin extends StatelessWidget {
  final List<CoinModel>? coins;
  final int index;
  final controller;
  const CardCoin(
      {Key? key,
      required this.coins,
      required this.index,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: InkWell(
          splashColor: Colors.grey.withAlpha(30),
          onTap: () {
            controller.fetchCoins();
          },
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 18.0,
              ),
              Row(
                children: <Widget>[
                  //date
                  SizedBox(width: 12.0),
                  Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                  SizedBox(width: 18.0),
                  Text(
                    "${coins?[index].createDate}",
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  //name
                  SizedBox(width: 12.0),
                  Icon(
                    Icons.calculate,
                    color: Colors.white,
                    size: 28.0,
                  ),
                  SizedBox(width: 18.0),
                  Text(
                    "De : ${coins?[index].name?.replaceAll("/", " p. \n")}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  //coin
                  SizedBox(width: 12.0),
                  Icon(
                    Icons.monetization_on,
                    color: Colors.white,
                    size: 28.0,
                  ),
                  SizedBox(width: 18.0),
                  Text(
                    "Sigla/Moéda : ${coins?[index].code}",
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  //name
                  SizedBox(width: 12.0),
                  Icon(
                    Icons.today,
                    color: Colors.white,
                    size: 28.0,
                  ),
                  SizedBox(width: 18.0),
                  Text(
                    "1 : ${coins?[index].code} Vale hoje:"
                    " ${coins?[index].bid} ",
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(height: 18.0),
            ],
          ),
        ),
        borderOnForeground: true,
        margin: EdgeInsets.only(bottom: 8.0, left: 18.0, right: 18.0, top: 8.0),
        shadowColor: Colors.grey[400],
        elevation: 10.0,
        color: Colors.purple[800],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
                topLeft: Radius.circular(12.0)),
           ),
      ),
    );
  }
}
