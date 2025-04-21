import 'package:flutter/material.dart';
import '../../../shared/util/value/const_colors.dart';

class FlotBtnSearsh extends StatelessWidget {
  const FlotBtnSearsh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 8.0,
      hoverColor: ConstColors.colorDarkBlueGray,
      backgroundColor: ConstColors.colorSkyMagenta,
      child: Icon(
        Icons.search,
        color: ConstColors.colorDarkBlueGray,
        size: 38.0,
      ),
      onPressed: () {},
    );
  }
}
