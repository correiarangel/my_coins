import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../shared/models/coins_model.dart';
import '../../../shared/util/value/const_colors.dart';

// ignore: must_be_immutable
class CardGrafic extends StatelessWidget {
  final List<CoinModel>? coins;
  // ignore: prefer_final_fields, unused_field
  int _currentPage = 0;
  CardGrafic({Key? key, required this.coins}) : super(key: key);

  final _duration = const Duration(milliseconds: 300);
  final _curve = Curves.easeInOutCubic;

  bool get isDesktopOrWeb =>
      Platform.isMacOS ||
      Platform.isAndroid ||
      Platform.isIOS ||
      Platform.isLinux;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(
              border: Border(
                bottom: BorderSide(
                  width: 10.0,
                  color: ConstColors.colorSkyMagenta,
                ),
              ),
              show: true),
        ),
        swapAnimationCurve: _curve,
        swapAnimationDuration: _duration,
      ),
    );
  }
}
