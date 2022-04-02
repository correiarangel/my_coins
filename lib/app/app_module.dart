import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'page/splash_page.dart';
import 'shared/interface/client_http_interface.dart';
import 'shared/services/client_http_service.dart';

import 'shared/util/value/const_srtring_url.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(
      (i) => Dio(
        BaseOptions(
          baseUrl: ConstStringUrl.baseUrl,
          receiveTimeout: 5000,
          connectTimeout: 15000,
          headers: {
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
          },
        ),
      ),
    ),
    //Bind<IClientHttp>((i) => ClientHttpService(i.get())),
    Bind<IClientHttp>((i) => ClientHttpService(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashPage()),
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
