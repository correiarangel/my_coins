import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_coins/app/shared/util/value/const_colors.dart';

void main() {
  setUp(() {
    print("Iniciando tests ConstColors");
  });

  tearDown(() {
    print("Finalizando test ConstColors");
  });
  test('Deve comparar e retornar true para cores corretas ...', () async {
    expect(ConstColors.colorIndependence, Color(0xff545c73));
    expect(ConstColors.colorStateGray, Color(0xff6C7484));
    expect(ConstColors.colorDarkBlueGray, Color(0xff665992));
    expect(ConstColors.colorCadetGrey, Color(0xff9ca4ac));
    expect(ConstColors.colorRhythm, Color(0xff827898));
    expect(ConstColors.colorOldLavender, Color(0xff6a6377));
    expect(ConstColors.colorThistle, Color(0xffd6bce4));
    expect(ConstColors.colorSpaceCadet, Color(0xff383b5b));
    expect(ConstColors.colorCultured, Color(0xfff5f5f4));
    expect(ConstColors.colorCadetBlue, Color(0xff6FABAF));
    expect(ConstColors.colorLigthGray, Color(0xffcccccc));
    expect(ConstColors.colorSkyMagenta, Color(0xffd863bb));
    expect(ConstColors.colorLavenderFloral, Color(0xffBD92F9));
  });
}
