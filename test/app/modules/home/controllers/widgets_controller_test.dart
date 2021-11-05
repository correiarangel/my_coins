import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_coins/app/modules/home/controllers/rate_my_app_controller.dart';
import 'package:my_coins/app/modules/home/controllers/widgets_controller.dart';
import 'package:my_coins/app/shared/models/coins_parc_model.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:screenshot/screenshot.dart';

class WidgetControllerMock extends Mock implements WidGetController {}

void main() {
  final widgetController = WidgetControllerMock();
  final context = BuildContext;
  final rateMyApp = RateMyApp();
  final rateMyAppController = RateMyAppController(mounted: null);
  final singleChildScrollView = SingleChildScrollView();
  final list = <CoinsParcModel>[];
  final card = Card();
  Widget? widget;

  setUp(() {
    print("Iniciando tests WidgetController");
  });

  tearDown(() {
    print("Finalizando test WidgetController");
  });
  test('Deve retornar bom para WidGets screenshot/circularProgress/btnError',
      () async {
    //assert
    final _screenshot = await ScreenshotController();
    final _circularProgress = Column();
    final _btnError = Center();

    when(() => widgetController.screenshot).thenAnswer((_) => _screenshot);
    expect(
      widgetController.screenshot,
      isA<ScreenshotController>(),
    );

    when(() => widgetController.circularProgress)
        .thenAnswer((_) => _circularProgress);
    expect(
      widgetController.circularProgress,
      isA<Column>(),
    );

    when(
      () => widgetController.btnIconError("test", "Test BtnError", Icons.error),
    ).thenAnswer((_) => _btnError);
    expect(
      widgetController.btnIconError("test", "Test BtnError", Icons.error),
      isA<Center>(),
    );
  });

  test(
      'Retornar deve ser bom para metodos buildBody/buildBodyAbout/buildBodyCotation',
      () async {
    //assert
    when(() =>
            widgetController.buildBody(context, rateMyApp, rateMyAppController))
        .thenAnswer((_) => widget);
    expect(
      widgetController.buildBody(context, rateMyApp, rateMyAppController),
      isA<Widget?>(),
    );

    when(() => widgetController.buildBodyAbout(
            context, rateMyApp, rateMyAppController))
        .thenAnswer((_) => singleChildScrollView);
    expect(
      widgetController.buildBodyAbout(context, rateMyApp, rateMyAppController),
      isA<SingleChildScrollView>(),
    );

    when(
      () => widgetController.buildBodyCotation(null),
    ).thenAnswer((_) => singleChildScrollView);
    expect(
      widgetController.buildBodyCotation(null),
      isA<SingleChildScrollView>(),
    );
  });

  test(
      'Retornar deve ser bom para metodos buildBodyCovert/buildBottomBar/buildHeader',
      () async {
    //assert
    when(() => widgetController.buildBodyCovert(null))
        .thenAnswer((_) => singleChildScrollView);
    expect(
      widgetController.buildBodyCovert(null),
      isA<SingleChildScrollView>(),
    );

    when(widgetController.buildBottomBar).thenAnswer(
      (_) => singleChildScrollView,
    );

    expect(
      widgetController.buildBottomBar(),
      isA<Widget>(),
    );
    final container = Container();
    when(() => widgetController.buildHeader("titulo", null, screen: null))
        .thenAnswer((_) => container);
    expect(
      widgetController.buildHeader("titulo", null, screen: null),
      isA<Container>(),
    );
  });

  test(
      'Retornar deve ser bom para metodos fillListSiglas/flotBtnSearsh/horizontlList',
      () async {
    //assert
    when(widgetController.fillListSiglas).thenAnswer((_) => list);
    expect(
      widgetController.fillListSiglas(),
      isA<List<CoinsParcModel>>(),
    );

    final floatingActionButton = FloatingActionButton(
      onPressed: () {},
    );
    when(widgetController.flotBtnSearsh).thenAnswer(
      (_) => floatingActionButton,
    );
    expect(
      widgetController.flotBtnSearsh(),
      isA<FloatingActionButton>(),
    );

    final container = Container();
    when(widgetController.horizontlList).thenAnswer((_) => container);
    expect(
      widgetController.horizontlList(),
      isA<Container>(),
    );
  });

  test(
      'Retornar deve ser bom para metodos isInternetBuild/returnCardCustom/returnCardGrafic',
      () async {
    //assert
    when(widgetController.isInternetBuild)
        .thenAnswer((_) => singleChildScrollView);
    expect(
      widgetController.isInternetBuild(),
      isA<SingleChildScrollView>(),
    );

    when(widgetController.returnCardCustom).thenAnswer(
      (_) => card,
    );
    expect(
      widgetController.returnCardCustom(),
      isA<Card>(),
    );

    when(widgetController.returnCardGrafic).thenAnswer((_) => card);
    expect(
      widgetController.returnCardGrafic(),
      isA<Card>(),
    );
  });

  test(
      'Retornar deve ser bom para metodos sizeBoxDivisor/returnCardCustom/returnCardGrafic',
      () async {
    //assert
    when(widgetController.sizeBoxDivisor)
        .thenAnswer((_) => singleChildScrollView);
    expect(
      widgetController.sizeBoxDivisor(),
      isA<Widget>(),
    );
    final text = Text("Test Componente My Coins");
    when(() => widgetController.testCoinsText(coins: null, index: 0))
        .thenAnswer(
      (_) => text,
    );
    expect(
      widgetController.testCoinsText(coins: null, index: 0),
      isA<Text>(),
    );

    when(() => widgetController.testTextBr(coins: null, index: 0))
        .thenAnswer((_) => text);
    expect(
      widgetController.testTextBr(coins: null, index: 0),
      isA<Text>(),
    );
  });
}
