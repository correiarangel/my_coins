import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_coins/app/shared/util/check_internet.dart';

class CheckInternetMock extends Mock implements CheckInternet {}

void main() {
  late CheckInternet checkNet;

  setUpAll(() {
    print("Testes CheckInternet");
  });
  setUp(() {
    print("Iniciando tests");
    checkNet = CheckInternetMock();
  });

  tearDown(() {
    print("Teste CheckInternet");
  });
  tearDownAll(() {
    print("Finalizando test CheckInternet");
  });
  test('Deve retornar tipo bool true Caminho feliz', () async {
    //arrage
    var result = true;
    when(checkNet.isInternet).thenAnswer((_) async => result);
    //act
    //coins = await repository.getAllCoins('USD');
    //assert
    expect(result, isA<bool>());
    expect(result, true);
  });

  test('Deve retornar tipo bool false Caminho triste', () async {
    //arrage
    var result = false;
    when(() => checkNet.isInternet()).thenAnswer((_) async => result);
    //act
    //coins = await repository.getAllCoins('USD');
    //assert
    expect(result, isA<bool>());
    expect(result, false);
  });
}
