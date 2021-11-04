import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_coins/app/shared/util/general_version.dart';

class GeneralVersionMock extends Mock implements GeneralVersion {}

void main() {
  final generalVersion = GeneralVersionMock();
  setUp(() {
    print("Iniciando tests GeneralVersion");
  });

  tearDown(() {
    print("Finalizando test GeneralVersion");
  });

  test('Deve retornar data como tipo String (getBuildAndVersion) ...',
      () async {
    String? result = "1.0.0+7";

    when(() async => generalVersion.getBuildAndVersion()).thenAnswer(
      (_) async => result,
    );
    //act
    //assert
    expect(result, isA<String?>());
    expect(result.length >= 7, true);
    expect(result.compareTo("."), 1);
    expect(result.compareTo("+"), 1);
  });

  test('Deve retornar String vazia emm caso de erro (getBuildAndVersion) ...',
      () async {
    String? result = "";

    when(() async => generalVersion.getBuildAndVersion()).thenAnswer(
      (_) async => result,
    );
    //act
    //assert
    expect(result, isA<String?>());
    expect(result.isEmpty, true);
  });
}
