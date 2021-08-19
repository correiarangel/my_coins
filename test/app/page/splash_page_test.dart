import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_coins/app/page/splash_page.dart';

main() {
  
  setUp(() {
    print("Iniciando tests SplashPage");
   
  });

  tearDown(() {
    print("Finalizando test SplashPage");
  });
  group('SplashPage', () {
    testWidgets('Deve conter um Center, Colunm, Text, SizeBox e um progress...',
        (WidgetTester tester) async {
      //comente o timer na pg splash    
      await tester.pumpWidget(buildTestableWidget(SplashPage()));
      await tester.pump(const Duration(milliseconds: 3));
    
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.text("My Coins Cotação de moédas"), findsNWidgets(1));
      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
