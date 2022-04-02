import '../models/coins_days_model.dart';
import '../models/coins_model.dart';

abstract class ICoinRepository {
  Future<List<CoinModel>> getAllCoins({
    required String siglaCoin,
  });
  Future<List<CoinDaysModel>> getPeriodCoins({
    required String siglaCoin,
    required String days,
  });
}
