import 'package:flutter/material.dart';
import '../../../shared/util/value/const_colors.dart';

class SizeBoxDivisor extends StatelessWidget {
  const SizeBoxDivisor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.0,
      child: Divider(
        height: 3.0,
        thickness: 3.0,
        indent: 50.0,
        endIndent: 50.0,
        color: ConstColors.colorDarkBlueGray,
      ),
    );
  }
}
