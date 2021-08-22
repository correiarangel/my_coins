import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_coins/app/shared/util/value/const_colors.dart';

// ignore: must_be_immutable
class CardAbout extends StatelessWidget {

  final String? version;

  CardAbout({Key? key,required this.version}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
