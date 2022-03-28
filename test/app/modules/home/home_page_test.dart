import 'package:dio/native_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:my_coins/app/app_module.dart';
import 'package:my_coins/app/modules/home/controllers/home_store.dart';
import 'package:my_coins/app/modules/home/home_module.dart';
import 'package:my_coins/app/modules/home/home_page.dart';
import 'package:my_coins/app/shared/repository/coin_repository.dart';
import 'package:my_coins/app/shared/services/client_http_service.dart';
import 'package:my_coins/app/shared/util/general_version.dart';

class DioMock extends Mock implements DioForNative {}

class ClientHttpServiceMock extends Mock implements ClientHttpService {
  final DioMock dio;
  ClientHttpServiceMock(this.dio);
}

class CoinRepositoryMock extends Mock implements CoinRepository {
  final ClientHttpServiceMock client;
  CoinRepositoryMock(this.client);
}

class HomeStoreMock extends Mock implements HomeStore {
  final CoinRepositoryMock repository;
  HomeStoreMock(this.repository);
}

class GeneralVersionMock extends Mock implements GeneralVersion {}

void main() {
  final dioMock = DioMock();
  final clietHttp = ClientHttpServiceMock(dioMock);
  final repository = CoinRepositoryMock(clietHttp);
  final homeStore = HomeStoreMock(repository);
  final generalVersion = GeneralVersionMock();

  setUp(() {
    print("Iniciando tests HomePage");
    initModule(AppModule(), replaceBinds: [
      Bind.instance<DioMock>(dioMock),
    ]);

    initModule(HomeModule(), replaceBinds: [
      Bind.instance<CoinRepository>(repository),
      Bind.instance<HomeStore>(homeStore),
      Bind.instance<GeneralVersion>(generalVersion),
    ]);
  });

  tearDown(() {
    print("Finalizando test HomePage");
  });
  testWidgets(
      'Deve conter Scaffold/SingleChildScrollView/Column/Container/texto nome app ...',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));
    await tester.pump(Duration(seconds: 2));

    final scffold = find.byType(Scaffold);
    final singleChildScrollView = find.byType(SingleChildScrollView);
    final column = find.byType(Column);
    final container = find.byType(Container);
    //final icon = find.byIcon(Icons.share);

    await tester.pump();

    expect(scffold, findsOneWidget);
    final titleFinder = await find.text('My Coins');
    expect(titleFinder, findsOneWidget);

    expect(column, findsWidgets);
    expect(singleChildScrollView, findsOneWidget);
    expect(container, findsWidgets);
    // expect(icon, findsOneWidget);
    // await tester.tap(icon);
  });
}
