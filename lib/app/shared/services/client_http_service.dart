import 'dart:developer';

import 'package:dio/dio.dart';
import '../interface/client_http_interface.dart';

class ClientHttpService implements IClientHttp {
  final Dio dio;

  ClientHttpService(this.dio);

  @override
  Future<Response> get({required String url}) async {
    Response response;
    try {
      response = await dio.get(url);
    } on Exception catch (e, s) {
      log("ClientHttpService ERROR GET ", error: e, stackTrace: s);
      response = Response(
        statusCode: 400,
        requestOptions: RequestOptions(path: ''),
        data: [],
      );
    }
    return response;
  }
}
