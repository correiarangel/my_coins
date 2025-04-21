import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/interface/check_internet_interface.dart';
import '../../shared/interface/coin_repository_interface.dart';
import '../../shared/interface/general_functions_interface.dart';
import '../../shared/interface/general_version_interface.dart';
import '../../shared/repository/coin_repository.dart';
import '../../shared/util/check_internet.dart';
import '../../shared/util/general_functions.dart';
import '../../shared/util/general_version.dart';
import 'controllers/home_store.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<ICheckInternet>((i) => CheckInternet()),
    Bind<ICoinRepository>(
      (i) => CoinRepository(
        i.get(),
        i.get(),
      ),
    ),
    Bind<IGeneralVersion>((i) => GeneralVersion()),
    Bind<IGeneralFunctions>((i) => GeneralFunctions()),
    Bind.lazySingleton(
      (i) => HomeStore(
        i.get(),
        i.get(),
        i.get(),
        i.get(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/home', child: (_, args) => HomePage()),
  ];
}
