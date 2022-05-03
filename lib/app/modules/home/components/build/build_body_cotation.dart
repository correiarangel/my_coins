import 'package:flutter/material.dart';

import '../../../../shared/util/value/const_colors.dart';
import '../../controllers/home_store.dart';
import '../horizontl_list.dart';
import '../return_card_custom.dart';
import '../return_card_grafic.dart';
import 'build_header.dart';

class BuildBodyCotation extends StatelessWidget {
  final BuildContext context;
  final HomeStore controller;
  const BuildBodyCotation({
    Key? key,
    required this.context,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.changesIsNet();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BuildHeader(
            titulo: "My Coins",
            context: context,
            screen: 'quotation',
          ),
          SizedBox(height: 28.0),
          Text(
            "Cambios, selecione a moéda:",
            style: TextStyle(
                color: ConstColors.colorDarkBlueGray,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,),
          ),
          HorizontlList(controller: controller),
          ReturnCardCuston(controller: controller),
          SizedBox(height: 8.0),
          SizedBox(height: 8.0),
          ReturnCardGrafic(controller: controller),
        ],
      ),
    );
  }
}
