import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../shared/util/value/const_colors.dart';
import 'controllers/home_store.dart';

// ignore: must_be_immutable
class NumberCustom extends StatelessWidget {
  final int currentNumber = 10;
  final HomeStore store;
  NumberCustom({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return NumberPicker(
          textStyle: TextStyle(
            color: ConstColors.colorLavenderFloral,
            fontSize: 22.0,
          ),
          selectedTextStyle: TextStyle(
            color: ConstColors.colorSkyMagenta,
            fontSize: 48.0,
          ),
          value: int.parse(store.textValidat),
          minValue: 0,
          maxValue: 1000000000000000,
          onChanged: (value) {
            store.changesTextValidat(
              value.toString(),
            );
            store.changesValueConvertion();
          },
        );
      },
    );
  }
}
