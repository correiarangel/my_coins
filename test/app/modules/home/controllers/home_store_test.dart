import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:my_coins/app/modules/home/controllers/home_store.dart';

import 'package:my_coins/app/shared/models/coins_model.dart';
import 'package:my_coins/app/shared/models/coins_parc_model.dart';
import 'package:my_coins/app/shared/repository/coin_repository.dart';
import 'package:my_coins/app/shared/util/check_internet.dart';
import 'package:my_coins/app/shared/util/general_functions.dart';
import 'package:my_coins/app/shared/util/general_version.dart';

class GeneralFunctionsMock extends Mock implements GeneralFunctions {}

class CheckInternetMock extends Mock implements CheckInternet {}

class CoinRepositoryMock extends Mock implements CoinRepository {}

class GeneralVersionMock extends Mock implements GeneralVersion {}

class HomeStoreMock extends Mock implements HomeStore {
  final CoinRepository repository;
  final GeneralFunctions genFunctions;
  final CheckInternet testInternet;
  final GeneralVersion generalVersion;

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
  late GeneralFunctions genFunctions;
  late CheckInternet testInternet;
  late GeneralVersion generalVersion;
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
  test('Deve retornar List do tipo quando setar tipo de moeda CoinModel ...',
      () async {
    var coins = await retunFutureListMock();
    when(() => homeStore.fetchCoins('US')).thenAnswer(
      (_) async => coins,
    );
    expect(coins, isA<List<CoinModel>>());
    expect(coins.isEmpty, true);
  });

  test('Deve lista de CoinsParcModel fillListSiglas', () async {
    //assert
    when(() => homeStore.fillListSiglas()).thenAnswer((_) => list);
    expect(
      homeStore.fillListSiglas(),
      isA<List<CoinsParcModel>>(),
    );
  });
}

final list = <CoinsParcModel>[];
