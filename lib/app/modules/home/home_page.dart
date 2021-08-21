import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_coins/app/modules/home/components/card_coin.dart';
import 'package:my_coins/app/modules/home/components/card_custom.dart';
import 'package:my_coins/app/modules/home/components/widgets_custom.dart';
import 'package:my_coins/app/modules/home/home_store.dart';
import 'package:my_coins/app/shared/util/const_colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final widGetCustom = WidGetCustm();
  @override
  Widget build(BuildContext context) {
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

                        /* ListTile(
                  title: Text(listCoins![index].name.toString()),
                  subtitle: Text(listCoins[index].high.toString()),
                ); */
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
        floatingActionButton: widGetCustom.flotBtnSearsh(controller),
    );
        
  }
  
}

        /* 
        
        height: 896,
        decoration: BoxDecoration(
          color: ConstColors.colorIsabelline,
          gradient: LinearGradient(
            colors: [ConstColors.colorGreenMain, ConstColors.colorIsabelline],
            begin: Alignment(3.0, -2.0),
            end: Alignment(0.0, 0.0),
          ),
        ),
        
         */