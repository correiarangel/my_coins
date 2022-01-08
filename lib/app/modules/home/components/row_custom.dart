import 'package:flutter/material.dart';
import '../../../shared/util/value/const_colors.dart';

class RowCustom extends StatelessWidget {
  final controller;

  const RowCustom({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextButton(
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
            controller.changesProgressVariation(true);
            controller.changesDays("7");
          },
          child: Text(
            "7 Dias",
            style: TextStyle(
              color: ConstColors.colorCadetGrey,
              fontSize: 18.0,
            ),
          ),
        ),
        TextButton(
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
            controller.changesProgressVariation(true);
            controller.changesDays("15");
          },
          child: Text(
            "15 Dias",
            style: TextStyle(
              color: ConstColors.colorCadetGrey,
              fontSize: 18.0,
            ),
          ),
        ),
        TextButton(
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
            controller.changesProgressVariation(true);
            controller.changesDays("30");
          },
          child: Text(
            "30 Dias",
            style: TextStyle(
              color: ConstColors.colorCadetGrey,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}
