import 'dart:convert';

import 'package:my_coins/app/shared/interface/coin_repository_interface.dart';
import 'package:my_coins/app/shared/models/coins_model.dart';
import 'package:my_coins/app/shared/services/client_http_service.dart';
import 'package:my_coins/app/shared/util/const_srtring_url.dart';

class CoinRepository implements ICoinRepository {
  final ClientHttpService client;

  CoinRepository(this.client);

  @override
  Future<List<CoinModel>>? getAllCoins() async {
    var response = await client.get(ConstStringUrl.routerAllCoins);

    var listCoins;

    if (response.statusCode == 200) {
      Iterable interbleCoins = json.decode("[$response]");
      return listCoins =
          interbleCoins.map((comodel) => 
          CoinModel.fromJson(comodel['ARS'])).toList();
    } else {
      return listCoins;
    }
  }
}
