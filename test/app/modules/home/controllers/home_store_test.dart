import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:my_coins/app/modules/home/controllers/home_store.dart';

import 'package:my_coins/app/shared/models/coins_model.dart';
import 'package:my_coins/app/shared/models/coins_parc_model.dart';
import 'package:my_coins/app/shared/repository/coin_repository.dart';
import 'package:my_coins/app/shared/services/check_internet_service.dart';
import 'package:my_coins/app/shared/services/format_service.dart';
import 'package:my_coins/app/shared/services/version_service.dart';

class GeneralFunctionsMock extends Mock implements FormatService {}

class CheckInternetMock extends Mock implements CheckInternetService {}

class CoinRepositoryMock extends Mock implements CoinRepository {}

class GeneralVersionMock extends Mock implements VersionService {}

class HomeStoreMock extends Mock implements HomeStore {
  final CoinRepository repository;
  final FormatService genFunctions;
  final CheckInternetService testInternet;
  final VersionService generalVersion;

  HomeStoreMock(
    this.repository,
    this.genFunctions,
    this.testInternet,
    this.generalVersion,
  );
}

Future<List<CoinModel>> retunFutureListMock() async {
  var list = <CoinModel>[];
  return list;
}

void main() {
  late CoinRepository repository;
  late FormatService genFunctions;
  late CheckInternetService testInternet;
  late VersionService generalVersion;
  late HomeStore homeStore;

  genFunctions = GeneralFunctionsMock();
  testInternet = CheckInternetMock();
  generalVersion = GeneralVersionMock();
  repository = CoinRepositoryMock();
  homeStore = HomeStoreMock(
    repository,
    genFunctions,
    testInternet,
    generalVersion,
  );
  // ignore: unused_element
  setUpAll() {
    print("tests HomeStore");
  }

  setUp(() {
    print("Iniciando tests");
  });

  tearDown(() {
    print("Finalizando test ");
  });

  tearDownAll(() {
    print("Teste HomeStore");
  });
  test(
    'Deve retornar List do tipo quando setar tipo de moeda CoinModel ...',
    () async {
      var coins = await retunFutureListMock();
      when(() => homeStore.fetchCoins('US')).thenAnswer((_) async => coins);
      expect(coins, isA<List<CoinModel>>());
      expect(coins.isEmpty, true);
    },
  );

  test('Deve lista de CoinsParcModel fillListSiglas', () async {
    //assert
    when(() => homeStore.fillListSiglas()).thenAnswer((_) => list);
    expect(homeStore.fillListSiglas(), isA<List<CoinsParcModel>>());
  });
}

final list = <CoinsParcModel>[];
