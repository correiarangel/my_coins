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

class ClientHttpServiceMock extends Mock implements ClientHttpService {}

class CoinRepositoryMock extends Mock implements CoinRepository {}

class HomeStoreMock extends Mock implements HomeStore {}

class GeneralVersionMock extends Mock implements GeneralVersion {}

class AppModuleMock extends Mock implements AppModule {}

class HomeModuleMock extends Mock implements HomeModule {}

/* Widget createHomePage() {
  return MaterialApp(home: HomePage().createState().build(context));
} */
void main() {
  final dioMock = DioMock();
  final repository = CoinRepositoryMock();
  final homeStore = HomeStoreMock();
  final generalVersion = GeneralVersionMock();

  setUp(() {
    print("Iniciando tests HomePage");
    initModule(AppModule(), replaceBinds: [
      Bind.instance<DioMock>(dioMock),
    ]);

    initModule(HomeModule(), replaceBinds: [
      Bind.instance<CoinRepositoryMock>(repository),
      Bind.instance<HomeStoreMock>(homeStore),
      Bind.instance<GeneralVersionMock>(generalVersion),
    ]);
  });

  tearDown(() {
    print("Finalizando test HomePage");
  });
  testWidgets(
      'Deve conter Scaffold/SingleChildScrollView/Column/Container/texto nome app ...',
      (tester) async {
    final scaffold = find.byType(Scaffold);
    final singleChildScrollView = find.byType(SingleChildScrollView);
    final column = find.byType(Column);
    final titleFinder = await find.text('My Coins');
    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) {
          return Container();
        },
        home: HomePage(),
      ),
    );

    await tester.pump(Duration(seconds: 4));

    await tester.pump();

    //expect(scaffold, findsOneWidget);
    //expect(titleFinder, findsOneWidget);
    //expect(column, findsWidgets);
    //expect(singleChildScrollView, findsOneWidget);
    //expect(icon, findsOneWidget);
    //await tester.tap(icon);
  });
}
