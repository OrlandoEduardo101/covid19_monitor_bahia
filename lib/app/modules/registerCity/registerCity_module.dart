import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19monitorbahia/app/modules/registerCity/pages/addCity/addCity_controller.dart';
import 'package:covid19monitorbahia/app/modules/registerCity/pages/addCity/addCity_page.dart';
import 'package:covid19monitorbahia/app/modules/registerCity/registerCity_controller.dart';
import 'package:covid19monitorbahia/app/shared/storage/repositories/firebaseStorage_repository.dart';
import 'package:covid19monitorbahia/app/shared/storage/repositories/firebaseStorage_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:covid19monitorbahia/app/modules/registerCity/registerCity_page.dart';

class RegisterCityModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AddCityController(i.get())),
        Bind((i) => RegisterCityController(repository: i.get())),
      //  Bind<IFirebaseStorageRepository>((i) => FirebaseStorageRepository(firestore: Firestore.instance)),

  ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => RegisterCityPage()),
        Router('/addCity', child: (_, args) => AddCityPage()),
      ];

  static Inject get to => Inject<RegisterCityModule>.of();
}
