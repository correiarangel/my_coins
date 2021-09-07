import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_coins/app/modules/home/components/card_siglas.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'card_coin_convert.dart';
import '../controllers/home_store.dart';
import '../../../shared/models/coins_parc_model.dart';
import '../../../shared/util/value/const_srtring.dart';

import '../../../shared/util/general_functions.dart';
import '../../../shared/util/value/const_colors.dart';
import 'card_about.dart';
import 'card_custom.dart';

class WidGetCustm {
  final genFunctions = Modular.get<GeneralFunctions>();
  List<DropdownMenuItem<String>> listaItensDropResp = [];
  final controller = Modular.get<HomeStore>();

  final Widget circularProgress = Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      const SizedBox(height: 48.0),
      CircularProgressIndicator(
        backgroundColor: ConstColors.colorSkyMagenta,
      ),
    ],
  );

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

  Widget flotBtnSearsh() {
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

  Container buildHeader(String? titulo, BuildContext _context,
      {required String? screen}) {
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
        ],
      ),
    );
  }

  Widget buildBodyCotation(BuildContext context) {
    //initItensDropdown();
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildHeader("My Coins", context, screen: 'quotation'),
        SizedBox(height: 28.0),
        Text(
          "Cambios, escolha a moéda:",
          style: TextStyle(
              color: ConstColors.colorDarkBlueGray,
              fontSize: 22.0,
              fontWeight: FontWeight.bold),
        ),
        horizontlList(),
        Observer(
          builder: (context) {
            if (controller.coins?.error != null) {
              return Center(
                  child: TextButton.icon(
                autofocus: true,
                icon: Icon(Icons.refresh),
                label: Text(
                  "Ops! Click p/ Recarregar !",
                  style: TextStyle(
                      color: ConstColors.colorSkyMagenta, fontSize: 18.0),
                ),
                onPressed: () {
                  controller.fetchCoins(controller.itemSelect!);
                },
              ));
            } else if (controller.coins?.value == null) {
              return circularProgress;
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

  Widget buildBodyCovert(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildHeader("My Coins", context, screen: 'convert'),
        SizedBox(height: 28.0),
        Text(
          "Converter Moéda",
          style: TextStyle(
              color: ConstColors.colorDarkBlueGray,
              fontSize: 22.0,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 30.0),
        Observer(
          builder: (context) {
            if (controller.coins?.error != null) {
              return Center(
                  child: TextButton.icon(
                autofocus: true,
                icon: Icon(Icons.refresh),
                label: Text(
                  "Ops! Click p/ Recarregar !",
                  style: TextStyle(
                      color: ConstColors.colorSkyMagenta, fontSize: 18.0),
                ),
                onPressed: () {
                  controller.fetchCoins(controller.itemSelect!);
                },
              ));
            } else if (controller.coins?.value == null) {
              return circularProgress;
            } else {
              controller.changesTextValidat('0');
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

  Widget buildBodyAbout(context ,RateMyApp rateMyApp,rateMyAppController) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildHeader("My Coins", context, screen: 'about'),
          const SizedBox(height: 30.0),
          CardAbout(
            controller: controller,
            rateMyApp: rateMyApp,
            rateMyAppController:rateMyAppController,
          ),
          const SizedBox(height: 21.0),
        ],
      ),
    );
  }

  ///barra inferior
  Widget buildBottomBar() {
    return Observer(
      builder: (context) {
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
      },
    );
  }

  Widget? buildBody(context,RateMyApp rateMyApp,rateMyAppController) {
    switch (controller.currentIndex) {
      case 0:
        return buildBodyCotation(context);
      case 1:
        return buildBodyCovert(context);
      case 2:
        return buildBodyAbout(context,rateMyApp,rateMyAppController);
    }
  }

  Widget horizontlList() {
    List<CoinParcModel> listCoins = fillListSiglas();
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        height: 120.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listCoins.length,
          itemBuilder: (context, index) {
            return CardSiglas(
                coins: listCoins, index: index, controller: controller);
          },
        ));
  }

  List<CoinParcModel> fillListSiglas() {
    Iterable interbleCoins = ConstString.listSiglaCoins;
    return interbleCoins
        .map((coinpmodel) => CoinParcModel.fromJson(coinpmodel))
        .toList();
  }
}
