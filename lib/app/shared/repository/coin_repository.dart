import 'dart:convert';

import '../interface/coin_repository_interface.dart';
import '../models/coins_days_model.dart';
import '../models/coins_model.dart';
import '../services/client_http_service.dart';
import '../util/value/const_srtring_url.dart';

class CoinRepository implements ICoinRepository {
  final ClientHttpService client;
  CoinRepository(this.client);

  @override
  Future<List<CoinModel>> getAllCoins(String siglaCoins) async {
    var response = await client.get(ConstStringUrl.routerAllCoins);
    // ignore: unused_local_variable
    var listCoins;
    if (response.statusCode == 200) {
      Iterable interbleCoins = json.decode("[$response]");
      return listCoins = interbleCoins
          .map((comodel) => CoinModel.fromJson(comodel[siglaCoins]))
          .toList();
    } else {
      var _listCoins = <CoinModel>[];
      return _listCoins;
    }
  }

  @override
  Future<List<CoinDaysModel>> getPeriodCoins(
    String siglaCoin,
    String days,
  ) async {
    var url = ConstStringUrl.urlSevenDay;

    var response = await client.get("$url$siglaCoin/$days/");

    if (response.statusCode == 200) {
      response.data.removeAt(0);
      Iterable interbleCoins = response.data;
      return interbleCoins
          .map((comodel) => CoinDaysModel.fromJson(comodel))
          .toList();
    } else {
      var listCoins = <CoinDaysModel>[];
      return listCoins;
    }
  }
}
