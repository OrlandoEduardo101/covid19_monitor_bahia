import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19monitorbahia/app/modules/registerCity/pages/addCity/addCity_controller.dart';
import 'package:covid19monitorbahia/app/modules/registerCity/registerCity_controller.dart';
import 'package:covid19monitorbahia/app/modules/registerCity/registerCity_module.dart';
import 'package:covid19monitorbahia/app/shared/storage/repositories/firebaseStorage_repository.dart';
import 'package:covid19monitorbahia/app/app_controller.dart';
import 'package:covid19monitorbahia/app/shared/auth/auth_controller.dart';
import 'package:covid19monitorbahia/app/shared/auth/repositories/auth_repository.dart';
import 'package:covid19monitorbahia/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:covid19monitorbahia/app/shared/storage/repositories/firebaseStorage_repository_interface.dart';
import 'package:covid19monitorbahia/app/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:covid19monitorbahia/app/app_widget.dart';
import 'package:covid19monitorbahia/app/modules/home/home_module.dart';
import 'modules/login/login_controller.dart';
import 'modules/login/login_module.dart';
import 'modules/registerCity/pages/addCity/addCity_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
       // Bind((i) => FirebaseStorageRepository()),
        Bind((i) => AppController()),
        Bind((i) => RegisterCityController(repository: i.get())),
        Bind((i) => AddCityController(i.get())),
        Bind((i) => LoginController()),
        Bind((i) => AuthController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind<IFirebaseStorageRepository>((i) => FirebaseStorageRepository(Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/login', module: LoginModule()),
        Router('/register', module: RegisterCityModule()),
        Router('/splash', child: (_, args) => SplashPage()),
        Router('/addCity', child: (_, args) => AddCityPage()),
  ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
