import 'dart:io';

/// יְהֹוָה my create
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../../../../shared/util/value/const_colors.dart';
import '../../../../shared/util/value/const_srtring.dart';
import '../../../../shared/util/value/const_srtring_url.dart';
import '../../controllers/home_store.dart';
import '../../controllers/rate_my_app_controller.dart';
import '../link_custon.dart';
import '../link_evaluation.dart';

// ignore: must_be_immutable
class CardAbout extends StatelessWidget {
  final Widget sizeBoxDivisor;
  final RateMyAppController rateMyAppController;
  final HomeStore controller;
  final RateMyApp rateMyApp;

  CardAbout({
    Key? key,
    required this.sizeBoxDivisor,
    required this.controller,
    required this.rateMyApp,
    required this.rateMyAppController,
  }) : super(key: key);

  String setVersion() {
    var v = "1.0.0+10";
    if (Platform.isAndroid || Platform.isIOS) {
      v = controller.version ?? "1.0.0+10";
    }
    return v;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 18.0,
        bottom: 18.0,
      ),
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
                    Icons.info,
                    color: ConstColors.colorDarkBlueGray,
                    size: 28.00,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "Info",
                    style: TextStyle(
                      color: ConstColors.colorLigthGray,
                      fontSize: 28.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                    left: 4.0,
                    right: 4.0,
                    top: 18.0,
                  ),
                  child: Text(
                    ConstString.msgTextInfo,
                    style: TextStyle(
                      color: ConstColors.colorLavenderFloral,
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  )),
              sizeBoxDivisor,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.design_services,
                    color: ConstColors.colorDarkBlueGray,
                    size: 28.00,
                  ),
                  const SizedBox(width: 10.0),
                  Observer(
                    builder: (context) {
                      return Text(
                        "Versão ${controller.version}",
                        style: TextStyle(
                          color: ConstColors.colorLigthGray,
                          fontSize: 28.0,
                        ),
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
                    Icons.event_available_rounded,
                    color: ConstColors.colorDarkBlueGray,
                    size: 28.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "Avaliar",
                    style: TextStyle(
                      color: ConstColors.colorLigthGray,
                      fontSize: 28.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(height: 18.0),
              LinkEvaluation(
                icon: Icons.event_available_outlined,
                iconcor: ConstColors.colorDarkBlueGray,
                iconSize: 30,
                textSize: 18.0,
                textCor: controller.colorLinkEvaluation!,
                text: 'Avaliar aplicativo',
                rigth: 10.0,
                left: 10.0,
                rateMyApp: rateMyApp,
                rateMyAppController: rateMyAppController,
              ),
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
                      color: ConstColors.colorLigthGray,
                      fontSize: 28.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                    left: 4.0,
                    right: 4.0,
                    top: 18.0,
                  ),
                  child: Text(
                    ConstString.msgTextTheDev,
                    style: TextStyle(
                      color: ConstColors.colorLavenderFloral,
                      fontSize: 20.0,
                    ),
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
                      color: ConstColors.colorLigthGray,
                      fontSize: 28.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              LinkCustom(
                controller: controller,
                icon: Icons.email,
                iconcor: ConstColors.colorDarkBlueGray,
                iconSize: 30,
                textSize: 18.0,
                textCor: controller.colorLinkEmail!,
                text: ConstString.email,
                top: 18.0,
                rigth: 10.0,
                left: 10.0,
                url: ConstStringUrl.urlEmail,
              ),
              //sizeBoxDivisor,
              LinkCustom(
                controller: controller,
                icon: Icons.pages,
                iconcor: ConstColors.colorDarkBlueGray,
                iconSize: 30,
                textSize: 18.0,
                textCor: controller.colorLinkDin!,
                text: ConstString.linkDin,
                top: 18.0,
                rigth: 10.0,
                left: 10.0,
                url: ConstStringUrl.urlLinkDin,
              ),
              // sizeBoxDivisor,
              LinkCustom(
                  controller: controller,
                  icon: Icons.category,
                  iconcor: ConstColors.colorDarkBlueGray,
                  iconSize: 30,
                  textSize: 18.0,
                  textCor: controller.colorLinkGit!,
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
                    Icons.local_police_rounded,
                    color: ConstColors.colorDarkBlueGray,
                    size: 28.0,
                  ),
                  SizedBox(width: 6.0),
                  Text(
                    "Política de Privacidade",
                    style: TextStyle(
                      color: ConstColors.colorLigthGray,
                      fontSize: 26.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              LinkCustom(
                  controller: controller,
                  icon: Icons.policy,
                  iconcor: ConstColors.colorDarkBlueGray,
                  iconSize: 30,
                  textSize: 18.0,
                  textCor: controller.colorLinkPolicy!,
                  text: ConstString.policy,
                  top: 18.0,
                  rigth: 10.0,
                  left: 10.0,
                  url: ConstStringUrl.urlPrivacyPolicy),
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
                      color: ConstColors.colorLigthGray,
                      fontSize: 28.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              LinkCustom(
                  controller: controller,
                  icon: Icons.file_present,
                  iconcor: ConstColors.colorDarkBlueGray,
                  iconSize: 30,
                  textSize: 18.0,
                  textCor: controller.colorLinkDoc!,
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
