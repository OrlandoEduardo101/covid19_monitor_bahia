import 'package:covid19monitorbahia/app/modules/home/home_controller.dart';
import 'package:covid19monitorbahia/app/modules/login/login_module.dart';
import 'package:covid19monitorbahia/app/modules/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:covid19monitorbahia/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(repository: i.get())),
        Bind((i) => LoginModule()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/home', child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
