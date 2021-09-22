import 'package:flutter_modular/flutter_modular.dart';
import '../../shared/interface/coin_repository_interface.dart';
import '../../shared/repository/coin_repository.dart';
import 'controllers/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(i.get())),
    Bind<ICoinRepository>((i) => CoinRepository(i.get()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/home', child: (_, args) => HomePage()),
  ];
}
