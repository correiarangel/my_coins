import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_coins/app/modules/home/controllers/widgets_controller.dart';
import 'package:screenshot/screenshot.dart';

class WidgetControllerMock extends Mock implements WidGetController {}

void main() {
  final widgetController = WidgetControllerMock();
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
}
