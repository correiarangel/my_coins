import 'package:dio/dio.dart';

/// Layer - >  ( / )
abstract class IClientHttp {
  Future<Response?>? get(String keyRouter) {}
  Future post(String url, FormData param, String keyRouter);
  Future<void> delete(String url, String id);
  Future patch(String url, dynamic value);
}
