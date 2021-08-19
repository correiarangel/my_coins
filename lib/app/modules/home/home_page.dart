import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_coins/app/modules/home/card_coin.dart';
import 'package:my_coins/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("My Coin",
          style: TextStyle(color: Colors.white)
        ),
        /* actions: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.login_outlined, color: Colors.black),
            label: Text(""),
          )
        ], */
      ),
      body: Observer(
        builder: (context) {
          if (controller.coins?.error != null) {
            return Center(
                child: TextButton.icon(
              autofocus: true,
              icon: Icon(Icons.refresh),
              label: Text(
                "Ops! Algo errado; Click p/ Recarregar !",
                style: TextStyle(color: Colors.red[600], fontSize: 18.0),
              ),
              onPressed: () {
                controller.fetchCoins();
              },
            ));
          } else if (controller.coins?.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var listCoins = controller.coins?.value;
            return ListView.builder(
              itemCount: listCoins?.length,
              itemBuilder: (context, index) {
                return CardCoin(coins: listCoins, index: index);

                /* ListTile(
                  title: Text(listCoins![index].name.toString()),
                  subtitle: Text(listCoins[index].high.toString()),
                ); */
              },
            );
          }
        },
      ),
    );
  }
}
