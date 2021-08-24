import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_coins/app/modules/home/components/option_button.dart';
import 'package:my_coins/app/modules/home/components/widgets_custom.dart';
import 'package:my_coins/app/shared/util/value/const_colors.dart';
import 'package:my_coins/app/shared/util/value/const_srtring_url.dart';

// ignore: must_be_immutable
class CardAbout extends StatelessWidget {
  final widGetCustm = WidGetCustm();
  final String? version;
  final controller;

  CardAbout({Key? key, required this.version, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget sizeBoxDivisor = widGetCustm.sizeBoxDivisor();
    return Padding(
        padding: EdgeInsets.only(
          left: 10.0, right: 10.0,top: 18.0 ,bottom: 18.0),
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
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 28.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //date
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
                    padding: EdgeInsets.only(left: 4.0, right: 4.0),
                    child: Text(
                      "O App My Coins desenvolvido para consulta e exibe,"
                      "dados cambiais, cotação de moédas de varios paises.\n"
                      "Com visual simple e amigavel e thema inspirado no "
                      "consolidade thema Dracula.\n",
                      style: TextStyle(
                          color: ConstColors.colorLavenderFloral,
                          fontSize: 20.0),
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
                          color: ConstColors.colorLigthGray,
                          fontSize: 28.0),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(left: 4.0, right: 4.0),
                    child: Text(
                      "Marcos Rangel, desenvolvedor móbile.\n"
                      "Tenha um aplicativo personalisado para seu negócio.\n"
                      "Entre em contato pelas midia sociais ;] \n",
                      style: TextStyle(
                          color: ConstColors.colorLavenderFloral,
                          fontSize: 20.0),
                      textAlign: TextAlign.center,
                    )),
                sizeBoxDivisor,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //coin
                    Icon(
                      Icons.contact_phone,
                      color: ConstColors.colorDarkBlueGray,
                      size: 28.0,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "Contato",
                      style: TextStyle(
                          color: ConstColors.colorLigthGray,
                          fontSize: 28.0),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                OptionsButton(
                  btnicon: Icons.email,
                  iconcor: ConstColors.colorDarkBlueGray,
                  btncor: ConstColors.colorSkyMagenta,
                  corText: ConstColors.colorDarkBlueGray,
                  textSize: 18.0,
                  text: "ENVIAR E-MAIL @",
                  top: 21.0,
                  rigth: 12.0,
                  left: 12.0,
                  callback: () {
                    controller.launchURL(ConstStringUrl.urlEmail);
                  },
                ),
                OptionsButton(
                  btnicon: Icons.pages,
                  iconcor: ConstColors.colorDarkBlueGray,
                  btncor: ConstColors.colorSkyMagenta,
                  corText: ConstColors.colorDarkBlueGray,
                  textSize: 18.0,
                  text: "VISITAR LINKDIN",
                  top: 21.0,
                  rigth: 12.0,
                  left: 12.0,
                  callback: () {
                    controller.launchURL(ConstStringUrl.urlLinkDin);
                  },
                ),
                OptionsButton(
                  btnicon: Icons.category,
                  iconcor: ConstColors.colorDarkBlueGray,
                  btncor: ConstColors.colorSkyMagenta,
                  corText: ConstColors.colorDarkBlueGray,
                  textSize: 18.0,
                  text: "VISITAR GUITHUB",
                  top: 21.0,
                  rigth: 12.0,
                  left: 12.0,
                  callback: () {
                    controller.launchURL(ConstStringUrl.urlGuitHub);
                  },
                ),
                const SizedBox(height: 28.0),
              ],
            ),
 
        ));

  }
}



    /*  Card(
      shadowColor: ConstColors.colorCadetGrey,
      elevation: 8.0,
      color: ConstColors.colorSpaceCadet,
      margin: const EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                child: Text(
                  "Info:",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 21.0),
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Versão: $version\n"
                  "O aplicativo My Coins consulta e exibe "
                  "dados cambiais, cotação de moédas de"
                  "varios paises .\n"
                  "Desenvolvido por: Marcos Rangel,Desenvolvedor Mobile\n",
                  style: TextStyle(
                      color: ConstColors.colorLavenderFloral, fontSize: 18.0),
                ),
              ),
            ),
          ),
        ],
      ),
    ); */