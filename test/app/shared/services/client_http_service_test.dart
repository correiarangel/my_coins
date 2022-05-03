import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_coins/app/shared/interface/check_internet_interface.dart';
import 'package:my_coins/app/shared/interface/client_http_interface.dart';
import 'package:my_coins/app/shared/util/value/const_srtring_url.dart';

class DioMock extends Mock implements DioForNative {}

class ResponseMock extends Mock implements Response {}

class IClientHttpMock extends Mock implements IClientHttp {}

class ICheckInternetMock extends Mock implements ICheckInternet {}

///acredite é possivel ...
void main() {
  late IClientHttp client;
  late Response response;

  setUpAll(() {
    print("Teste ClientHttp");
    print("acredite é possivel ... ");
    response = Response(
      requestOptions: RequestOptions(path: ''),
      data: data,
      statusCode: 200,
    );
  });
  setUp(() {
    print("Iniciando testes");
    client = IClientHttpMock();
  });

  tearDown(() {
    print("Finalizando teste ClientHttp");
  });

  tearDownAll(() {
    print('Finalizando teste');
  });

  group('Caminho Fefiz ;)', () {
    test('Deve retornar Status code 200 / GET', () async {
      when(() => client.get(ConstStringUrl.routerAllCoins)).thenAnswer(
        (_) async => response,
      );
      //assert
      expect(response.statusCode, 200);
    });
    test('Deve retornar Map com 2 posição / GET', () async {
      //arrage

      //act
      when(() => client.get(ConstStringUrl.routerAllCoins)).thenAnswer(
        (_) async => response,
      );

      //assert
      expect(response.data, isA<Map>());
      expect(response.data?.length, 2);
    });
  });


}

const Map data = {
  "USD": {
    "code": "USD",
    "codein": "BRL",
    "name": "Dólar Americano/Real Brasileiro",
    "high": "5.1982",
    "low": "5.1979",
    "varBid": "0.0015",
    "pctChange": "0.03",
    "bid": "5.1967",
    "ask": "5.1997",
    "timestamp": "1628024400",
    "create_date": "2021-08-03 21:00:02"
  },
  "USDT": {
    "code": "USD",
    "codein": "BRLT",
    "name": "Dólar Americano/Real Brasileiro Turismo",
    "high": "5.455",
    "low": "5.455",
    "varBid": "0",
    "pctChange": "0",
    "bid": "5.29",
    "ask": "5.62",
    "timestamp": "1628024402",
    "create_date": "2021-08-03 21:00:03"
  },
};

var headers = {
  'Content-Type': 'application/json;charset=UTF-8',
  'Charset': 'utf-8'
};
