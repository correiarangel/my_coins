import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:my_coins/app/page/splash_page.dart';

Widget createSplashPage() {
  return MaterialApp(home: SplashPage());
}

main() {
  setUp(() {
    print("Iniciando tests SplashPage");
  });

  tearDown(() {
    print("Finalizando test SplashPage");
  });
  group('SplashPage', () {
    testWidgets('Deve conter um Scaffold, ListView, Colunm, icons ...',
        (tester) async {
      //comente o timer na pg splash
      await tester.pumpWidget(createSplashPage.call());

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);

      // ignore: non_constant_identifier_names
      var icon_trending_up = find.byIcon(Icons.trending_up);
      expect(icon_trending_up, findsOneWidget);

      // ignore: non_constant_identifier_names
      var icon_monetization_on = find.byIcon(Icons.monetization_on);
      expect(icon_monetization_on, findsOneWidget);
    });
  });
}
