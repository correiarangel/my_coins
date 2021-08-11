import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_coins/app/page/splash_page.dart';
import 'package:my_coins/app/shared/interface/client_http_interface.dart';
import 'package:my_coins/app/shared/services/client_http_service.dart';
import 'package:my_coins/app/shared/util/const_srtring_url.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
        Bind((i) => Dio(BaseOptions(
          baseUrl: ConstStringUrl.baseUrl,
          receiveTimeout: 5000,
          connectTimeout: 15000,
          headers: {
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8'}
        ))),
        Bind<IClientHttp>((i) => ClientHttpService(i.get()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashPage()),
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];

}