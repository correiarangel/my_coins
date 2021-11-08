import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:my_coins/app/app_module.dart';
import 'package:my_coins/app/modules/home/controllers/home_store.dart';
import 'package:my_coins/app/modules/home/controllers/widgets_controller.dart';
import 'package:my_coins/app/modules/home/home_module.dart';
import 'package:my_coins/app/shared/models/coins_model.dart';
import 'package:my_coins/app/shared/repository/coin_repository.dart';
import 'package:my_coins/app/shared/services/client_http_service.dart';
import 'package:my_coins/app/shared/util/general_version.dart';

class DioMock extends Mock implements DioForNative {}

class ClientHttpServiceMock extends Mock implements ClientHttpService {}

class CoinRepositoryMock extends Mock implements CoinRepository {
  final ClientHttpService client;
  CoinRepositoryMock(this.client);
}

class HomeStoreMock extends Mock implements HomeStore {
  final CoinRepository repository;
  HomeStoreMock(this.repository);
}

class GeneralVersionMock extends Mock implements GeneralVersion {}

class WidgetControllerMock extends Mock implements WidGetController {}

void main() {
  final dioMock = DioMock();
  final client = ClientHttpServiceMock();
  final repository = CoinRepositoryMock(client);
  final homeStore = HomeStoreMock(repository);
  final widGetController = WidgetControllerMock();
  final generalVersion = GeneralVersionMock();

  // ignore: unused_element
  setUp() {
    print("Iniciando tests HomeStore");
    initModule(AppModule(), replaceBinds: [
      Bind.instance<Dio>(dioMock),
    ]);

    initModule(HomeModule(), replaceBinds: [
      Bind.instance<CoinRepository>(repository),
      Bind.instance<HomeStore>(homeStore),
      Bind.instance<GeneralVersion>(generalVersion),
      Bind.instance<WidGetController>(widGetController),
    ]);
  }

  tearDown(() {
    print("Finalizando test HomeStore");
  });
  test('home store ...', () async {
    var coins = <CoinModel>[];
    when(() => homeStore.fetchCoins(any())).thenAnswer(
      (_) async => coins,
    );
    //act
    //coins = await repository.getAllCoins('USD');
    //assert
    expect(coins, isA<List<CoinModel>?>());
    expect(coins.isEmpty, true);
  });
}
