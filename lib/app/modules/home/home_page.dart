import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../../shared/util/value/const_colors.dart';
import '../../shared/util/value/const_id_app.dart';
import 'controllers/home_store.dart';
import 'controllers/rate_my_app_controller.dart';
import 'controllers/widgets_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final widGetCustom = Modular.get<WidGetController>();
  late RateMyAppController rateMyAppController;
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
  void initState() {
    rateMyAppController = RateMyAppController(mounted: mounted);
    rateMyAppController.initRate(rateMyApp, context);
    controller.changesIsNet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: ConstColors.colorSpaceCadet,
        body: widGetCustom.buildBody(
          context,
          rateMyApp,
          rateMyAppController,
        ),
        bottomNavigationBar: widGetCustom.buildBottomBar(),
      );
    });
  }
}
