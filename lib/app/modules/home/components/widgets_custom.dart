import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_coins/app/modules/home/components/card_about.dart';
import 'package:my_coins/app/modules/home/components/card_custom.dart';
import 'package:my_coins/app/modules/home/components/option_button.dart';
import 'package:my_coins/app/shared/util/general_functions.dart';
import 'package:my_coins/app/shared/util/value/const_colors.dart';
import 'package:my_coins/app/shared/util/value/const_srtring_url.dart';

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
      {int? index = 0, String pais = '', required String? sceen}) {
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
          Container(
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

  Widget scaffoldMain(controller) {
    return Scaffold(
      backgroundColor: ConstColors.colorSpaceCadet,
      appBar: AppBar(
        backgroundColor: ConstColors.colorSpaceCadet,
        title: Text("My Coins",
            style: TextStyle(color: ConstColors.colorDarkBlueGray)),
        actions: [],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 28.0),
          Text(
            "Cotação de Cambios",
            style: TextStyle(
                color: ConstColors.colorDarkBlueGray,
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Observer(
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
                  return ListView.builder(
                    itemCount: listCoins?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: CardCustom(
                            coins: listCoins,
                            index: index,
                            controller: controller),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
      floatingActionButton: flotBtnSearsh(controller),
    );
  }

  Widget buildBodyCotation(BuildContext context, controller) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildHeader("My Coins", context, controller, sceen: 'cotation'),
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
        buildHeader("My Coins", context, controller, sceen: 'convert'),
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
              var listCoins = controller.coins?.value;
              return Text("1 Real vale 0,18 de Dollar");
            }
          },
        ),
      ],
    ));
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

  Widget buildBodyAbout(context, controller) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildHeader("My Coins", context, controller, sceen: 'about'),
          const SizedBox(height: 30.0),
          CardAbout(version: controller.version),
          OptionsButton(
            btnicon: Icons.email,
            iconcor: ConstColors.colorDarkBlueGray,
            btncor: ConstColors.colorSkyMagenta,
            corText: ConstColors.colorDarkBlueGray,
            textSize: 18.0,
            text: "ENVIAR E-MAIL @             ",
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
            text: "VISITAR LINKDIN             ",
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
            text: "VISITAR GUITHUB             ",
            top: 21.0,
            rigth: 12.0,
            left: 12.0,
            callback: () {
              controller.launchURL(ConstStringUrl.urlGuitHub);
            },
          ),
          const SizedBox(height: 21.0),
        ],
      ),
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
