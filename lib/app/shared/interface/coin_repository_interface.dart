import 'package:my_coins/app/shared/models/coins_model.dart';

abstract class ICoinRepository {
  Future<List<CoinModel>>? getAllCoins() {}
}