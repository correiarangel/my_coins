import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../controllers/home_store.dart';

import 'cards/card_grafic.dart';
import 'circular_progress.dart';

class ReturnCardGrafic extends StatelessWidget {
  final HomeStore controller;
  const ReturnCardGrafic({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (controller.coinsDays?.error != null || controller.isNet == false) {
          return SizedBox.shrink();
        } else if (controller.coinsDays?.value == null) {
          return controller.progssVariation ? CircularProgress() : Container();
        } else {
          var _listCoins = controller.coinsDays?.value;

          return Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              bottom: 20.0,
            ),
            child: CardGrafic(
              coinsDays: _listCoins,
              param: 'bid',
              controller: controller,
            ),
          );
        }
      },
    );
  }
}
