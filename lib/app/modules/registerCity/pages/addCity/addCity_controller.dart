import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19monitorbahia/app/shared/storage/model/city_model.dart';
import 'package:covid19monitorbahia/app/shared/storage/repositories/firebaseStorage_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'addCity_controller.g.dart';

class AddCityController = _AddCityControllerBase with _$AddCityController;

abstract class _AddCityControllerBase with Store {
  final IFirebaseStorageRepository repository;

  @observable
  CityModel city = CityModel();

  @observable
  int value = 0;

  _AddCityControllerBase([this.repository]);

  @action
  Future set() {
    print("Nome: " + city.name);
    repository.setData(city);
   // Firestore.instance.collection('cu').add({'nome' : city.name});
    /* {
          'name': city.name,
          'uf': city.uf,
          'suspeitos': city.suspeitos,
          'confirmados': city.confirmados,
          'importados': city.importados,
          'monitoramento': city.monitoramento,
          'descartados': city.descartados,
          'curados': city.curados,
        }*/
  }
}
