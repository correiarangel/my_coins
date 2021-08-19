import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:my_coins/app/shared/models/coins_model.dart';

class CardCoin extends StatelessWidget {
  final List<CoinModel>? coins;
  final int index;
  const CardCoin({
    Key? key,
    required this.coins,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(8.0),
        shadowColor: Colors.grey[800],
        elevation: 8.0,
        color: Colors.deepPurple,
        child: Column(
         
          children: <Widget>[
            SizedBox(
              height: 8.0,
            ),
            Text(
              "Data: ${coins?[index].createDate}",
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "Moéda: ${coins?[index].code}",
              style: TextStyle(
                color: Colors.white, 
                fontSize: 18.0
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "Conveção:\n${coins?[index].name}",
              style: TextStyle(
                color: Colors.white, 
                fontSize: 18.0
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "O  ${coins?[index].code} Vale hoje: ${coins?[index].bid} ",
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
