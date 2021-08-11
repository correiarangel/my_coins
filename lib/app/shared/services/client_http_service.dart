import 'package:dio/dio.dart';
import 'package:my_coins/app/shared/interface/client_http_interface.dart';

class ClientHttpService implements IClientHttp {
  final Dio dio;

  ClientHttpService(this.dio);

  @override
  Future delete(String url, String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(String router) async {
    try {
      final response = await dio.get(router);
      return response;
    } on Exception catch (e) {
      throw "ERROR GET  $e";
    }
  }

  @override
  Future patch(String url, value) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future post(String url, FormData param, String keyRouter) {
    // TODO: implement post
    throw UnimplementedError();
  }
}