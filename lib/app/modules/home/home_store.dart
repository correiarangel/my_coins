import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:my_coins/app/shared/models/coins_model.dart';
import 'package:my_coins/app/shared/repository/coin_repository.dart';
import 'package:my_coins/app/shared/util/general_functions.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home_store.g.dart';

// User Case
class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final genFunctions = Modular.get<GeneralFunctions>();
  final CoinRepository repository;

  @observable
  ObservableFuture<List<CoinModel>>? coins;

  HomeStoreBase(this.repository) {
    fetchCoins();
    changeVersion();
  }

  @action
  fetchCoins() {
    coins = repository.getAllCoins()?.asObservable();
    changeDateUpgrade("${coins?.value?[0].createDate}");
    print("COIN VAL ${coins?.value?[0].name}");
  }

  @observable
  int currentIndex = 0;
  @action
  changePage(int index) => currentIndex = index;

  @observable
  String dateUpgrade = "";
  @action
  changeDateUpgrade(String? value) =>
      value != null ? dateUpgrade = value : dateUpgrade;

  launchURL(_url) async {
    final url = Uri.encodeFull(_url);
    await launch(url);
  }

  @observable
  String? version = "";
  @action
  changeVersion() async {
    version = await genFunctions.getBuildAndVersion();
  }
}
