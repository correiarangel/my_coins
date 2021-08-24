import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_coins/app/modules/home/components/card_coin_convert.dart';

import '../../../shared/util/general_functions.dart';
import '../../../shared/util/value/const_colors.dart';
import 'card_about.dart';
import 'card_custom.dart';

class WidGetCustm {
  final genFunctions = Modular.get<GeneralFunctions>();
  Widget sizeBoxDivisor() {
    return SizedBox(
      height: 28.0,
      child: Divider(
          height: 3.0,
          thickness: 3.0,
          indent: 50.0,
          endIndent: 50.0,
          color: ConstColors.colorDarkBlueGray),
    );
  }

  Widget btnSearsh(controller) {
    return TextButton.icon(
      icon:
          Icon(Icons.search, color: ConstColors.colorDarkBlueGray, size: 38.0),
      label: Text("Pesquisar outra moéda"),
      onPressed: () {},
    );
  }

  Widget flotBtnSearsh(controller) {
    return FloatingActionButton(
      elevation: 8.0,
      hoverColor: ConstColors.colorDarkBlueGray,
      backgroundColor: ConstColors.colorSkyMagenta,
      child: Icon(
        Icons.search,
        color: ConstColors.colorDarkBlueGray,
        size: 38.0,
      ),
      onPressed: () {},
    );
  }

  Container buildHeader(String? titulo, BuildContext _context, _controller,
      {int? index = 0, String pais = '', required String? screen}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 32.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(21.0),
          bottomRight: Radius.circular(21.0),
        ),
        boxShadow: [
          BoxShadow(
            color: ConstColors.colorSkyMagenta,
            blurRadius: 10.0,
          ),
        ],
        color: ConstColors.colorSpaceCadet,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 5.0),
          ListTile(
            title: Text(
              titulo == null ? "My Conis" : titulo,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0,
                  color: ConstColors.colorLavenderFloral),
            ),
          ),
          const SizedBox(height: 5.0),
          screen == 'about'
              ? Container()
              : Container(
                  alignment: Alignment.topLeft,
                  child: TextButton.icon(
                    icon: Icon(
                      Icons.search_rounded,
                      color: ConstColors.colorLavenderFloral,
                      size: 31.0,
                    ),
                    label: Text(
                      "Pesquisar Moéda",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: ConstColors.colorLavenderFloral,
                      ),
                    ),
                    onPressed: () async {
                      print("Pequise moeda................");
                    },
                  ),
                ),
        ],
      ),
    );
  }

  Widget buildBodyCotation(BuildContext context, controller) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildHeader("My Coins", context, controller, screen: 'cotation'),
        SizedBox(height: 28.0),
        Text(
          "Cotação de Moédas",
          style: TextStyle(
              color: ConstColors.colorDarkBlueGray,
              fontSize: 22.0,
              fontWeight: FontWeight.bold),
        ),
        Observer(
          builder: (context) {
            if (controller.coins?.error != null) {
              return Center(
                  child: TextButton.icon(
                autofocus: true,
                icon: Icon(Icons.refresh),
                label: Text(
                  "Ops! Algo errado; Click p/ Recarregar !",
                  style: TextStyle(
                      color: ConstColors.colorSkyMagenta, fontSize: 18.0),
                ),
                onPressed: () {
                  controller.fetchCoins();
                },
              ));
            } else if (controller.coins?.value == null) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: ConstColors.colorSkyMagenta,
                ),
              );
            } else {
              var listCoins = controller.coins?.value;
              return Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: CardCustom(
                    coins: listCoins, index: 0, controller: controller),
              );
            }
          },
        ),
      ],
    ));
  }

  Widget buildBodyCovert(BuildContext context, controller) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildHeader("My Coins", context, controller, screen: 'convert'),
        SizedBox(height: 28.0),
        Text(
          "Converter Moéda",
          style: TextStyle(
              color: ConstColors.colorDarkBlueGray,
              fontSize: 22.0,
              fontWeight: FontWeight.bold),
        ),
        Observer(
          builder: (context) {
            if (controller.coins?.error != null) {
              return Center(
                  child: TextButton.icon(
                autofocus: true,
                icon: Icon(Icons.refresh),
                label: Text(
                  "Ops! Algo errado; Click p/ Recarregar !",
                  style: TextStyle(
                      color: ConstColors.colorSkyMagenta, fontSize: 18.0),
                ),
                onPressed: () {
                  controller.fetchCoins();
                },
              ));
            } else if (controller.coins?.value == null) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: ConstColors.colorSkyMagenta,
                ),
              );
            } else {
              return CardCoinConvert(
                  coins: controller.coins?.value,
                  index: 0,
                  controller: controller);
            }
          },
        ),
      ],
    ));
  }

  Widget buildBodyAbout(context, controller) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildHeader("My Coins", context, controller, screen: 'about'),
          const SizedBox(height: 30.0),
          CardAbout(version: controller.version, controller: controller),
          const SizedBox(height: 21.0),
        ],
      ),
    );
  }

  ///barra inferior
  Widget buildBottomBar(controller) {
    return BottomNavigationBar(
      selectedItemColor: ConstColors.colorSkyMagenta,
      unselectedItemColor: Colors.grey,
      backgroundColor: ConstColors.colorSpaceCadet,
      currentIndex: controller.currentIndex,
      onTap: controller.changePage,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.poll,
            color: ConstColors.colorDarkBlueGray,
          ),
          // ignore: deprecated_member_use
          title: Text("Cotação"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calculate, color: ConstColors.colorDarkBlueGray),
          // ignore: deprecated_member_use
          title: Text("Converter"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info, color: ConstColors.colorDarkBlueGray),
          // ignore: deprecated_member_use
          title: Text("Info"),
        ),
      ],
    );
  }

  Widget? buildBody(controller, context) {
    switch (controller.currentIndex) {
      case 0:
        return buildBodyCotation(context, controller);
      case 1:
        return buildBodyCovert(context, controller);
      case 2:
        return buildBodyAbout(context, controller);
    }
  }
}
