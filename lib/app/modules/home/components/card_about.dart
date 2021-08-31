import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../shared/util/value/const_colors.dart';
import '../../../shared/util/value/const_srtring.dart';
import '../../../shared/util/value/const_srtring_url.dart';
import 'link_custon.dart';
import 'widgets_custom.dart';

// ignore: must_be_immutable
class CardAbout extends StatelessWidget {
  final widGetCustm = WidGetCustm();
  final controller;

  CardAbout({Key? key, required this.controller}) : super(key: key);
  
  setVersion() {
    String v = "1.0.0+1";
    if (Platform.isAndroid || Platform.isIOS) {
      v = controller.version;
    }
    return v;
  }

  @override
  Widget build(BuildContext context) {
    Widget sizeBoxDivisor = widGetCustm.sizeBoxDivisor();

    return Padding(
      padding:
          EdgeInsets.only(left: 10.0, right: 10.0, top: 18.0, bottom: 18.0),
      child: Container(
        decoration: BoxDecoration(
          color: ConstColors.colorSpaceCadet,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: ConstColors.colorSkyMagenta,
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 2.0, //extend the shadow
              offset: Offset(
                2.0, // Move to right 10  horizontally
                2.0, // Move to bottom 5 Vertically
              ),
            )
          ],
        ),
        child: Observer(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 28.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.design_services,
                    color: ConstColors.colorDarkBlueGray,
                    size: 28.00,
                  ),
                  SizedBox(width: 10.0),
                  Observer(
                    builder: (context) {
                      return Text(
                        "Versão ${controller.version}",
                        style: TextStyle(
                            color: ConstColors.colorLigthGray, fontSize: 28.0),
                        textAlign: TextAlign.center,
                      );
                    },
                  )
                ],
              ),
              sizeBoxDivisor,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.info,
                    color: ConstColors.colorDarkBlueGray,
                    size: 28.00,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "Info",
                    style: TextStyle(
                        color: ConstColors.colorLigthGray, fontSize: 28.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 4.0, right: 4.0,top: 18.0),
                  child: Text(
                    "O App My Coins desenvolvido para consultar e exibir,"
                    "dados cambiais, cotação de moédas de varios paises, "
                    "e moédas digitais como BitCoin, Ethereum e outras.\n"
                    "Com visual simple e amigavel com seu thema inspirado no "
                    "consolidado thema Dracula.\n",
                    style: TextStyle(
                        color: ConstColors.colorLavenderFloral, fontSize: 20.0),
                    textAlign: TextAlign.center,
                  )),
              sizeBoxDivisor,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //coin
                  Icon(
                    Icons.design_services,
                    color: ConstColors.colorDarkBlueGray,
                    size: 28.0,
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    "Desenvolvedor",
                    style: TextStyle(
                        color: ConstColors.colorLigthGray, fontSize: 28.0),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 4.0, right: 4.0,top:18.0),
                  child: Text(
                    "Marcos Rangel, desenvolvedor móbile Flutter.\n"
                    "Flutte é uma poderosa ferramenta para o desenvolvimento,\n"
                    "Mobile,Web e Desktop, documentação nos links abaixo:\n",
                    style: TextStyle(
                        color: ConstColors.colorLavenderFloral, fontSize: 20.0),
                    textAlign: TextAlign.center,
                  )),
              sizeBoxDivisor,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //coin

                  Icon(
                    Icons.contact_mail,
                    color: ConstColors.colorDarkBlueGray,
                    size: 28.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "Contato(s)",
                    style: TextStyle(
                        color: ConstColors.colorLigthGray, fontSize: 28.0),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              LinkCustom(
                icon: Icons.email,
                iconcor: ConstColors.colorDarkBlueGray,
                iconSize: 30,
                textSize: 18.0,
                textCor: controller.colorLinkEmail,
                text: ConstString.email,
                top: 18.0,
                rigth: 10.0,
                left: 10.0,
                url: ConstStringUrl.urlEmail,
              ),
              //sizeBoxDivisor,
              LinkCustom(
                icon: Icons.pages,
                iconcor: ConstColors.colorDarkBlueGray,
                iconSize: 30,
                textSize: 18.0,
                textCor: controller.colorLinkDin,
                text: ConstString.linkDin,
                top: 18.0,
                rigth: 10.0,
                left: 10.0,
                url: ConstStringUrl.urlLinkDin,
              ),
             // sizeBoxDivisor,
              LinkCustom(
                  icon: Icons.category,
                  iconcor: ConstColors.colorDarkBlueGray,
                  iconSize: 30,
                  textSize: 18.0,
                  textCor: controller.colorLinkGit,
                  text: ConstString.gitHub,
                  top: 18.0,
                  rigth: 10.0,
                  left: 10.0,
                  url: ConstStringUrl.urlGuitHub),
              sizeBoxDivisor,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //coin

                  Icon(
                    Icons.recent_actors,
                    color: ConstColors.colorDarkBlueGray,
                    size: 28.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "Referecia(s)",
                    style: TextStyle(
                        color: ConstColors.colorLigthGray, fontSize: 28.0),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              LinkCustom(
                  icon: Icons.flutter_dash_outlined,
                  iconcor: ConstColors.colorDarkBlueGray,
                  iconSize: 30,
                  textSize: 18.0,
                  textCor: controller.colorLinkDoc,
                  text: ConstString.docFlutter,
                  top: 10.0,
                  rigth: 10.0,
                  left: 10.0,
                  url: ConstStringUrl.urlDocFlutter),
              const SizedBox(height: 28.0),
            ],
          );
        }),
      ),
    );
  }
}
