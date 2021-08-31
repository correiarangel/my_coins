import 'dart:convert';

import '../interface/coin_repository_interface.dart';
import '../models/coins_model.dart';
import '../services/client_http_service.dart';
import '../util/value/const_srtring_url.dart';

class CoinRepository implements ICoinRepository {

  final ClientHttpService client;
  CoinRepository(this.client);

  @override
  Future<List<CoinModel>>? getAllCoins(String siglaCoins) async {
    var response = await client.get(ConstStringUrl.routerAllCoins);
    var listCoins;
    if (response.statusCode == 200) {
      Iterable interbleCoins = json.decode("[$response]");
      return listCoins = interbleCoins
          .map((comodel) => CoinModel.fromJson(comodel[siglaCoins]))
          .toList();
    } else {
      return listCoins;
    }
  }
}
