import 'package:flutter/material.dart';

import '../../../../shared/util/value/const_srtring.dart';
import '../../controllers/home_store.dart';
import '../buttons/buttonicon_error.dart';

class IsIneternetBuild extends StatelessWidget {
  final HomeStore controller;
  const IsIneternetBuild({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Widget winget;
    if (controller.isNet == true) {
      winget = ButtonIconError(
        title: "Ops!...",
        msg: ConstString.msgErroLoand,
        icon: Icons.refresh,
        controller: controller,
      );
    } else if (controller.isNet == false) {
      winget = ButtonIconError(
        title: "Ops!...",
        msg: ConstString.msgNotNet,
        icon: Icons.wifi_off,
        controller: controller,
      );
    } else {
      winget = ButtonIconError(
        title: "Ops!, Erro",
        msg: ConstString.msgErroLoand,
        icon: Icons.refresh,
        controller: controller,
      );
    }
    return winget;
  }
}
