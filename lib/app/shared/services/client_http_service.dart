import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../interface/client_http_interface.dart';

class ClientHttpService implements IClientHttp {
  final Dio dio;

  ClientHttpService(this.dio);

  @override
  Future delete(String url, String id) {
    throw UnimplementedError();
  }

  @override
  Future<Response?>? get(String router) async {
    Response? response;
    try {
       response = await dio.get(router);
    } on Exception catch (e) {
      debugPrint("ERROR GET  $e");
      response = Response(
          statusCode: 400,
          requestOptions: RequestOptions(path: ''),
          data: null);
    }
    return response;
  }

  @override
  Future patch(String url, value) {
    // ignore: todo
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future post(String url, FormData param, String keyRouter) {
    // ignore: todo
    // TODO: implement post
    throw UnimplementedError();
  }
}
