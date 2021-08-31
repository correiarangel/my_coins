import 'package:flutter/material.dart';
import 'package:my_coins/app/shared/util/value/const_colors.dart';

class TextFielCustom {
  textFiel(TextInputType textInputType, String hintText, String lblText,
      dynamic onChanged, String? Function() errorText, bool isObscure) {
    assert(onChanged != null);

    return Padding(
      padding: EdgeInsets.only(left: 45.0, right: 45.0),
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: textInputType,
        cursorColor: ConstColors.colorSkyMagenta,
        style: TextStyle(color: ConstColors.colorSkyMagenta),
        onChanged: onChanged,
        obscureText: isObscure,
        decoration: InputDecoration(
          fillColor:  ConstColors.colorSkyMagenta,
          hintText: hintText,
          labelText: lblText,
          labelStyle: TextStyle(color: ConstColors.colorLigthGray,fontSize: 18.0),
          hintStyle: TextStyle(color: Colors.white.withAlpha(50),fontSize: 18.0),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ConstColors.colorSkyMagenta)),
          contentPadding:
              EdgeInsets.only(bottom: 10.0, top: 20.0, right: 20.0, left: 0.0),
          errorText: errorText == null ? null : errorText(),
          counterStyle: TextStyle(color: ConstColors.colorLavenderFloral),
        ),

        //validator
      ),
    );
  }
}
