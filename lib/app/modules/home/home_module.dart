import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/interface/coin_repository_interface.dart';
import '../../shared/interface/general_version_interface.dart';
import '../../shared/repository/coin_repository.dart';
import '../../shared/util/general_version.dart';
import 'controllers/home_store.dart';
import 'controllers/widgets_controller.dart';
import 'home_page.dart';
import 'interface/widgets_controller_interface.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(i.get())),
    Bind<ICoinRepository>((i) => CoinRepository(i.get())),
    Bind<IGeneralVersion>((i) => GeneralVersion()),
    Bind<IWidGetController>((i) => WidGetController())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/home', child: (_, args) => HomePage()),
  ];
}
