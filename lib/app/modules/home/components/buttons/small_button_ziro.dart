import 'package:flutter/material.dart';

import '../../../../shared/util/value/const_colors.dart';
import '../../controllers/home_store.dart';

class SmallButtonZiro extends StatelessWidget {
  final HomeStore store;
  SmallButtonZiro({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          BorderSide(
            color: ConstColors.colorSkyMagenta,
            style: BorderStyle.solid,
            width: 2.0,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          ConstColors.colorSpaceCadet,
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevation: MaterialStateProperty.all(7.5),
        animationDuration: Duration(
          milliseconds: 1500,
        ),
        overlayColor: MaterialStateProperty.all(
          ConstColors.colorSkyMagenta,
        ),
      ),
      onPressed: () {
        store.changesTextValidat('0');
        store.changesValueConvertion();
      },
      child: Text(
        'Zerar 0',
        style: TextStyle(
          color: ConstColors.colorCadetGrey,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
