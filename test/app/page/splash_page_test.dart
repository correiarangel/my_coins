import 'package:my_coins/app/page/splash_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';

main() {
  group('SplashPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(SplashPage()));
      final titleFinder = find.text("Iniciando, aguarde por favor...");
      expect(titleFinder, findsOneWidget);
    });
  });
}