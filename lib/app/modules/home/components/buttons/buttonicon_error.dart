import 'package:flutter/material.dart';
import '../../../../shared/util/value/const_colors.dart';
import '../../controllers/home_store.dart';

class ButtonIconError extends StatelessWidget {
  final String title;
  final String msg;
  final IconData icon;
  final HomeStore controller;

  const ButtonIconError({
    Key? key,
    required this.controller,
    required this.title,
    required this.msg,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        child: Container(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 28.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //date
                  Icon(
                    icon,
                    color: ConstColors.colorSkyMagenta,
                    size: 28.00,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    title,
                    style: TextStyle(
                      color: ConstColors.colorLigthGray,
                      fontSize: 28.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 18.0),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  msg,
                  style: TextStyle(
                    color: ConstColors.colorSkyMagenta,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Icon(
                icon == Icons.wifi_off
                    ? Icons.restart_alt
                    : Icons.refresh_rounded,
                color: ConstColors.colorSkyMagenta,
                size: 48.00,
              ),
              const SizedBox(height: 18.0),
            ],
          ),
        ),
        onTap: () {
          controller.fetchCoins(controller.itemSelect);
        },
      ),
    );
  }
}
