import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/interface/check_internet_interface.dart';
import '../../shared/interface/coin_repository_interface.dart';
import '../../shared/interface/format_interface.dart';
import '../../shared/interface/version_interface.dart';
import '../../shared/repository/coin_repository.dart';
import '../../shared/services/check_internet_service.dart';
import '../../shared/services/format_service.dart';
import '../../shared/services/version_service.dart';
import 'controllers/home_store.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<ICheckInternet>((i) => CheckInternetService()),
    Bind<ICoinRepository>((i) => CoinRepository(i.get(), i.get())),
    Bind<IVersion>((i) => VersionService()),
    Bind<IFormat>((i) => FormatService()),
    Bind.lazySingleton((i) => HomeStore(i.get(), i.get(), i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/home', child: (_, args) => HomePage()),
  ];
}
