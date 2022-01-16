import 'package:flutter/material.dart';
import '../../../shared/util/value/const_colors.dart';

class TextFielCustom {
  textFiel(
      TextInputType textInputType,
      String hintText,
      String lblText,
      dynamic onChanged,
      String? Function() errorText,
      // ignore: avoid_positional_boolean_parameters
      bool isObscure,
      TextEditingController textController) {
    assert(onChanged != null);

    return Padding(
      padding: EdgeInsets.only(left: 45.0, right: 45.0),
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: textInputType,
        cursorColor: ConstColors.colorSkyMagenta,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
            color: ConstColors.colorSkyMagenta,
            fontSize: 28.0,
            fontFamily: "RobotoSlabBold"),
        onChanged: onChanged,
        obscureText: isObscure,
        controller: textController,
        decoration: InputDecoration(
          fillColor: ConstColors.colorSkyMagenta,
          hintText: hintText,
          labelText: lblText,
          labelStyle: TextStyle(
            color: ConstColors.colorLigthGray,
            fontSize: 18.0,
          ),
          hintStyle: TextStyle(
            color: Colors.white.withAlpha(50),
            fontSize: 18.0,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ConstColors.colorSkyMagenta,
            ),
          ),
          contentPadding: EdgeInsets.only(
            bottom: 10.0,
            top: 20.0,
            right: 20.0,
            left: 0.0,
          ),
          // ignore: unnecessary_null_comparison
          errorText: errorText == null ? null : errorText(),
          counterStyle: TextStyle(
            color: ConstColors.colorLavenderFloral,
          ),
        ),
      ),
    );
  }
}
