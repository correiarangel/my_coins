import 'package:flutter/material.dart';
import '../../shared/util/value/const_colors.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController? controller;

  StaggerAnimation({this.controller})
      : logoSqueeze = Tween(begin: 320.0, end: 60.0).animate(
            CurvedAnimation(parent: controller!, curve: Interval(0.0, 0.150))),
        logoZoomOut = Tween(
          begin: 60.0,
          end: 1000.0,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.5, 1, curve: Curves.bounceOut),
        ));

  final Animation<double> logoSqueeze;
  final Animation<double> logoZoomOut;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    const double _height = 250.0;

    return Padding(
      padding: EdgeInsets.only(bottom: 240.0),
      child: Hero(
        tag: "fade",
        child: logoZoomOut.value == 60
            ? Container(
                width: logoSqueeze.value,
                height: logoSqueeze.value < 80 ? 60.0 : _height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(216, 99, 187, 0.9),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: _buildInside(context))
            : Container(
                width: logoZoomOut.value,
                height: logoZoomOut.value,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(216, 99, 187, 0.9),
                    shape: logoZoomOut.value < 500
                        ? BoxShape.circle
                        : BoxShape.rectangle),
              ),
      ),
    );
  }

  Widget _buildInside(BuildContext context) {
    if (logoSqueeze.value > 75) {
      return CircleAvatar(
        backgroundColor: ConstColors.colorSkyMagenta,
        child: Icon(
          Icons.monetization_on,
          color: ConstColors.colorSpaceCadet,
          size: 200.0,
        ),
        radius: 100.0,
      );
    } else {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(ConstColors.colorLigthGray),
        strokeWidth: 1.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller!,
    );
  }
}
