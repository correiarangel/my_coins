import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  
  void startHome() => Modular.to.pushReplacementNamed('/home');

  @override
  void initState() {
    super.initState();  
    //Timer(Duration(seconds: 3), startHome);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "My Coins Cotação de moédas",
            style: TextStyle(fontSize: 24.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 21.0,
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.white,
            semanticsLabel: "Iniciando, aguarde por favor...",
          ),
        ],
      )),
    );
  }
}
