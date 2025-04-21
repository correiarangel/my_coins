import 'package:flutter/material.dart';
import '../../../shared/util/value/const_colors.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 48.0),
        CircularProgressIndicator(
          backgroundColor: ConstColors.colorSkyMagenta,
        ),
      ],
    );
  }
}
