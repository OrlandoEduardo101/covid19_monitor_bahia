import 'package:covid19monitorbahia/app/shared/storage/model/city_model.dart';
import 'package:covid19monitorbahia/app/shared/storage/repositories/firebaseStorage_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IFirebaseStorageRepository repository;
  _HomeControllerBase({this.repository}){
    getList();
  }

  @observable
  CityModel city = CityModel();

  @observable
  ObservableStream<List<CityModel>> cityList;

  @action
  Stream<List<CityModel>> getList() {
    cityList = repository.getData().asObservable();
  }

}
