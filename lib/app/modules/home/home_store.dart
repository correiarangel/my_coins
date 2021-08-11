import 'package:mobx/mobx.dart';
import 'package:my_coins/app/shared/models/coins_model.dart';
import 'package:my_coins/app/shared/repository/coin_repository.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final CoinRepository repository;

  @observable
  ObservableFuture<List<CoinModel>>? coins;

  HomeStoreBase(this.repository) {
    fetchCoins();
  }

  @action
  fetchCoins() {
    coins = repository.getAllCoins()?.asObservable();
    print("COIN VAL ${coins?.value?[0].name}");
  }
}
