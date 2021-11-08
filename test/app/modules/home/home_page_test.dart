import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';

import 'package:my_coins/app/app_module.dart';
import 'package:my_coins/app/modules/home/controllers/home_store.dart';
import 'package:my_coins/app/modules/home/controllers/widgets_controller.dart';
import 'package:my_coins/app/modules/home/home_module.dart';
import 'package:my_coins/app/modules/home/home_page.dart';
import 'package:my_coins/app/shared/repository/coin_repository.dart';
import 'package:my_coins/app/shared/services/client_http_service.dart';
import 'package:my_coins/app/shared/util/general_version.dart';

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

Widget createHomePage() {
  return MaterialApp(home: HomePage());
}

class DioMock extends Mock implements DioForNative {}

class ClientHttpServiceMock extends Mock implements ClientHttpService {}

void main() {
  final dioMock = DioMock();
  final client = ClientHttpServiceMock();
  final repository = CoinRepositoryMock(client);
  final homeStore = HomeStoreMock(repository);
  final widGetController = WidgetControllerMock();
  final generalVersion = GeneralVersionMock();

  setUp(() {
    print("Iniciando tests HomePage");

    initModule(AppModule(), replaceBinds: [
      Bind.instance<Dio>(dioMock),
    ]);

    initModule(HomeModule(), replaceBinds: [
      Bind.instance<CoinRepository>(repository),
      Bind.instance<HomeStore>(homeStore),
      Bind.instance<GeneralVersion>(generalVersion),
      Bind.instance<WidGetController>(widGetController),
    ]);
  });

  tearDown(() {
    print("Finalizando test HomePage");
  });
  testWidgets('home page ...', (tester) async {
/*     tester.pumpWidget(MaterialApp(home: HomePage()));

    final scffold = find.byWidget(Scaffold());
    expect(scffold, findsOneWidget);
    final titleFinder = find.text('My Coins');
    expect(titleFinder, findsOneWidget);

    tester.pumpWidget(MaterialApp(home: HomePage()));
    tester.allStates.cast();

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Observer), findsOneWidget);

    // ignore: non_constant_identifier_names
    var conteinerCard = find.byWidget(Container());
    expect(conteinerCard, findsOneWidget);

    // ignore: non_constant_identifier_names
    var icon_monetization_on = find.byIcon(Icons.monetization_on);
    expect(icon_monetization_on, findsOneWidget); */
  });
}
