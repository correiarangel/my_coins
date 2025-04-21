import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_coins/app/shared/interface/general_version_interface.dart';
import 'package:my_coins/app/shared/util/general_version.dart';

class GeneralVersionMock extends Mock implements GeneralVersion {}

void main() {
  late IGeneralVersion generalVersion;
  String? result = "1.1.0+12";

  setUpAll(() {
    print("Tests GeneralVersion");
    generalVersion = GeneralVersionMock();
  });
  setUp(() {
    print("Iniciando tests");
  });

  tearDown(() {
    print("Finalizando test GeneralVersion");
  });

  tearDownAll(() {
    print("Finalizando test GeneralVersion");
  });
  group('Caminho feliz', () {
    test('Deve retornar tipo String? (getBuildAndVersion) ...', () async {
      when(() async => generalVersion.getBuildAndVersion()).thenAnswer(
        (_) async => result,
      );
      expect(result, isA<String?>());
    });
    test('Deve conter (.) (+) (getBuildAndVersion) ...', () async {
      when(() async => generalVersion.getBuildAndVersion()).thenAnswer(
        (_) async => result,
      );
      expect(result.compareTo("."), 1);
      expect(result.compareTo("+"), 1);
    });
  });

  group('Caminho triste :(', () {
    test('Deve retornar String vazia em caso de erro (getBuildAndVersion) ...',
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
  });
}
