import 'package:covid19monitorbahia/app/app_controller.dart';
import 'package:covid19monitorbahia/shared/auth/auth_controller.dart';
import 'package:covid19monitorbahia/shared/auth/repositories/auth_repository.dart';
import 'package:covid19monitorbahia/shared/auth/repositories/auth_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:covid19monitorbahia/app/app_widget.dart';
import 'package:covid19monitorbahia/app/modules/home/home_module.dart';

import 'modules/home/login/login_controller.dart';
import 'modules/home/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => LoginController()),
        Bind((i) => AuthController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        //Bind<IFirebaseStorageRepository>((i) => FirebaseStorageRepository(Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/login', module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
