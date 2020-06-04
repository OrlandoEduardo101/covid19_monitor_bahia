import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19monitorbahia/app/modules/home/login/stores/exception_store.dart';
import 'package:covid19monitorbahia/shared/auth/repositories/auth_repository.dart';
import 'package:covid19monitorbahia/shared/auth/repositories/auth_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'components/textError/textError_controller.dart';
import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TextErrorController()),
        Bind((i) => LoginController()),
        Bind((i) => ExceptionStore()),

      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => LoginPage(),
            transition: TransitionType.noTransition),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
