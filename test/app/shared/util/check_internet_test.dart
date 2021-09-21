import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_coins/app/shared/util/check_internet.dart';

class CheckInternetMock extends Mock implements CheckInternet {}

void main() {
  final checkNet = CheckInternetMock();

  setUp(() {
    print("Iniciando tests CheckInternet");
  });

  tearDown(() {
    print("Finalizando test CheckInternet");
  });

  test('Deve retornar tipo bool true ', () async {
    //arrage
    var result = true;
    when(checkNet.isInternet).thenAnswer((_) async => result);
    //act
    //coins = await repository.getAllCoins('USD');
    //assert
    expect(result, isA<bool>());
    expect(result, true);
  });

   test('Deve retornar tipo bool false ', () async {
    //arrage
    var result = false;
    when(checkNet.isInternet).thenAnswer((_) async => result);
    //act
    //coins = await repository.getAllCoins('USD');
    //assert
    expect(result, isA<bool>());
    expect(result, false);
  });
   
}
