import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:my_coins/app/shared/services/client_http_service.dart';

class ClientServiceHttpMoc extends Mock implements ClientHttpService {
  final Dio dio;
  ClientServiceHttpMoc(this.dio);
}

class DioMock extends Mock implements DioForNative {}

///acredite é possivel ...
void main() {
  final dio = DioMock();
  // ignore: unused_local_variable
  final service = ClientServiceHttpMoc(dio);
  setUp(() {
    print("Iniciando tests ClientHttp");
  });

  tearDown(() {
    print("Finalizando test ClientHttp");
  });

  test('Deve retornar Map / GET', () async {
    //arrage
    when(() => dio.get(any())).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 200,
        data: {},
      ),
    );
    //act
    var resp = await dio.get('USD');
    //assert
    expect(resp.statusCode, 200);
    expect(resp.data, isA<Map>());
  });

  test('Deve retornar Erro 400', () async {
    //arrage

    when(() => dio.get(any())).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: ''), statusCode: 400, data: null));
    //act
    var resp = await dio.get('USD');
    //assert

    expect(resp.statusCode, 400);
    expect(resp.data, null);
  });
}

var response =
    '{"USD":{"code":"USD","codein":"BRL","name":"Dólar Americano/Real Brasileiro","high":"5.1982","low":"5.1979","varBid":"0.0015","pctChange":"0.03","bid":"5.1967","ask":"5.1997","timestamp":"1628024400","create_date":"2021-08-03 21:00:02"},"USDT":{"code":"USD","codein":"BRLT","name":"Dólar Americano/Real Brasileiro Turismo","high":"5.455","low":"5.455","varBid":"0","pctChange":"0","bid":"5.29","ask":"5.62","timestamp":"1628024402","create_date":"2021-08-03 21:00:03"},"CAD":{"code":"CAD","codein":"BRL","name":"Dólar Canadense/Real Brasileiro","high":"4.149","low":"4.1424","varBid":"-0.0011","pctChange":"-0.03","bid":"4.1411","ask":"4.1448","timestamp":"1628038257","create_date":"2021-08-03 21:50:57"},"GBP":{"code":"GBP","codein":"BRL","name":"Libra Esterlina/Real Brasileiro","high":"7.2348","low":"7.2281","varBid":"-0.0021","pctChange":"-0.03","bid":"7.2255","ask":"7.2317","timestamp":"1628038257","create_date":"2021-08-03 21:50:58"},"ARS":{"code":"ARS","codein":"BRL","name":"Peso Argentino/Real Brasileiro","high":"0.0537","low":"0.0537","varBid":"0","pctChange":"0","bid":"0.0537","ask":"0.0537","timestamp":"1628024400","create_date":"2021-08-03 21:00:03"},"BTC":{"code":"BTC","codein":"BRL","name":"Bitcoin/Real Brasileiro","high":"206.179","low":"197.132","varBid":"-4960","pctChange":"-2.42","bid":"199.799","ask":"199.799","timestamp":"1628038258","create_date":"2021-08-03 21:50:58"},"LTC":{"code":"LTC","codein":"BRL","name":"Litecoin/Real Brasileiro","high":"743.63","low":"708.48","varBid":"-18.89","pctChange":"-2.56","bid":"719.38","ask":"722.98","timestamp":"1628038258","create_date":"2021-08-03 21:50:58"},"EUR":{"code":"EUR","codein":"BRL","name":"Euro/Real Brasileiro","high":"6.1708","low":"6.1653","varBid":"0.0033","pctChange":"0.05","bid":"6.1638","ask":"6.1694","timestamp":"1628038257","create_date":"2021-08-03 21:50:58"},"JPY":{"code":"JPY","codein":"BRL","name":"Iene Japonês/Real Brasileiro","high":"0.04771","low":"0.04766","varBid":"0","pctChange":"0","bid":"0.04768","ask":"0.04771","timestamp":"1628038239","create_date":"2021-08-03 21:50:39"},"CHF":{"code":"CHF","codein":"BRL","name":"Franco Suíço/Real Brasileiro","high":"5.7563","low":"5.7445","varBid":"0.0004","pctChange":"0.01","bid":"5.7441","ask":"5.7538","timestamp":"1628038256","create_date":"2021-08-03 21:50:57"},"AUD":{"code":"AUD","codein":"BRL","name":"Dólar Australiano/Real Brasileiro","high":"3.8475","low":"3.8414","varBid":"0.0006","pctChange":"0.02","bid":"3.8414","ask":"3.8447","timestamp":"1628038236","create_date":"2021-08-03 21:50:38"},"CNY":{"code":"CNY","codein":"BRL","name":"Yuan Chinês/Real Brasileiro","high":"0.8034","low":"0.8034","varBid":"0.0024","pctChange":"0.3","bid":"0.8031","ask":"0.8036","timestamp":"1628035263","create_date":"2021-08-03 21:01:03"},"ILS":{"code":"ILS","codein":"BRL","name":"Novo Shekel Israelense/Real Brasileiro","high":"1.6201","low":"1.6191","varBid":"0.0136","pctChange":"0.84","bid":"1.619","ask":"1.6199","timestamp":"1628038205","create_date":"2021-08-03 21:50:06"},"ETH":{"code":"ETH","codein":"BRL","name":"Ethereum/Real Brasileiro","high":"1200.21","low":"1200.21","varBid":"0","pctChange":"0","bid":"1440.25","ask":"16999.75","timestamp":"1610415652","create_date":"2021-01-11 22:40:52"},"XRP":{"code":"XRP","codein":"BRL","name":"XRP/Real Brasileiro","high":"3.86","low":"3.66","varBid":"-0.09","pctChange":"-2.25","bid":"3.73","ask":"3.74","timestamp":"1628038259","create_date":"2021-08-03 21:50:59"},"DOGE":{"code":"DOGE","codein":"BRL","name":"Dogecoin/Real Brasileiro","high":"1.07","low":"1.01","varBid":"-0.01999994","pctChange":"-1.89","bid":"1.04","ask":"1.04","timestamp":"1628038201","create_date":"2021-08-03 21:50:01"}}';

var headers = {
  'Content-Type': 'application/json;charset=UTF-8',
  'Charset': 'utf-8'
};
