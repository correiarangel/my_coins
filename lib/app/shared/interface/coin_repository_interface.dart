import '../models/coins_days_model.dart';
import '../models/coins_model.dart';

abstract class ICoinRepository {
  Future<List<CoinModel>> getAllCoins(String siglaCoin);
  Future<List<CoinDaysModel>> getPeriodCoins(String siglaCoin, String days);
}
