import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../shared/util/value/const_colors.dart';
import '../../controllers/home_store.dart';

class BuildBottomBar extends StatelessWidget {
  final HomeStore controller;
  const BuildBottomBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return BottomNavigationBar(
          selectedItemColor: ConstColors.colorSkyMagenta,
          unselectedItemColor: Colors.grey,
          backgroundColor: ConstColors.colorSpaceCadet,
          currentIndex: controller.currentIndex,
          onTap: controller.changePage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.poll,
                color: ConstColors.colorDarkBlueGray,
              ),
              label: "Cambios",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
                color: ConstColors.colorDarkBlueGray,
              ),
              // ignore: deprecated_member_use
              label: "Converter",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
                color: ConstColors.colorDarkBlueGray,
              ),
              // ignore: deprecated_member_use
              label: "Info",
            ),
          ],
        );
      },
    );
  }
}
