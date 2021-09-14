import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_coins/app/shared/models/coins_model.dart';
import 'package:my_coins/app/shared/repository/coin_repository.dart';

class CoinRepositoryMock extends Mock implements CoinRepository {}

///acredite é possivel ...
void main() {
  final repository = CoinRepositoryMock();

  setUp(() {
    print("Iniciando tests Repository");
  });

  tearDown(() {
    print("Finalizando test Repository");
  });

  test('Deve retornar Lista do tipo CoinModel ', () async {
    //arrage
    var coins = <CoinModel>[];
    when(() => repository.getAllCoins(any())).thenAnswer((_) async => coins);
    //act
    //coins = await repository.getAllCoins('USD');
    //assert
    expect(coins, isA<List<CoinModel>>());
    expect(coins.isEmpty, true);
  });

  test('Deve dar erro se parametro errado ...', () async {
    //arrage
    var coins;
    when(() => repository.getAllCoins('')).thenAnswer((_) async {
      return coins;
    });
    //act
    //coins = await repository.getAllCoins('');
    //assert
    //expect(coins, 'Excepiton Error Get');
    expect(coins, null);
  });
}

var response =
    '{"USD": {"code": "USD","codein": "BRL","name": "Dólar Americano/Real Brasileiro","high": "5.1982","low": "5.1979","varBid": "0.0015","pctChange": "0.03","bid": "5.1967","ask": "5.1997","timestamp": "1628024400","create_date": "2021-08-03 21:00:02"}}';
