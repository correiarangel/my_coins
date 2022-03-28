import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/interface/coin_repository_interface.dart';
import '../../shared/interface/general_version_interface.dart';
import '../../shared/repository/coin_repository.dart';
import '../../shared/util/general_version.dart';
import 'controllers/home_store.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<ICoinRepository>((i) => CoinRepository(i.get())),
    Bind.lazySingleton((i) => HomeStore(i.get())),
    Bind<IGeneralVersion>((i) => GeneralVersion()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/home', child: (_, args) => HomePage()),
  ];
}
