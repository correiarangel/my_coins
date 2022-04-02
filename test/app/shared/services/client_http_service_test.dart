import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_coins/app/shared/services/client_http_service.dart';
import 'package:my_coins/app/shared/util/value/const_srtring_url.dart';

class ClientServiceHttpMoc extends Mock implements ClientHttpService {
  final Dio dio;
  ClientServiceHttpMoc(this.dio);
}

class DioMock extends Mock implements DioForNative {}

///acredite é possivel ...
void main() {
  late ClientHttpService client;
  setUpAll(() {
    print("Teste ClientHttp");
    print("acredite é possivel ... ");
  });
  setUp(() {
    var dio = DioMock();
    print("Iniciando testes");

    client = ClientServiceHttpMoc(dio);
  });

  tearDown(() {
    print("Finalizando teste ClientHttp");
  });

  tearDownAll(() {
    print('Finalizando teste');
  });

  group('Caminho Fefiz ;)', () {
    test('Deve retornar Status code 200 / GET', () async {
      //arrage
      var resp = Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 200,
        data: data,
      );
      //act
      when(
        () => client.get(
          url: ConstStringUrl.routerAllCoins,
        ),
      ).thenAnswer(
        (_) async => resp,
      );

      //assert
      expect(resp.statusCode, 200);
    });
    test('Deve retornar Map com 2 posição / GET', () async {
      //arrage
      var resp = Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 200,
        data: data,
      );
      //act
      when(
        () => client.get(
          url: ConstStringUrl.routerAllCoins,
        ),
      ).thenAnswer(
        (_) async => resp,
      );

      //assert
      expect(resp.data, isA<Map>());
      expect(resp.data?.length, 2);
    });
  });

  group('Caminho Triste :(', () {
    test('Deve retornar Erro 400', () async {
      //arrage
      var resp = Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 400,
        data: null,
      );
      when(
        () => client.get(
          url: ConstStringUrl.routerAllCoins,
        ),
      ).thenAnswer(
        (_) async => resp,
      );
      //act

      expect(resp.statusCode, 400);
      expect(resp.data, null);
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
