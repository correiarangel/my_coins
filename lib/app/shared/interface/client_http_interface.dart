import 'package:dio/dio.dart';

// ignore: one_member_abstracts
abstract class IClientHttp {
  Future<Response> get(String url);
}
