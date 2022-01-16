import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../controllers/home_store.dart';

// ignore: must_be_immutable
class LinkCustom extends StatelessWidget {
  final HomeStore controller;
  final IconData icon;
  final Color iconcor;
  final double iconSize;
  final double textSize;
  final Color textCor;
  final String text;
  final double top;
  final double rigth;
  final double left;
  final String url;

  LinkCustom({
    required this.controller,
    required this.icon,
    required this.iconcor,
    required this.iconSize,
    required this.textSize,
    required this.textCor,
    required this.text,
    required this.top,
    required this.rigth,
    required this.left,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        left: left,
        right: rigth,
      ),
      child: GestureDetector(
        onTap: () async {
          controller.changesColorLink(text);
          await controller.launchURL(url);
        },
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: iconcor,
                size: iconSize,
              ),
              const SizedBox(width: 8.0),
              Text(
                text,
                style: TextStyle(
                  color: textCor,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
