import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:screenshot/screenshot.dart';

import '../../../shared/models/coins_model.dart';
import '../../../shared/models/coins_parc_model.dart';
import '../../../shared/util/general_functions.dart';
import '../../../shared/util/value/const_colors.dart';
import '../../../shared/util/value/const_srtring.dart';
import '../components/card_about.dart';
import '../components/card_coin_convert.dart';
import '../components/card_custom.dart';
import '../components/card_grafic.dart';
import '../components/card_siglas.dart';
import '../components/row_custom.dart';
import 'home_store.dart';
import 'interface/widgets_controller_interface.dart';

class WidGetController implements IWidGetController {
  ScreenshotController? screenshot;
  final genFunctions = Modular.get<GeneralFunctions>();
  final controller = Modular.get<HomeStore>();
  WidGetController() {
    screenshot = ScreenshotController();
  }
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
  @override
  Center btnIconError(String title, String msg, IconData icon) {
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
          controller.fetchCoins(controller.itemSelect!);
        },
      ),
    );
  }

  @override
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

  @override
  FloatingActionButton flotBtnSearsh() {
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

  @override
  Container buildHeader(String? titulo, BuildContext? _context,
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
        children: <Widget>[
          const SizedBox(height: 5.0),
          ListTile(
            title: Text(
              titulo == null ? "My Conis" : titulo,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21.0,
                color: ConstColors.colorLavenderFloral,
              ),
            ),
          ),
          const SizedBox(height: 5.0),
        ],
      ),
    );
  }

  @override
  Widget isInternetBuild() {
    Widget? winget;

    if (controller.isNet == true) {
      winget = btnIconError("Ops!...", ConstString.msgErroLoand, Icons.refresh);
    } else if (controller.isNet == false) {
      winget = btnIconError("Ops!...", ConstString.msgNotNet, Icons.wifi_off);
    } else {
      winget =
          btnIconError("Ops!, Erro", ConstString.msgErroLoand, Icons.refresh);
    }
    return winget;
  }

  @override
  SingleChildScrollView buildBodyCotation(BuildContext? context) {
    //initItensDropdown();
    controller.changesIsNet();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildHeader("My Coins", context!, screen: 'quotation'),
          SizedBox(height: 28.0),
          Text(
            "Cambios, selecione a moéda:",
            style: TextStyle(
                color: ConstColors.colorDarkBlueGray,
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
          horizontlList(),
          returnCardCustom(),
          SizedBox(height: 8.0),
          RowCustom(controller: controller),
          SizedBox(height: 8.0),
          returnCardGrafic(),
        ],
      ),
    );
  }

  @override
  Widget returnCardCustom() {
    return Observer(
      builder: (context) {
        if (controller.coins?.error != null) {
          return isInternetBuild();
        } else if (controller.coins?.value == null) {
          return circularProgress;
        } else {
          var listCoins = controller.coins?.value;

          return Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              bottom: 20.0,
            ),
            child: Screenshot(
              controller: screenshot!,
              child: CardCustom(
                screenshot: screenshot!,
                coins: listCoins,
                index: 0,
                controller: controller,
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget returnCardGrafic() {
    return Observer(
      builder: (context) {
        if (controller.coinsDays?.error != null) {
          return Container();
        } else if (controller.coinsDays?.value == null) {
          return controller.progssVariation ? circularProgress : Container();
        } else {
          var _listCoins = controller.coinsDays?.value;

          return Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              bottom: 20.0,
            ),
            child: CardGrafic(
              coinsDays: _listCoins,
              param: 'bid',
              controller: controller,
            ),
          );
        }
      },
    );
  }

  @override
  SingleChildScrollView buildBodyCovert(BuildContext? context) {
    controller.changesIsNet();
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildHeader("My Coins", context!, screen: 'convert'),
        SizedBox(height: 28.0),
        Text(
          "Converter Moeda",
          style: TextStyle(
              color: ConstColors.colorDarkBlueGray,
              fontSize: 22.0,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 30.0),
        Observer(
          builder: (context) {
            if (controller.coins?.error != null) {
              return isInternetBuild();
            } else if (controller.coins?.value == null) {
              return circularProgress;
            } else {
              //controller.changesTextValidat('0');
              return Screenshot(
                controller: screenshot!,
                child: CardCoinConvert(
                  coins: controller.coins?.value,
                  index: 0,
                  controller: controller,
                  screenshot: screenshot!,
                ),
              );
            }
          },
        ),
      ],
    ));
  }

  @override
  SingleChildScrollView buildBodyAbout(
    context,
    RateMyApp rateMyApp,
    rateMyAppController,
  ) {
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
            rateMyAppController: rateMyAppController,
          ),
          const SizedBox(height: 21.0),
        ],
      ),
    );
  }

  ///barra inferior
  @override
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
              title: Text("Cambios"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
                color: ConstColors.colorDarkBlueGray,
              ),
              // ignore: deprecated_member_use
              title: Text("Converter"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
                color: ConstColors.colorDarkBlueGray,
              ),
              // ignore: deprecated_member_use
              title: Text("Info"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget? buildBody(context, RateMyApp rateMyApp, rateMyAppController) {
    switch (controller.currentIndex) {
      case 0:
        return buildBodyCotation(context);
      case 1:
        return buildBodyCovert(context);
      case 2:
        return buildBodyAbout(context, rateMyApp, rateMyAppController);
    }
  }

  @override
  Container horizontlList() {
    // ignore: omit_local_variable_types
    List<CoinsParcModel> listCoins = fillListSiglas();
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        height: 120.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listCoins.length,
          itemBuilder: (context, index) {
            return CardSiglas(
              coins: listCoins,
              index: index,
              controller: controller,
            );
          },
        ));
  }

  @override
  List<CoinsParcModel> fillListSiglas() {
    Iterable interbleCoins = ConstString.listSiglaCoins;
    return interbleCoins
        .map((coinpmodel) => CoinsParcModel.fromJson(coinpmodel))
        .toList();
  }

  @override
  Text testCoinsText({
    required List<CoinModel>? coins,
    required int index,
  }) {
    String? text;
    coins![index].code == "BTC"
        ? text = "R\$ ${controller.valueConvertion!}"
        : text = genFunctions.formatNumberBr(controller.valueConvertion!);

    return Text(
      "${controller.textValidat == null ? '0' : controller.textValidat}"
      ", ${coins[index].name?.replaceAll("/Real Brasileiro", "")}"
      " vale(m)\n "
      " $text "
      "Real(s)",
      style: TextStyle(
        color: ConstColors.colorLavenderFloral,
        fontSize: 22.0,
      ),
      textAlign: TextAlign.center,
    );
  }

  @override
  Text testTextBr({
    required List<CoinModel>? coins,
    required int index,
  }) {
    return Text(
      "${controller.textValidat == null ? '0' : controller.textValidat}"
      " Real(s) vale(m)\n "
      "${genFunctions.formatNumberUs(controller.valueConvertion!)} "
      "${coins?[index].name?.replaceAll("/Real Brasileiro", "")}",
      style: TextStyle(
        color: ConstColors.colorLavenderFloral,
        fontSize: 22.0,
      ),
      textAlign: TextAlign.center,
    );
  }

  @override
  Text testTextCustom({
    required List<CoinModel>? coins,
    required int index,
  }) {
    String? text;
    coins![index].code == "BTC"
        ? text = "R\$ ${coins[index].bid}"
        : text = "R\$ ${genFunctions.formatNumberBr("${coins[index].bid}")}";

    return Text(
      "1 : ${coins[index].code} igual a\n"
      " $text",
      style: TextStyle(
        color: ConstColors.colorLavenderFloral,
        fontSize: 28.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}
