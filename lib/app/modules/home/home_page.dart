import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/util/value/const_colors.dart';
import 'components/build/build_body.dart';
import 'components/build/build_bottom_bar.dart';
import 'controllers/home_store.dart';
import 'controllers/rate_my_app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeStore>();
  @override
  void initState() {
    super.initState();
    controller.rateMyAppController = RateMyAppController(
      mounted: mounted,
    );
    controller.rateMyAppController.initRate(
      rateMyApp: controller.rateMyApp,
      context: context,
    );
    controller.changesIsNet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('scfuldHome'),
      backgroundColor: ConstColors.colorSpaceCadet,
      body: BuildBody(
        context: context,
        rateMyApp: controller.rateMyApp,
        rateMyAppController: controller.rateMyAppController,
        controller: controller,
        textController: controller.textController,
      ),
      bottomNavigationBar: BuildBottomBar(
        controller: controller,
      ),
    );
  }
}
