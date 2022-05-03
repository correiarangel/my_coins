import 'package:dio/dio.dart';
import '../interface/client_http_interface.dart';

class ClientHttpService implements IClientHttp {
  final Dio dio;

  ClientHttpService(this.dio);

  @override
  Future<Response> get(String url) async {
    //Response response;
    return await dio.get(url);
  }
}
