import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_coins/app/shared/util/value/const_colors.dart';

import 'components/widgets_custom.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final widGetCustom = WidGetCustm();
  @override
  Widget build(BuildContext context) {
 return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: ConstColors.colorSpaceCadet,
        body: widGetCustom.buildBody(controller, context),
        bottomNavigationBar: widGetCustom.buildBottomBar(controller),
      );
    });
  }
}

      