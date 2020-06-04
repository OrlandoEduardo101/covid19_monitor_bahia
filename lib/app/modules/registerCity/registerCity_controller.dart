import 'package:covid19monitorbahia/app/shared/storage/model/city_model.dart';
import 'package:covid19monitorbahia/app/shared/storage/repositories/firebaseStorage_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'registerCity_controller.g.dart';

class RegisterCityController = _RegisterCityControllerBase
    with _$RegisterCityController;

abstract class _RegisterCityControllerBase with Store {
  final IFirebaseStorageRepository repository;

  @observable
  CityModel city = CityModel();

  @observable
  ObservableStream<List<CityModel>> cityList;

  _RegisterCityControllerBase({this.repository}){
    getList();
  }

  @action
  Stream<List<CityModel>> getList() {
      cityList = repository.getData().asObservable();
    }

  @action
  Future set(CityModel city) {
    print("Nome: " + city.name);
    repository.setData(city);
    // Firestore.instance.collection('cu').add({'nome' : city.name});
  }

  @action
  Future delete(CityModel model) {
    repository.deleteData(model);
  }
}
