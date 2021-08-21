import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_coins/app/shared/util/value/const_colors.dart';

class WidGetCustm {
  Widget sizeBoxDivisor() {
    return SizedBox(
      height: 28.0,
      child: Divider(
          height: 3.0,
          thickness: 3.0,
          indent: 50.0,
          endIndent: 50.0,
          color: ConstColors.colorDarkBlueGray),
    );
  }

  Widget btnSearsh(controller) {
    return TextButton.icon(
      icon:
          Icon(Icons.search, color: ConstColors.colorDarkBlueGray, size: 38.0),
      label: Text("Pesquisar outra moéda"),
      onPressed: () {},
    );
  }

  Widget flotBtnSearsh(controller) {
    return FloatingActionButton(
      elevation: 8.0,
      hoverColor: ConstColors.colorDarkBlueGray,
      backgroundColor: ConstColors.colorSkyMagenta,
      child: Icon(
        Icons.search, 
        color: ConstColors.colorDarkBlueGray,
        size: 38.0,
      ),
      onPressed: () {
        
      },);

  }

  hearder(controller) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        btnSearsh(controller),
      ],
    );
  }
}
