import 'package:dio/dio.dart';
/// Layer - >  ( / )
abstract class IClientHttp {
  Future get(String keyRouter);
  Future post(String url, FormData param, String keyRouter);
  Future delete(String url, String id);
  Future patch(String url, dynamic value );
}
