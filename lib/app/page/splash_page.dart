import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_coins/app/shared/util/value/const_colors.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  void startHome() => Modular.to.pushReplacementNamed('/home');

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 3500), startHome);
  }

  var cor = Colors.purple[900];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.colorSpaceCadet,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          CircleAvatar(
            backgroundColor: ConstColors.colorSkyMagenta,
            child: Icon(
              Icons.monetization_on,
              color: ConstColors.colorDarkBlueGray,
              size: 140.0,
            ),
            radius: 100.0,
          ),
          SizedBox(height: 21.0),
          Text(
            "My Coins ;]",
            style:
                TextStyle(
                  fontSize: 28.0, 
                  color: ConstColors.colorSkyMagenta
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 21.0,
          ),
          CircularProgressIndicator(
            backgroundColor: ConstColors.colorSkyMagenta,
            semanticsLabel: "Iniciando, aguarde por favor...",
          ),
        ],
      )),
    );
  }
}
