import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_modular/flutter_modular.dart';

import 'components/stagger_aimation.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Modular.to.pushReplacementNamed('/home');
      }
    });

    _startAnimation();
  }

  Future<void> _startAnimation() async {
    await Future.delayed(Duration(milliseconds: 300));
    if (mounted) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //timeDilation = 8;

    return Scaffold(
      body: Container(
        color: Color.fromRGBO(56, 59, 91, 1.0),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ListView(
            padding: EdgeInsets.only(top: 28),
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 90.0, bottom: 38.0),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
