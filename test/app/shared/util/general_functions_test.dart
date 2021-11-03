import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_coins/app/shared/util/general_functions.dart';

class GeneralFunctionsMock extends Mock implements GeneralFunctions {}

void main() {
  final funcions = GeneralFunctionsMock();
  setUp(() {
    print("Iniciando tests GeneralFunctions");
  });

  tearDown(() {
    print("Finalizando test GeneralFunctions");
  });

  test('Deve retornar data como tipo String (formatNtpHour) ...', () async {
    DateTime? date = DateTime.now();
    String? result = date.toString();

    when(() => funcions.formatNtpHour(date)).thenAnswer((_) => result);
    //act
    //assert
    expect(result, isA<String>());
    expect(result, date.toString());
  });

  test('Deve retornar null emm caso de erro (formatNtpHour) ...', () async {
    DateTime? date;
    String? result;

    when(() => funcions.formatNtpHour(date)).thenAnswer((_) => result);
    //act
    //assert
    expect(result, isA<String?>());
    expect(result, date);
  });

  test('Deve retornar data formato BR tipo String (toBrazilTime) ...',
      () async {
    DateTime? date = DateTime.now();
    //String? date = '2021/11/02 00:23:00';
    var format = DateFormat('dd/MM/yyyy HH:mm:ss');
    var formatedDate = format.format(DateTime.parse(date.toString()));
    when(() => funcions.toBrazilTime("2021-11-02"))
        .thenAnswer((_) => formatedDate);
    //act
    //assert
    expect(formatedDate, isA<String?>());
    expect(formatedDate, formatedDate);
    expect(formatedDate.length, 19);
    expect(formatedDate.contains("/"), true);
    expect(formatedDate.contains(":"), true);
  });

  test('Deve retornar null em caso de erro (toBrazilTime) ...', () async {
    DateTime? date;
    String? result;

    when(() => funcions.toBrazilTime(null)).thenAnswer((_) => result);
    //act
    //assert
    expect(result, isA<String?>());
    expect(result, date);
  });

  test(
      'Deve retornar numero com 2 casa dec. como tipo String (formatNumber) ...',
      () async {
    String? result = '1.00';

    when(() => funcions.formatNumber(result)).thenAnswer((_) => result);
    //act
    //assert
    expect(result, isA<String?>());
    expect(result, '1.00');
  });

  test('Deve retornar null emm caso de erro (formatNumber) ...', () async {
    String? result;

    when(() => funcions.formatNumber('1.00')).thenAnswer((_) => result);
    //act
    //assert
    expect(result, isA<String?>());
    expect(result, null);
  });

  test('Deve retornar resultado de conveção em tipo String (realToCoin) ...',
      () async {
    String? priceCoin = '1.00';

    when(() => funcions.realToCoin(priceCoin)).thenAnswer((_) => priceCoin);
    //act
    //assert
    expect(priceCoin, isA<String?>());
    expect(priceCoin, '1.00');
  });

  test('Deve retornar String vazia em caso de erro (realToCoin) ...', () async {
    var priceCoin = "";

    when(() => funcions.realToCoin('1.00')).thenAnswer((_) => priceCoin);
    //act
    //assert
    expect(priceCoin, isA<String>());
    expect(priceCoin.isEmpty, true);
  });

  test(
      'Deve retornar resultado de conveção em tipo String (calcRealToCoin) ...',
      () async {
    String? priceCoin = '1.00';

    when(() => funcions.calcRealToCoin('1.00', '1.00'))
        .thenAnswer((_) => priceCoin);
    //act
    //assert
    expect(priceCoin, isA<String?>());
    expect(priceCoin, '1.00');
  });

  test('Deve retornar String vazia em caso de erro (calcRealToCoin) ...',
      () async {
    var priceCoin = "";

    when(() => funcions.calcRealToCoin('1.00', '1.00'))
        .thenAnswer((_) => priceCoin);
    //act
    //assert
    expect(priceCoin, isA<String?>());
    expect(priceCoin.isEmpty, true);
  });

  test(
      'Deve retornar resultado de conveção em tipo String (calcCoinToReal) ...',
      () async {
    String? priceCoin = '1.00';

    when(() => funcions.calcCoinToReal('1.00', '1.00'))
        .thenAnswer((_) => priceCoin);
    //act
    //assert
    expect(priceCoin, isA<String?>());
    expect(priceCoin, '1.00');
  });

  test('Deve retornar String vazia em caso de erro (calcCoinToReal) ...',
      () async {
    var priceCoin = "";

    when(() => funcions.calcCoinToReal('1.00', '1.00'))
        .thenAnswer((_) => priceCoin);
    //act
    //assert
    expect(priceCoin, isA<String?>());
    expect(priceCoin.isEmpty, true);
  });

  test(
      'Deve retornar numero em formato BitCoin como tipo String (formatNumberBitCoin) ...',
      () async {
    String? resnumber = '361.000000';

    when(() => funcions.formatNumberBitCoin('361.000000'))
        .thenAnswer((_) => resnumber);
    //act
    //assert
    expect(resnumber, isA<String?>());
    expect(resnumber, '361.000000');
  });

  test('Deve retornar null em caso de erro (calcCoinToReal) ...', () async {
    var resnumber;

    when(() => funcions.formatNumberBitCoin('361.000000'))
        .thenAnswer((_) => resnumber);
    //act
    //assert
    expect(resnumber, isA<String?>());
    expect(resnumber, null);
  });

  test(
      'Deve retornar numero em formato BR como tipo String (formatNumberBr) ...',
      () async {
    String? resnumber = '361.010000';
    var formatter = NumberFormat.decimalPattern("pt_BR");
    when(() => funcions.formatNumberBr('361.010000'))
        .thenAnswer((_) => resnumber);
    //act
    //assert
    var numBr = formatter.format(double.parse(resnumber));
    expect(resnumber, isA<String?>());
    expect(numBr, '361,01');
  });

  test('Deve retornar 0 como String em caso de erro (formatNumberBr) ...',
      () async {
    var resnumber = "0";

    when(() => funcions.formatNumberBr('361.000000'))
        .thenAnswer((_) => resnumber);
    //act
    //assert
    expect(resnumber, isA<String?>());
    expect(resnumber.isEmpty, false);
    expect(resnumber, "0");
  });

  test(
      'Deve retornar numero em formato US como tipo String (formatNumberUs) ...',
      () async {
    String? resnumber = '361.010100';
    var formatter = NumberFormat.decimalPattern("en_US");
    when(() => funcions.formatNumberUs('361.010100'))
        .thenAnswer((_) => resnumber);
    //act
    //assert
    var numBr = formatter.format(double.parse(resnumber));
    expect(resnumber, isA<String?>());
    expect(numBr, '361.01');
  });

  test('Deve retornar 0 como String em caso de erro (formatNumberUs) ...',
      () async {
    var resnumber = "0";

    when(() => funcions.formatNumberUs('361.010000'))
        .thenAnswer((_) => resnumber);
    //act
    //assert
    expect(resnumber, isA<String?>());
    expect(resnumber.isEmpty, false);
    expect(resnumber, "0");
  });
}
