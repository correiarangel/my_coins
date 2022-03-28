import 'package:flutter/material.dart';

import '../controllers/home_store.dart';
import 'cards/card_siglas.dart';

class HorizontlList extends StatelessWidget {
  final HomeStore controller;
  const HorizontlList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listCoins = controller.fillListSiglas();
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        height: 120.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listCoins.length,
          itemBuilder: (context, index) {
            return CardSiglas(
              coins: listCoins,
              index: index,
              controller: controller,
            );
          },
        ));
  }
}
