import 'package:flutter/material.dart';
import '../../shared/util/value/const_colors.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController? controller;

  StaggerAnimation({this.controller})
    : logoSqueeze = Tween(begin: 320.0, end: 60.0).animate(
        CurvedAnimation(parent: controller!, curve: Curves.easeInOutCubic),
      ),
      logoZoomOut = Tween(begin: 60.0, end: 1000.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic),
      );

  final Animation<double> logoSqueeze;
  final Animation<double> logoZoomOut;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    const _height = 250.0;

    return Padding(
      padding: EdgeInsets.only(bottom: 240.0),
      child: Hero(
        tag: "fade",
        child: AnimatedBuilder(
          animation: controller!,
          builder: (context, child) {
            return Container(
              width: logoSqueeze.value,
              height: logoSqueeze.value < 80 ? 60.0 : _height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromRGBO(216, 99, 187, 0.9),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              child: _buildInside(context),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInside(BuildContext context) {
    return AnimatedBuilder(
      animation: controller!,
      builder: (context, child) {
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
            valueColor: AlwaysStoppedAnimation<Color>(
              ConstColors.colorLigthGray,
            ),
            strokeWidth: 1.0,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildAnimation(context, null);
  }
}
