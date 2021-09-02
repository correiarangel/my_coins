import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../shared/util/value/constants_id_app.dart';
import 'package:rate_my_app/rate_my_app.dart';
import '../../shared/util/value/const_colors.dart';

import 'components/widgets_custom.dart';
import 'controllers/home_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final widGetCustom = WidGetCustm();
    final RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 4,
    minLaunches: 4,
    remindDays: 5,
    remindLaunches: 5,
    googlePlayIdentifier: ConstIDApp.playStoreId,
    appStoreIdentifier: ConstIDApp.appstoreId,
  );
  @override
  Widget build(BuildContext context) {

    return Observer(builder: (_) {

      return Scaffold(
        backgroundColor: ConstColors.colorSpaceCadet,
        body: widGetCustom.buildBody(context,rateMyApp,mounted),
        bottomNavigationBar: widGetCustom.buildBottomBar(),
      );
    });
  }
}
