import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_coins/app/shared/interface/coin_repository_interface.dart';
import 'package:my_coins/app/shared/models/coins_days_model.dart';
import 'package:my_coins/app/shared/models/coins_model.dart';
import 'package:my_coins/app/shared/services/client_http_service.dart';

class CoinRepositoryMock extends Mock implements ICoinRepository {}

class ClientServiceHttpMoc extends Mock implements ClientHttpService {}

///acredite é possivel ...
void main() {
  late ICoinRepository repository;

  setUpAll(() {
    print("Tests Repository");
  });
  setUp(() {
    print("Iniciando teste");

    repository = CoinRepositoryMock();
  });

  tearDown(() {
    print("Finalizando teste");
  });
  tearDownAll(() {
    print("Finalizando Repository");
  });
  test('Deve retornar Lista do tipo CoinModel com uma posição ', () async {
    var coins = <CoinModel>[];
    coins.add(CoinModel.empty());
    //arrage
    when(() => repository.getAllCoins(siglaCoin: 'USD')).thenAnswer(
      (_) async => coins,
    );
    expect(coins, isA<List<CoinModel>>());
    expect(coins.length, 1);
  });

  test('Deve retornar lista CoinModel com zero posição...', () async {
    //arrage
    var coins = <CoinModel>[];
    when(() => repository.getAllCoins(siglaCoin: 'USD')).thenAnswer((_) async {
      return coins;
    });

    expect(coins.length, 0);
  });

  test('Deve retornar Lista do tipo CoinDaysModel com uma posição ', () async {
    //arrage
    coinsDays.add(CoinDaysModel.empty());
    when(() => repository.getPeriodCoins(siglaCoin: "USD", days: "8"))
        .thenAnswer(
      (_) async => coinsDays,
    );
    expect(coinsDays, isA<List<CoinDaysModel>>());
    expect(coinsDays.length, 1);
  });

  test('Deve dar erro se parametro errado para CoinDaysModel...', () async {
    when(() => repository.getPeriodCoins(siglaCoin: "", days: ""))
        .thenAnswer((_) async {
      return coinsDays;
    });
    expect(coinsDays, coinsDays);
  });
}

var response = {
  "USD": {
    "code": "USD",
    "codein": "BRL",
    "name": "Dólar Americano/Real Brasileiro",
    "high": "5.1982",
    "low": "5.1979",
    "varBid": "0.0015",
    "pctChange": "0.03",
    "bid": "5.1967",
    "ask": "5.1997",
    "timestamp": "1628024400",
    "create_date": "2021-08-03 21:00:02"
  }
};
var coinsDays = <CoinDaysModel>[];
