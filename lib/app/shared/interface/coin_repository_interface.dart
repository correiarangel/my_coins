import '../models/coins_model.dart';

abstract class ICoinRepository {
  Future<List<CoinModel>>? getAllCoins( String siglaCoin) {}
}