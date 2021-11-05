import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../../../../shared/models/coins_model.dart';
import '../../../../shared/models/coins_parc_model.dart';

abstract class IWidGetController {
  Center? btnIconError(String title, String msg, IconData icon) {}
  Widget? sizeBoxDivisor() {}
  FloatingActionButton? flotBtnSearsh() {}
  Container? buildHeader(String? titulo, BuildContext? _context,
      {required String? screen}) {}
  Widget? isInternetBuild() {}
  SingleChildScrollView? buildBodyCotation(BuildContext? context) {}
  Widget? returnCardCustom() {}
  Widget? returnCardGrafic() {}
  SingleChildScrollView? buildBodyCovert(BuildContext? context) {}
  SingleChildScrollView? buildBodyAbout(
    context,
    RateMyApp rateMyApp,
    rateMyAppController,
  ) {}
  Widget? buildBottomBar() {}
  Widget? buildBody(context, RateMyApp rateMyApp, rateMyAppController) {}
  Container? horizontlList() {}
  List<CoinsParcModel>? fillListSiglas() {}
  Text? testCoinsText({
    required List<CoinModel>? coins,
    required int index,
  }) {}
  Text? testTextBr({
    required List<CoinModel>? coins,
    required int index,
  }) {}
  Text? testTextCustom({
    required List<CoinModel>? coins,
    required int index,
  }) {}
}
