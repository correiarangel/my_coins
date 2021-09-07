import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:my_coins/app/page/components/stagger_aimation.dart';
import 'package:my_coins/app/shared/util/value/const_colors.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Modular.to.pushReplacementNamed('/home');
      }
    });
    startFutture();
  }

  void start() async {
    await _animationController!.forward();
  }

  void startFutture() async {
    await Future.delayed(Duration(milliseconds: 2500), start);
  }

  @override
  void dispose() {
    if (_animationController != null) _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   // timeDilation = 10;

    return Scaffold(
      body: Container(
        color: Color.fromRGBO(56, 59, 91, 1.0),
        child: ListView(
          padding: EdgeInsets.only(top: 28),
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 70.0, bottom: 38.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.trending_up,
                          color: Color.fromRGBO(216, 99, 187, 1.0),
                          size: 150.0,
                        ),
                        radius: 100.0,
                      ),
                    ),
                  ],
                ),
    
                StaggerAnimation(controller: _animationController),
        
              ],
            )
          ],
        ),
      ),
    );
  }
}

    
  